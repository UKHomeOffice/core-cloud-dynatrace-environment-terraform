variable "event_patterns" {
  description = "List of event pattern objects for Dynatrace K8s monitoring"
  type = list(object({
    active  = bool
    label   = string
    pattern = string
  }))
  default = [
    {
      active  = true
      label   = "Warning events" # includes failures
      pattern = "type=Warning"
    }
  ]
}

variable "metrics_enabled" {
  description = "Enable Dynatrace K8s Metrics Monitoring"
  type        = bool
  default     = true
}
