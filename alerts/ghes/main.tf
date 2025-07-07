# memory warning alerts
resource "dynatrace_metric_events" "freeable_memory_warning_alerts" {
  count                      = var.ghes_metrics.memory_usage.warning.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.memory_usage.warning.enabled
  event_entity_dimension_key = var.ghes_metrics.common_ghes_values.event_entity_dimension_key
  summary                    = var.ghes_metrics.memory_usage.summary
  event_template {
    description = var.ghes_metrics.memory_usage.description
    davis_merge = var.ghes_metrics.common_ghes_values.davis_merge
    event_type  = var.ghes_metrics.common_ghes_values.event_type
    title       = var.ghes_metrics.memory_usage.warning.title
    metadata {
      metadata_key   = var.ghes_metrics.common_ghes_values.tag_key
      metadata_value = var.ghes_metrics.common_ghes_values.tag_value
    }
  }
  model_properties {
    type               = var.ghes_metrics.common_ghes_values.model_properties_type
    alert_condition    = var.ghes_metrics.memory_usage.alert_condition
    alert_on_no_data   = var.ghes_metrics.common_ghes_values.alert_on_no_data
    dealerting_samples = var.ghes_metrics.memory_usage.dealerting_samples
    samples            = var.ghes_metrics.common_ghes_values.samples
    threshold          = var.ghes_metrics.memory_usage.warning.threshold
    violating_samples  = var.ghes_metrics.common_ghes_values.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.memory_usage.query_definition_type
    aggregation = var.ghes_metrics.memory_usage.aggregation
    metric_key  = var.ghes_metrics.memory_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_metrics.common_ghes_values.dimension_key
        dimension_value = var.ghes_metrics.common_ghes_values.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_metrics.common_ghes_values.dimension_key
      conditions {
        condition {
          type     = var.ghes_metrics.common_ghes_values.entity_filter_condition1_type
          operator = var.ghes_metrics.common_ghes_values.entity_filter_condition1_operator
          value    = var.ghes_metrics.common_ghes_values.entity_filter_condition1_value
        }
      }
    }
  }
}

# memory critical alerts
resource "dynatrace_metric_events" "freeable_memory_critical_alerts" {
  count                      = var.ghes_metrics.memory_usage.critical.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.memory_usage.critical.enabled
  event_entity_dimension_key = var.ghes_metrics.common_ghes_values.event_entity_dimension_key
  summary                    = var.ghes_metrics.memory_usage.summary
  event_template {
    description = var.ghes_metrics.memory_usage.description
    davis_merge = var.ghes_metrics.common_ghes_values.davis_merge
    event_type  = var.ghes_metrics.common_ghes_values.event_type
    title       = var.ghes_metrics.memory_usage.critical.title
    metadata {
      metadata_key   = var.ghes_metrics.common_ghes_values.tag_key
      metadata_value = var.ghes_metrics.common_ghes_values.tag_value
    }
  }
  model_properties {
    type               = var.ghes_metrics.common_ghes_values.model_properties_type
    alert_condition    = var.ghes_metrics.memory_usage.alert_condition
    alert_on_no_data   = var.ghes_metrics.common_ghes_values.alert_on_no_data
    dealerting_samples = var.ghes_metrics.memory_usage.dealerting_samples
    samples            = var.ghes_metrics.common_ghes_values.samples
    threshold          = var.ghes_metrics.memory_usage.critical.threshold
    violating_samples  = var.ghes_metrics.common_ghes_values.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.memory_usage.query_definition_type
    aggregation = var.ghes_metrics.memory_usage.aggregation
    metric_key  = var.ghes_metrics.memory_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_metrics.common_ghes_values.dimension_key
        dimension_value = var.ghes_metrics.common_ghes_values.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_metrics.common_ghes_values.dimension_key
      conditions {
        condition {
          type     = var.ghes_metrics.common_ghes_values.entity_filter_condition1_type
          operator = var.ghes_metrics.common_ghes_values.entity_filter_condition1_operator
          value    = var.ghes_metrics.common_ghes_values.entity_filter_condition1_value
        }
      }
    }
  }
}

