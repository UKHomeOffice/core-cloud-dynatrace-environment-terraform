terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_k8s_monitoring" "k8s_monitoring_config" {
  cloud_application_pipeline_enabled = var.metrics_enabled

  # only include events matching patterns below
  filter_events           = true
  event_processing_active = true

  # don't include all FDI (full stack) events
  include_all_fdi_events = false

  open_metrics_builtin_enabled = true

  # Prometheus exporters
  open_metrics_pipeline_enabled = false

  # Dynamically render event_patterns → event_pattern blocks
  dynamic "event_patterns" {
    for_each = length(var.event_patterns) > 0 ? [1] : []
    content {
      dynamic "event_pattern" {
        for_each = var.event_patterns
        content {
          active  = event_pattern.value.active
          label   = event_pattern.value.label
          pattern = event_pattern.value.pattern
        }
      }
    }
  }

}
