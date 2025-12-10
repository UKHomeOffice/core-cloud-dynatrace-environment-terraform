variable "cloud_application_pipeline_enabled" {
  description = "Monitor Kubernetes namespaces, services, workloads, and pods."
  type        = bool
  default     = true
}

variable "event_processing_active" {
  description = "If true, all events are monitored unless filters are applied."
  type        = bool
  default     = true
}

variable "filter_events" {
  description = "If true, only events matching event_patterns are included."
  type        = bool
  default     = true
}

variable "include_all_fdi_events" {
  description = "Include all FDI events regardless of filters."
  type        = bool
  default     = true
}

variable "open_metrics_builtin_enabled" {
  description = "Enable cAdvisor-based built-in metrics (may increase ActiveGate usage)."
  type        = bool
  default     = true
}

variable "open_metrics_pipeline_enabled" {
  description = "Enable OpenMetrics pipeline collection (see annotation guidance)."
  type        = bool
  default     = true
}

variable "event_patterns" {
  description = <<EOF
List of event pattern objects:
Each item:
{
  active  = bool
  label   = string
  pattern = string
}
EOF
  type = list(object({
    active  = bool
    label   = string
    pattern = string
  }))
  default = []
}
