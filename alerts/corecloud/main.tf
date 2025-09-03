terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

locals {
  alerting_profile_ids_by_name = {
    for key, profile in dynatrace_alerting.corecloud_profile :
    profile.name => profile.id
  }
}

data "dynatrace_management_zone_v2" "zones" {
  for_each = var.corecloud_profile_alerting_rules
  name     = each.value.management_zone
}

resource "dynatrace_slack_notification" "slack_alerts" {
  for_each = var.corecloud_alert_configs

  active  = each.value.slack_notification_enabled
  name    = each.value.slack_notification_name
  profile = local.alerting_profile_ids_by_name[each.value.alerting_profile_name]
  url     = var.slack_webhook_urls[each.key]
  channel = each.value.channel_name
  message = each.value.slack_message
}

resource "dynatrace_alerting" "corecloud_profile" {
    for_each        = var.corecloud_profile_alerting_rules
    name            = each.value.alerting_profile_name
    management_zone = data.dynatrace_management_zone_v2.zones[each.key].id
    rules {
        dynamic "rule" {
            for_each = each.value.rules
            content {
                include_mode = rule.value.include_mode
                tags = rule.value.tags
                delay_in_minutes = rule.value.delay_in_minutes
                severity_level = rule.key
      }
    }
  }
}
