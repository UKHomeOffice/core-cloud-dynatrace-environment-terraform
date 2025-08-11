variable "aws_monitoring_profile_alert_config" {
  type = object({
    # generic config for aws monitoring profile alerts
    notify_closed_problem             = bool
    slack_notification_enabled        = bool
    slack_message                     = string
    slack_notification_name           = string
    channel_name                      = string
    enabled                           = bool
  })
}

variable "aws_monitoring_profile_alerting_rules" {
  type = object({
    include_mode = optional(string, "NONE") 
    tags = optional(list(string), []) 
    delay_in_minutes = optional(number, 0)
  })
}

variable "SLACK_NOTIFICATION_URLS" {
  type = map(string)
  description = "A map with keys matching the keys under 'ghes_alert_configs' with the relevant channels' urls."
  sensitive = true
}
