variable "tenant_vars" {
  type = any
}

variable "extension_name" {
  description = "Name of the Dynatrace hub extension"
  type        = string
}

variable "enabled" {
  description = "Enable or disable the extension"
  type        = bool
  default     = true
}

variable "description" {
  description = "Description for the Dynatrace hub extension config"
  type        = string
}

variable "management_zone" {
  description = "Management Zone this configuration will be scoped to (optional)"
  type        = string
  default     = null
}

variable "host_group" {
  description = "The host group this configuration will be scoped to (optional)"
  type        = string
  default     = null
}

variable "host" {
  description = "The host this configuration will be scoped to (optional)"
  type        = string
  default     = null
}

variable "active_gate_group" {
  description = "The active gate group this configuration will be scope to (optional)"
  type        = string
  default     = null
}

variable "extn_version" {
  description = "Version for the Dynatrace hub extension config"
  type        = string
}

variable "featureSets" {
  description = "List of feature sets for the Dynatrace extension (used for JMX and other non-Python extensions)"
  type        = list(any)
  default     = null
}

variable "activationTags" {
  type        = list(string)
  description = "List of activationTags to apply to this extension"
  # Expected format for tag: "[PROVIDER]key: value", e.g., "[AWS]dynatrace: true"
}

variable "activationContext" {
  type        = string
  description = "The activation context e.g. REMOTE for active gate based or LOCAL for oneagent based"
  default     = "LOCAL"
}

# Python certificate monitor specific variables
variable "check_hosts" {
  description = "List of hosts to check for SSL certificates (for python-certificate-monitor)"
  type = list(object({
    domain = string
    port   = number
  }))
  default = null
}

variable "port_range" {
  description = "Port range for certificate monitoring (comma-separated ports, e.g., '443,8443')"
  type        = string
  default     = null
}

variable "additional_sni" {
  description = "Additional SNI (Server Name Indication) hostnames for certificate monitoring"
  type        = list(string)
  default     = null
}

variable "debug" {
  description = "Enable debug mode for the extension"
  type        = bool
  default     = null
}

variable "enable_ua_and_metrics" {
  description = "Enable unified analysis and metrics collection"
  type        = bool
  default     = null
}

variable "alerting_configuration" {
  description = "Alerting configuration for certificate expiry warnings"
  type = object({
    expiryWarningDays  = optional(number)
    expiryCriticalDays = optional(number)
  })
  default = null
}

variable "filter_technologies" {
  description = "Filter technologies for certificate monitoring (e.g., ['PYTHON', 'JAVA'])"
  type        = list(string)
  default     = null
}

variable "log_event_interval" {
  description = "Log event interval in minutes"
  type        = number
  default     = null
}

variable "use_chrony" {
  description = "Use Chrony instead of NTP (reads from /etc/chrony.conf instead of /etc/ntp.conf)"
  type        = bool
  default     = null
}

variable "autodetected_report_errors" {
  description = "Report errors for auto-detected time servers as log messages"
  type        = bool
  default     = null
}

variable "servers" {
  description = "Manually define time servers to test against (leave empty for auto-detection)"
  type = list(object({
    server        = string
    port          = optional(number, 123)
    ntp_version   = optional(number, 4)
    report_error  = optional(bool, true)
  }))
  default = null
}

variable "debug_logging" {
  description = "Enable debug logging for troubleshooting"
  type        = bool
  default     = null
}

variable "frequency" {
  description = "Check frequency in minutes (1-15)"
  type        = number
  default     = null
}