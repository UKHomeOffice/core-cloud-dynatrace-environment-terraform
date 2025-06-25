variable "aws_monitoring_profile_alerting_rules" {
  type = map(object({
    include_mode = optional(string, "NONE") 
    tags = optional(list(string), ["intentional_invalid_tag"]) 
    delay_in_minutes = optional(number, 0)
  }))
}

variable "awsmonitoringprofile_alert_config" {
  type = object({
    # generic config for aws monitoring profile alerts
    notify_closed_problem             = bool
    slack_notification_enabled        = bool
    slack_message                     = string
    slack_notification_name           = string
    slack_url                         = string
    channel_name                      = string
    samples                           = string
    violating_samples                 = string
  })
}