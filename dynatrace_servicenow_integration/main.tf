terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_alerting" "servicenow_alert" {
  name = "servicenow_alert"
  rules {
    dynamic "rule" {
      for_each = var.servicenow_alerting_rules
      content {
        include_mode = rule.value.include_mode
        tags = rule.value.tags
        delay_in_minutes = rule.value.delay_in_minutes
        severity_level = rule.key
      }
    }
  }
}

resource "dynatrace_webhook_notification" "service_now_integration" {
  active    = true
  name      = "servicenow_integration"
  profile   = dynatrace_alerting.servicenow_alert.id
  url       = var.SERVICENOW_END_POINT
  insecure  = true # TODO (to confirm that this reflects - 'Accept SSL' which is set to FALSE in the page https://collaboration.homeoffice.gov.uk/pages/viewpage.action?pageId=353049956)
  notify_event_merges = true
  notify_closed_problems = true
  use_oauth_2            = true
  oauth_2_credentials {
    access_token_url = "https://${var.SERVICENOW_ENV_ID}.service-now.com/oauth_token.do"
    client_id        = var.SERVICENOW_CLIENT_ID
    client_secret    = var.SERVICENOW_CLIENT_SECRET
  }
  payload = "{\n  ${join(",\n  ", [for ky, val in var.servicenow_payload : "\"${ky}\": ${val}"])}\n}"
}