# cpu warning alerts
resource "dynatrace_metric_events" "cpu_utilization_warning_alerts" {
  count                      = var.ghes_metrics.cpu_usage.warning.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.cpu_usage.warning.enabled
  event_entity_dimension_key = var.ghes_metrics.common_ghes_values.event_entity_dimension_key
  summary                    = var.ghes_metrics.cpu_usage.summary
  event_template {
    description = var.ghes_metrics.cpu_usage.description
    davis_merge = var.ghes_metrics.common_ghes_values.davis_merge
    event_type  = var.ghes_metrics.common_ghes_values.event_type
    title       = var.ghes_metrics.cpu_usage.warning.title
    metadata {
      metadata_key   = var.ghes_metrics.common_ghes_values.tag_key
      metadata_value = var.ghes_metrics.common_ghes_values.tag_value
    }
  }
  model_properties {
    type               = var.ghes_metrics.common_ghes_values.model_properties_type
    alert_condition    = var.ghes_metrics.cpu_usage.alert_condition
    alert_on_no_data   = var.ghes_metrics.common_ghes_values.alert_on_no_data
    dealerting_samples = var.ghes_metrics.cpu_usage.dealerting_samples
    samples            = var.ghes_metrics.common_ghes_values.samples
    threshold          = var.ghes_metrics.cpu_usage.warning.threshold
    violating_samples  = var.ghes_metrics.common_ghes_values.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.cpu_usage.query_definition_type
    aggregation = var.ghes_metrics.cpu_usage.aggregation
    metric_key  = var.ghes_metrics.cpu_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_metrics.common_ghes_values.dimension_key
        dimension_value = var.ghes_metrics.common_ghes_values.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_metrics.common_ghes_values.dimension_key
      conditions {
        condition {
          type     = var.ghes_metrics.common_ghes_values.entity_filter_condition1_type
          operator = var.ghes_metrics.common_ghes_values.entity_filter_condition1_operator
          value    = var.ghes_metrics.common_ghes_values.entity_filter_condition1_value
        }
      }
    }
  }
}

# cpu critical alerts
resource "dynatrace_metric_events" "cpu_utilization_critical_alerts" {
  count                      = var.ghes_metrics.cpu_usage.critical.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.cpu_usage.critical.enabled
  event_entity_dimension_key = var.ghes_metrics.common_ghes_values.event_entity_dimension_key
  summary                    = var.ghes_metrics.cpu_usage.summary
  event_template {
    description = var.ghes_metrics.cpu_usage.description
    davis_merge = var.ghes_metrics.common_ghes_values.davis_merge
    event_type  = var.ghes_metrics.common_ghes_values.event_type
    title       = var.ghes_metrics.cpu_usage.critical.title
    metadata {
      metadata_key   = var.ghes_metrics.common_ghes_values.tag_key
      metadata_value = var.ghes_metrics.common_ghes_values.tag_value
    }
  }
  model_properties {
    type               = var.ghes_metrics.common_ghes_values.model_properties_type
    alert_condition    = var.ghes_metrics.cpu_usage.alert_condition
    alert_on_no_data   = var.ghes_metrics.common_ghes_values.alert_on_no_data
    dealerting_samples = var.ghes_metrics.cpu_usage.dealerting_samples
    samples            = var.ghes_metrics.common_ghes_values.samples
    threshold          = var.ghes_metrics.cpu_usage.critical.threshold
    violating_samples  = var.ghes_metrics.common_ghes_values.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.cpu_usage.query_definition_type
    aggregation = var.ghes_metrics.cpu_usage.aggregation
    metric_key  = var.ghes_metrics.cpu_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_metrics.common_ghes_values.dimension_key
        dimension_value = var.ghes_metrics.common_ghes_values.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_metrics.common_ghes_values.dimension_key
      conditions {
        condition {
          type     = var.ghes_metrics.common_ghes_values.entity_filter_condition1_type
          operator = var.ghes_metrics.common_ghes_values.entity_filter_condition1_operator
          value    = var.ghes_metrics.common_ghes_values.entity_filter_condition1_value
        }
      }
    }
  }
}

