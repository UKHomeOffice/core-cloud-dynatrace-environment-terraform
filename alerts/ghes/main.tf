terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_slack_notification" "slack_alerts" {
  active  = each.value.slack_notification_enabled
  name    = each.value.slack_notification_name
  profile = dynatrace_alerting.ghes_alert_profiles[each.key].id
  url     = each.value.slack_url
  channel = each.value.channel_name
  message = each.value.slack_message
}



resource "dynatrace_alerting" "ghes_alert_profiles" {
  for_each = var.ghes_alert_configs

  name = each.value.alerting_profile_name

  rules {
    rule {
      include_mode     = each.value.include_mode
      delay_in_minutes = each.value.delay_in_minutes
      severity_level   = "AVAILABILITY"
    }
    rule {
      include_mode     = each.value.include_mode
      delay_in_minutes = each.value.delay_in_minutes
      severity_level   = "CUSTOM_ALERT"
    }
    rule {
      include_mode     = each.value.include_mode
      delay_in_minutes = each.value.delay_in_minutes
      severity_level   = "ERRORS"
    }
    rule {
      include_mode     = each.value.include_mode
      delay_in_minutes = each.value.delay_in_minutes
      severity_level   = "MONITORING_UNAVAILABLE"
    }
    rule {
      include_mode     = each.value.include_mode
      delay_in_minutes = each.value.delay_in_minutes
      severity_level   = "PERFORMANCE"
    }
    rule {
      include_mode     = each.value.include_mode
      delay_in_minutes = each.value.delay_in_minutes
      severity_level   = "RESOURCE_CONTENTION"
    }
  }

  filters {
    filter {
      custom {
        metadata {
          items {
            filter {
              key   = each.value.tag_key
              value = each.value.tag_value
            }
          }
        }
      }
    }
  }
}
