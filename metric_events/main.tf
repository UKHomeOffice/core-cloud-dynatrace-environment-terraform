terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

# memory warning alerts
resource "dynatrace_metric_events" "freeable_memory_warning_alerts" {
  count                      = var.metrics_vars.memory_usage.warning.enabled == true ? 1 : 0
  enabled                    = var.metrics_vars.memory_usage.warning.enabled
  event_entity_dimension_key = var.common_metrics_vars.event_entity_dimension_key
  summary                    = var.metrics_vars.memory_usage.summary
  event_template {
    description = var.metrics_vars.memory_usage.description
    davis_merge = var.common_metrics_vars.davis_merge
    event_type  = var.common_metrics_vars.event_type
    title       = var.metrics_vars.memory_usage.warning.title
    metadata {
      metadata_key   = var.common_metrics_vars.tag_key
      metadata_value = var.common_metrics_vars.tag_value
    }
  }
  model_properties {
    type               = var.common_metrics_vars.model_properties_type
    alert_condition    = var.metrics_vars.memory_usage.alert_condition
    alert_on_no_data   = var.common_metrics_vars.alert_on_no_data
    dealerting_samples = var.metrics_vars.memory_usage.dealerting_samples
    samples            = var.common_metrics_vars.samples
    threshold          = var.metrics_vars.memory_usage.warning.threshold
    violating_samples  = var.common_metrics_vars.violating_samples
  }
  query_definition {
    type        = var.metrics_vars.memory_usage.query_definition_type
    aggregation = var.metrics_vars.memory_usage.aggregation
    metric_key  = var.metrics_vars.memory_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_metrics_vars.dimension_key
        dimension_value = var.common_metrics_vars.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_metrics_vars.dimension_key
      conditions {
        condition {
          type     = var.common_metrics_vars.entity_filter_condition1_type
          operator = var.common_metrics_vars.entity_filter_condition1_operator
          value    = var.common_metrics_vars.entity_filter_condition1_value
        }
      }
    }
  }
}

# memory critical alerts
resource "dynatrace_metric_events" "freeable_memory_critical_alerts" {
  count                      = var.metrics_vars.memory_usage.critical.enabled == true ? 1 : 0
  enabled                    = var.metrics_vars.memory_usage.critical.enabled
  event_entity_dimension_key = var.common_metrics_vars.event_entity_dimension_key
  summary                    = var.metrics_vars.memory_usage.summary
  event_template {
    description = var.metrics_vars.memory_usage.description
    davis_merge = var.common_metrics_vars.davis_merge
    event_type  = var.common_metrics_vars.event_type
    title       = var.metrics_vars.memory_usage.critical.title
    metadata {
      metadata_key   = var.common_metrics_vars.tag_key
      metadata_value = var.common_metrics_vars.tag_value
    }
  }
  model_properties {
    type               = var.common_metrics_vars.model_properties_type
    alert_condition    = var.metrics_vars.memory_usage.alert_condition
    alert_on_no_data   = var.common_metrics_vars.alert_on_no_data
    dealerting_samples = var.metrics_vars.memory_usage.dealerting_samples
    samples            = var.common_metrics_vars.samples
    threshold          = var.metrics_vars.memory_usage.critical.threshold
    violating_samples  = var.common_metrics_vars.violating_samples
  }
  query_definition {
    type        = var.metrics_vars.memory_usage.query_definition_type
    aggregation = var.metrics_vars.memory_usage.aggregation
    metric_key  = var.metrics_vars.memory_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_metrics_vars.dimension_key
        dimension_value = var.common_metrics_vars.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_metrics_vars.dimension_key
      conditions {
        condition {
          type     = var.common_metrics_vars.entity_filter_condition1_type
          operator = var.common_metrics_vars.entity_filter_condition1_operator
          value    = var.common_metrics_vars.entity_filter_condition1_value
        }
      }
    }
  }
}

# cpu warning alerts
resource "dynatrace_metric_events" "cpu_utilization_warning_alerts" {
  count                      = var.metrics_vars.cpu_usage.warning.enabled == true ? 1 : 0
  enabled                    = var.metrics_vars.cpu_usage.warning.enabled
  event_entity_dimension_key = var.common_metrics_vars.event_entity_dimension_key
  summary                    = var.metrics_vars.cpu_usage.summary
  event_template {
    description = var.metrics_vars.cpu_usage.description
    davis_merge = var.common_metrics_vars.davis_merge
    event_type  = var.common_metrics_vars.event_type
    title       = var.metrics_vars.cpu_usage.warning.title
    metadata {
      metadata_key   = var.common_metrics_vars.tag_key
      metadata_value = var.common_metrics_vars.tag_value
    }
  }
  model_properties {
    type               = var.common_metrics_vars.model_properties_type
    alert_condition    = var.metrics_vars.cpu_usage.alert_condition
    alert_on_no_data   = var.common_metrics_vars.alert_on_no_data
    dealerting_samples = var.metrics_vars.cpu_usage.dealerting_samples
    samples            = var.common_metrics_vars.samples
    threshold          = var.metrics_vars.cpu_usage.warning.threshold
    violating_samples  = var.common_metrics_vars.violating_samples
  }
  query_definition {
    type        = var.metrics_vars.cpu_usage.query_definition_type
    aggregation = var.metrics_vars.cpu_usage.aggregation
    metric_key  = var.metrics_vars.cpu_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_metrics_vars.dimension_key
        dimension_value = var.common_metrics_vars.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_metrics_vars.dimension_key
      conditions {
        condition {
          type     = var.common_metrics_vars.entity_filter_condition1_type
          operator = var.common_metrics_vars.entity_filter_condition1_operator
          value    = var.common_metrics_vars.entity_filter_condition1_value
        }
      }
    }
  }
}

