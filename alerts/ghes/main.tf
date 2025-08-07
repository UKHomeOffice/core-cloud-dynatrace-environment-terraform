terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_slack_notification" "slack_alerts" {
  for_each = var.ghes_alert_configs

  active  = each.value.slack_notification_enabled
  name    = each.value.slack_notification_name
  profile = dynatrace_alerting.ghes_alert_profiles[each.key].id
  url     = var.GHES_SLACK_URLS[each.key]
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
    filter {
      custom {
        title {
          operator = "CONTAINS"
          value    = each.value.message_status
          enabled  = each.value.filter_enabled
        }
      }
    }

  }
}


resource "dynatrace_email_notification" "bcp_email" {
  count                  = var.bcp_alerting.enabled ? 1 : 0
  active                 = true
  name                   = var.bcp_alerting.email_name
  profile                = dynatrace_alerting.bcp_alert_profile[0].id
  subject                = var.bcp_alerting.email_subject
  to                     = var.bcp_alerting.email_to
  notify_closed_problems = false
  body                   = <<EOT
<b>Names of Impacted Entities:</b> "{NamesOfImpactedEntities}" <br/>
<b>Priority:</b> P3 <br/>
<b>Problem Title:</b> "{ProblemTitle}" <br/> 
<b>Problem DetailsText:</b> "{ProblemDetailsText}" <br/>
<b>Impacted Entities:</b> {ImpactedEntities} <br/>
<b>Impacted Entity Names:</b> "{ImpactedEntityNames}" <br/>
<b>Impacted Entity:</b> "{ImpactedEntity}" <br/>
<b>PID:</b> "{PID}" <br/>
<b>Problem ID:</b> "{ProblemID}" <br/>
<b>Problem Impact:</b> "{ProblemImpact}" <br/> 
<b>Problem Severity:</b> "{ProblemSeverity}" <br/>
<b>Problem URL:</b> "{ProblemURL}" <br/> 
<b>State:</b> "{State}" <br/>
<b>Tags:</b> "{Tags}" <br/>

{ProblemDetailsHTML}
EOT
}

resource "dynatrace_alerting" "bcp_alert_profile" {
  count = var.bcp_alerting.enabled ? 1 : 0
  name  = var.bcp_alerting.alerting_profile_name

  rules {
    rule {
      include_mode     = var.bcp_alerting.include_mode
      delay_in_minutes = var.bcp_alerting.delay_in_minutes
      severity_level   = "CUSTOM_ALERT"
    }
  }

  filters {
    filter {
      custom {
        metadata {
          items {
            filter {
              key   = var.bcp_alerting.tag_key
              value = var.bcp_alerting.tag_value
            }
          }
        }
      }
    }
  }
}

output "debug_ghes_alert_configs" {
  value = var.ghes_alert_configs
}
