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
  url     = var.AWS_MONITORING_PROFILE_SLACK_URL
  channel = var.aws_monitoring_profile_alert_config.channel_name
  message = var.aws_monitoring_profile_alert_config.slack_message
}

resource "dynatrace_alerting" "aws_monitoring_profile_alert" {
  name = "AWS Monitoring profile"
  rules {
    rule {
        include_mode = var.aws_monitoring_profile_alerting_rules.include_mode
        delay_in_minutes = var.aws_monitoring_profile_alerting_rules.delay_in_minutes
        severity_level = "ERRORS" 
        tags= var.aws_monitoring_profile_alerting_rules.tags
      }
    }
  filters {
    filter {
      custom{
        title {
        operator = "REGEX_MATCHES"
        value    = "^AWS Monitoring profile (?>\\w+) is in ERROR State"
        enabled  = var.aws_monitoring_profile_alert_config.enabled
        }
      }
    }
  }
}