# cpu critical alerts
resource "dynatrace_metric_events" "cpu_utilization_critical_alerts" {
  count                      = var.metrics_vars.cpu_usage.critical.enabled == true ? 1 : 0
  enabled                    = var.metrics_vars.cpu_usage.critical.enabled
  event_entity_dimension_key = var.common_metrics_vars.event_entity_dimension_key
  summary                    = var.metrics_vars.cpu_usage.summary
  event_template {
    description = var.metrics_vars.cpu_usage.description
    davis_merge = var.common_metrics_vars.davis_merge
    event_type  = var.common_metrics_vars.event_type
    title       = var.metrics_vars.cpu_usage.critical.title
    metadata {
      metadata_key   = var.common_metrics_vars.tag_key
      metadata_value = var.common_metrics_vars.tag_value
    }
  }
  model_properties {
    type               = var.common_metrics_vars.model_properties_type
    alert_condition    = var.metrics_vars.cpu_usage.alert_condition
    alert_on_no_data   = var.common_metrics_vars.alert_on_no_data
    dealerting_samples = var.metrics_vars.cpu_usage.dealerting_samples
    samples            = var.common_metrics_vars.samples
    threshold          = var.metrics_vars.cpu_usage.critical.threshold
    violating_samples  = var.common_metrics_vars.violating_samples
  }
  query_definition {
    type        = var.metrics_vars.cpu_usage.query_definition_type
    aggregation = var.metrics_vars.cpu_usage.aggregation
    metric_key  = var.metrics_vars.cpu_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_metrics_vars.dimension_key
        dimension_value = var.common_metrics_vars.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_metrics_vars.dimension_key
      conditions {
        condition {
          type     = var.common_metrics_vars.entity_filter_condition1_type
          operator = var.common_metrics_vars.entity_filter_condition1_operator
          value    = var.common_metrics_vars.entity_filter_condition1_value
        }
      }
    }
  }
}

# disk warning alerts
resource "dynatrace_metric_events" "ghes_disk_utilization_warning_alerts" {
  count                      = var.metrics_vars.disk_usage.warning.enabled == true ? 1 : 0
  enabled                    = var.metrics_vars.disk_usage.warning.enabled
  event_entity_dimension_key = var.common_metrics_vars.event_entity_dimension_key
  summary                    = var.metrics_vars.disk_usage.summary
  event_template {
    description = var.metrics_vars.disk_usage.description
    davis_merge = var.common_metrics_vars.davis_merge
    event_type  = var.common_metrics_vars.event_type
    title       = var.metrics_vars.disk_usage.warning.title
    metadata {
      metadata_key   = var.common_metrics_vars.tag_key
      metadata_value = var.common_metrics_vars.tag_value
    }
  }
  model_properties {
    type               = var.common_metrics_vars.model_properties_type
    alert_condition    = var.metrics_vars.disk_usage.alert_condition
    alert_on_no_data   = var.common_metrics_vars.alert_on_no_data
    dealerting_samples = var.metrics_vars.disk_usage.dealerting_samples
    samples            = var.common_metrics_vars.samples
    threshold          = var.metrics_vars.disk_usage.warning.threshold
    violating_samples  = var.common_metrics_vars.violating_samples
  }
  query_definition {
    type        = var.metrics_vars.disk_usage.query_definition_type
    aggregation = var.metrics_vars.disk_usage.aggregation
    metric_key  = var.metrics_vars.disk_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_metrics_vars.dimension_key
        dimension_value = var.common_metrics_vars.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_metrics_vars.dimension_key
      conditions {
        condition {
          type     = var.common_metrics_vars.entity_filter_condition1_type
          operator = var.common_metrics_vars.entity_filter_condition1_operator
          value    = var.common_metrics_vars.entity_filter_condition1_value
        }
      }
    }
  }
}

# disk critical alerts
resource "dynatrace_metric_events" "ghes_disk_utilization_critical_alerts" {
  count                      = var.metrics_vars.disk_usage.critical.enabled == true ? 1 : 0
  enabled                    = var.metrics_vars.disk_usage.critical.enabled
  event_entity_dimension_key = var.common_metrics_vars.event_entity_dimension_key
  summary                    = var.metrics_vars.disk_usage.summary
  event_template {
    description = var.metrics_vars.disk_usage.description
    davis_merge = var.common_metrics_vars.davis_merge
    event_type  = var.common_metrics_vars.event_type
    title       = var.metrics_vars.disk_usage.critical.title
    metadata {
      metadata_key   = var.common_metrics_vars.tag_key
      metadata_value = var.common_metrics_vars.tag_value
    }
  }
  model_properties {
    type               = var.common_metrics_vars.model_properties_type
    alert_condition    = var.metrics_vars.disk_usage.alert_condition
    alert_on_no_data   = var.common_metrics_vars.alert_on_no_data
    dealerting_samples = var.metrics_vars.disk_usage.dealerting_samples
    samples            = var.common_metrics_vars.samples
    threshold          = var.metrics_vars.disk_usage.critical.threshold
    violating_samples  = var.common_metrics_vars.violating_samples
  }
  query_definition {
    type        = var.metrics_vars.disk_usage.query_definition_type
    aggregation = var.metrics_vars.disk_usage.aggregation
    metric_key  = var.metrics_vars.disk_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_metrics_vars.dimension_key
        dimension_value = var.common_metrics_vars.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_metrics_vars.dimension_key
      conditions {
        condition {
          type     = var.common_metrics_vars.entity_filter_condition1_type
          operator = var.common_metrics_vars.entity_filter_condition1_operator
          value    = var.common_metrics_vars.entity_filter_condition1_value
        }
      }
    }
  }
}
