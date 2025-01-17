variable "alerting_profile_name" {
  type = string
  description = "The name of the alerting profile."
}

variable "availability_include_mode" {
  type = string
  description = "The inclusion mode for availability rule."
}

variable "availability_delay_in_minutes" {
  type = string
  description = "The delay in minutes for availability rule."
}

variable "custom_alert_include_mode" {
  type = string
  description = "The inclusion mode for custom alert rule."
}

variable "custom_alert_delay_in_minutes" {
  type = string
  description = "The delay in minutes for custom alert rule."
}

variable "errors_include_mode" {
  type = string
  description = "The inclusion mode for error alert rule."
}

variable "errors_delay_in_minutes" {
  type = string
  description = "The delay in minutes for error alert rule."
}

variable "monitoring_unavailable_include_mode" {
  type = string
  description = "The inclusion mode for monitoring unavailable alert rule."
}

variable "monitoring_unavailable_delay_in_minutes" {
  type = string
  description = "The delay in minutes for monitoring unavailable alert rule."
}

variable "performance_include_mode" {
  type = string
  description = "The inclusion mode for performance alert rule."
}

variable "performance_delay_in_minutes" {
  type = string
  description = "The delay in minutes for performance alert rule."
}

variable "resource_contention_include_mode" {
  type = string
  description = "The inclusion mode for resource contention alert rule."
}

variable "resource_contention_delay_in_minutes" {
  type = string
  description = "The delay in minutes for resource contention alert rule."
}

variable "active" {
  type = bool
  description = "The configuration is enabled"
}

variable "integration_notification_name" {
  type = string
  description = "The name of the notification configuration"
}

variable "webhook_url" {
  type = string
  description = "The URL of the WebHook endpoint"
}

variable "insecure" {
  type = bool
  default = false
  description = "Accept any, including self-signed and invalid, SSL certificate"
}

variable "notify_event_merges" {
  type = bool
  default = false
  description = "Call webhook if new events merge into existing problems"
}

variable "notify_closed_problems" {
  type = bool
  default = false
  description = "Send email if problem is closed"
}

variable "use_oauth_2" {
  type = bool
  default = false
  description = "Use OAuth 2.0 for authentication"
}

variable "access_token_url" {
  type = string
  description = "Access token URL"
}

variable "client_id" {
  type = string
  description = "Client ID"
}

variable "payload" {
  type = string
  description = "The content of the notification message"
}

variable "client_secret" {
  type = string
  description = "Client secret"
  sensitive = true
}