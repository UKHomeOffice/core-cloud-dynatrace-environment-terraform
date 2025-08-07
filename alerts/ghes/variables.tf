variable "ghes_alert_configs" {
  type = map(object({
    # generic config for ghes alerts
    enabled                    = bool
    alerting_profile_name      = string
    notify_closed_problem      = bool
    include_mode               = string
    delay_in_minutes           = string
    slack_notification_enabled = bool
    slack_message              = string
    slack_notification_name    = string
    slack_url                  = string
    channel_name               = string
    tag_key                    = string
    tag_value                  = string
    filter_enabled             = string
    message_status             = string
  }))
}

variable "bcp_alerting" {
  type = object({
    enabled               = bool
    alerting_profile_name = string
    include_mode          = string
    delay_in_minutes      = number
    tag_key               = string
    tag_value             = string
    email_name            = string
    email_subject         = string
    email_to              = list(string)
  })
}

variable "GHES_SLACK_URLS" {
  type = map(string)
  description = "Slack urls to send GHES notifications."
  sensitive = true
}

