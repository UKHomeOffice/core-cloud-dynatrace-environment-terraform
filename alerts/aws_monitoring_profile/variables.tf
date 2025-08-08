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

variable "SLACK_NOTIFICATION_URL" {
  type = string
  description = "Slack url to send notification by the AWS_MONITORING module."
  default = "Provided to ignore when the module is skipped in an environment."
  sensitive = true
}
