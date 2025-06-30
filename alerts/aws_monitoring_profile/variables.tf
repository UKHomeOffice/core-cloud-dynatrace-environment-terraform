variable "aws_monitoring_profile_alert_config" {
  type = object({
    # generic config for aws monitoring profile alerts
    notify_closed_problem             = bool
    slack_notification_enabled        = bool
    slack_message                     = string
    slack_notification_name           = string
    slack_url                         = string
    channel_name                      = string
    enabled                           = bool
  })
}