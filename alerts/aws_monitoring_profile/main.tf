terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_slack_notification" "slack_alerts" {
  active  = var.aws_monitoring_profile_alert_config.slack_notification_enabled
  name    = var.aws_monitoring_profile_alert_config.slack_notification_name
  profile = dynatrace_alerting.aws_monitoring_profile_alert.id
  url     = var.aws_monitoring_profile_alert_config.slack_url
  channel = var.aws_monitoring_profile_alert_config.channel_name
  message = var.aws_monitoring_profile_alert_config.slack_message
}

resource "dynatrace_alerting" "aws_monitoring_profile_alert" {
  name = "AWS Monitoring profile"
  rules {
     rule {
        include_mode = rule.value.include_mode
        tags = rule.value.tags
        delay_in_minutes = rule.value.delay_in_minutes
        severity_level = "ERRORS"
      }
    }
  filters {
    filter {
      custom{
        title {
        operator = "CONTAINS"
        value = "AWS Integration"
        }
      }
    }
  }
}