# disk warning alerts
resource "dynatrace_metric_events" "ghes_disk_utilization_warning_alerts" {
  count                      = var.ghes_metrics.disk_usage.warning.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.disk_usage.warning.enabled
  event_entity_dimension_key = var.ghes_metrics.common_ghes_values.event_entity_dimension_key
  summary                    = var.ghes_metrics.disk_usage.summary
  event_template {
    description = var.ghes_metrics.disk_usage.description
    davis_merge = var.ghes_metrics.common_ghes_values.davis_merge
    event_type  = var.ghes_metrics.common_ghes_values.event_type
    title       = var.ghes_metrics.disk_usage.warning.title
    metadata {
      metadata_key   = var.ghes_metrics.common_ghes_values.tag_key
      metadata_value = var.ghes_metrics.common_ghes_values.tag_value
    }
  }
  model_properties {
    type               = var.ghes_metrics.common_ghes_values.model_properties_type
    alert_condition    = var.ghes_metrics.disk_usage.alert_condition
    alert_on_no_data   = var.ghes_metrics.common_ghes_values.alert_on_no_data
    dealerting_samples = var.ghes_metrics.disk_usage.dealerting_samples
    samples            = var.ghes_metrics.common_ghes_values.samples
    threshold          = var.ghes_metrics.disk_usage.warning.threshold
    violating_samples  = var.ghes_metrics.common_ghes_values.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.disk_usage.query_definition_type
    aggregation = var.ghes_metrics.disk_usage.aggregation
    metric_key  = var.ghes_metrics.disk_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_metrics.common_ghes_values.dimension_key
        dimension_value = var.ghes_metrics.common_ghes_values.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_metrics.common_ghes_values.dimension_key
      conditions {
        condition {
          type     = var.ghes_metrics.common_ghes_values.entity_filter_condition1_type
          operator = var.ghes_metrics.common_ghes_values.entity_filter_condition1_operator
          value    = var.ghes_metrics.common_ghes_values.entity_filter_condition1_value
        }
      }
    }
  }
}

# disk critical alerts
resource "dynatrace_metric_events" "ghes_disk_utilization_critical_alerts" {
  count                      = var.ghes_metrics.disk_usage.critical.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.disk_usage.critical.enabled
  event_entity_dimension_key = var.ghes_metrics.common_ghes_values.event_entity_dimension_key
  summary                    = var.ghes_metrics.disk_usage.summary
  event_template {
    description = var.ghes_metrics.disk_usage.description
    davis_merge = var.ghes_metrics.common_ghes_values.davis_merge
    event_type  = var.ghes_metrics.common_ghes_values.event_type
    title       = var.ghes_metrics.disk_usage.critical.title
    metadata {
      metadata_key   = var.ghes_metrics.common_ghes_values.tag_key
      metadata_value = var.ghes_metrics.common_ghes_values.tag_value
    }
  }
  model_properties {
    type               = var.ghes_metrics.common_ghes_values.model_properties_type
    alert_condition    = var.ghes_metrics.disk_usage.alert_condition
    alert_on_no_data   = var.ghes_metrics.common_ghes_values.alert_on_no_data
    dealerting_samples = var.ghes_metrics.disk_usage.dealerting_samples
    samples            = var.ghes_metrics.common_ghes_values.samples
    threshold          = var.ghes_metrics.disk_usage.critical.threshold
    violating_samples  = var.ghes_metrics.common_ghes_values.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.disk_usage.query_definition_type
    aggregation = var.ghes_metrics.disk_usage.aggregation
    metric_key  = var.ghes_metrics.disk_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_metrics.common_ghes_values.dimension_key
        dimension_value = var.ghes_metrics.common_ghes_values.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_metrics.common_ghes_values.dimension_key
      conditions {
        condition {
          type     = var.ghes_metrics.common_ghes_values.entity_filter_condition1_type
          operator = var.ghes_metrics.common_ghes_values.entity_filter_condition1_operator
          value    = var.ghes_metrics.common_ghes_values.entity_filter_condition1_value
        }
      }
    }
  }
}
