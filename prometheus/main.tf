resource "dynatrace_k8s_monitoring" "prometheus_monitoring" {
  cloud_application_pipeline_enabled = var.cloud_application_pipeline_enabled
  event_processing_active            = var.event_processing_active
  filter_events                      = var.filter_events
  include_all_fdi_events             = var.include_all_fdi_events
  open_metrics_builtin_enabled       = var.open_metrics_builtin_enabled
  open_metrics_pipeline_enabled      = var.open_metrics_pipeline_enabled

  # Only create event_patterns if at least 1 pattern exists
  # dynamic "event_patterns" {
  #   for_each = length(var.event_patterns) > 0 ? [1] : []
  #   content {
  #     dynamic "event_pattern" {
  #       for_each = var.event_patterns
  #       content {
  #         active  = event_pattern.value.active
  #         label   = event_pattern.value.label
  #         pattern = event_pattern.value.pattern
  #       }
  #     }
  #   }
  # }
  # event_patterns {
  #   event_pattern {
  #     active  = true
  #     label   = "Node events"
  #     pattern = "involvedObject.kind=Node"
  #   }
  # }
}
