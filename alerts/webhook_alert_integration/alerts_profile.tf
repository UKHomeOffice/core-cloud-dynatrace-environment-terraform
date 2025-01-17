resource "dynatrace_alerting" "cosmos-integration-alerting-profile" {
  name            = var.alerting_profile_name
  rules {
    rule {
      include_mode     = var.availability_include_mode
      delay_in_minutes = var.availability_delay_in_minutes
      severity_level   = "AVAILABILITY"
    }
    rule {
      include_mode     = var.custom_alert_include_mode
      delay_in_minutes = var.custom_alert_delay_in_minutes
      severity_level   = "CUSTOM_ALERT"
    }
    rule {
      include_mode     = var.errors_include_mode
      delay_in_minutes = var.errors_delay_in_minutes
      severity_level   = "ERRORS"
    }
    rule {
      include_mode     = var.monitoring_unavailable_include_mode
      delay_in_minutes = var.monitoring_unavailable_delay_in_minutes
      severity_level   = "MONITORING_UNAVAILABLE"
    }
    rule {
      include_mode     = var.performance_include_mode
      delay_in_minutes = var.performance_delay_in_minutes
      severity_level   = "PERFORMANCE"
    }
    rule {
      include_mode     = var.resource_contention_include_mode
      delay_in_minutes = var.resource_contention_delay_in_minutes
      severity_level   = "RESOURCE_CONTENTION"
    }
  }
}

resource "dynatrace_webhook_notification" "snow_webhook_integration" {
  active                 = var.active
  name                   = var.integration_notification_name
  profile                = dynatrace_alerting.cosmos-integration-alerting-profile.id
  url                    = var.webhook_url
  insecure               = var.insecure
  notify_event_merges    = var.notify_event_merges
  notify_closed_problems = var.notify_closed_problems
  payload                = var.payload
  use_oauth_2            = var.use_oauth_2
  oauth_2_credentials {
    access_token_url = var.access_token_url
    client_id        = var.client_id
    client_secret    = var.client_secret
  }
}
