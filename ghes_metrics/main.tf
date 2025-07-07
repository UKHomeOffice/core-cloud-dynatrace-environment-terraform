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
  count                      = var.ghes_metrics.memory_usage.warning.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.memory_usage.warning.enabled
  event_entity_dimension_key = var.common_ghes_metrics.event_entity_dimension_key
  summary                    = var.ghes_metrics.memory_usage.summary
  event_template {
    description = var.ghes_metrics.memory_usage.description
    davis_merge = var.common_ghes_metrics.davis_merge
    event_type  = var.common_ghes_metrics.event_type
    title       = var.ghes_metrics.memory_usage.warning.title
    metadata {
      metadata_key   = var.common_ghes_metrics.tag_key
      metadata_value = var.common_ghes_metrics.tag_value
    }
  }
  model_properties {
    type               = var.common_ghes_metrics.model_properties_type
    alert_condition    = var.ghes_metrics.memory_usage.alert_condition
    alert_on_no_data   = var.common_ghes_metrics.alert_on_no_data
    dealerting_samples = var.ghes_metrics.memory_usage.dealerting_samples
    samples            = var.common_ghes_metrics.samples
    threshold          = var.ghes_metrics.memory_usage.warning.threshold
    violating_samples  = var.common_ghes_metrics.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.memory_usage.query_definition_type
    aggregation = var.ghes_metrics.memory_usage.aggregation
    metric_key  = var.ghes_metrics.memory_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_ghes_metrics.dimension_key
        dimension_value = var.common_ghes_metrics.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_ghes_metrics.dimension_key
      conditions {
        condition {
          type     = var.common_ghes_metrics.entity_filter_condition1_type
          operator = var.common_ghes_metrics.entity_filter_condition1_operator
          value    = var.common_ghes_metrics.entity_filter_condition1_value
        }
      }
    }
  }
}

# memory critical alerts
resource "dynatrace_metric_events" "freeable_memory_critical_alerts" {
  count                      = var.ghes_metrics.memory_usage.critical.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.memory_usage.critical.enabled
  event_entity_dimension_key = var.common_ghes_metrics.event_entity_dimension_key
  summary                    = var.ghes_metrics.memory_usage.summary
  event_template {
    description = var.ghes_metrics.memory_usage.description
    davis_merge = var.common_ghes_metrics.davis_merge
    event_type  = var.common_ghes_metrics.event_type
    title       = var.ghes_metrics.memory_usage.critical.title
    metadata {
      metadata_key   = var.common_ghes_metrics.tag_key
      metadata_value = var.common_ghes_metrics.tag_value
    }
  }
  model_properties {
    type               = var.common_ghes_metrics.model_properties_type
    alert_condition    = var.ghes_metrics.memory_usage.alert_condition
    alert_on_no_data   = var.common_ghes_metrics.alert_on_no_data
    dealerting_samples = var.ghes_metrics.memory_usage.dealerting_samples
    samples            = var.common_ghes_metrics.samples
    threshold          = var.ghes_metrics.memory_usage.critical.threshold
    violating_samples  = var.common_ghes_metrics.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.memory_usage.query_definition_type
    aggregation = var.ghes_metrics.memory_usage.aggregation
    metric_key  = var.ghes_metrics.memory_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_ghes_metrics.dimension_key
        dimension_value = var.common_ghes_metrics.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_ghes_metrics.dimension_key
      conditions {
        condition {
          type     = var.common_ghes_metrics.entity_filter_condition1_type
          operator = var.common_ghes_metrics.entity_filter_condition1_operator
          value    = var.common_ghes_metrics.entity_filter_condition1_value
        }
      }
    }
  }
}

# cpu warning alerts
resource "dynatrace_metric_events" "cpu_utilization_warning_alerts" {
  count                      = var.ghes_metrics.cpu_usage.warning.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.cpu_usage.warning.enabled
  event_entity_dimension_key = var.common_ghes_metrics.event_entity_dimension_key
  summary                    = var.ghes_metrics.cpu_usage.summary
  event_template {
    description = var.ghes_metrics.cpu_usage.description
    davis_merge = var.common_ghes_metrics.davis_merge
    event_type  = var.common_ghes_metrics.event_type
    title       = var.ghes_metrics.cpu_usage.warning.title
    metadata {
      metadata_key   = var.common_ghes_metrics.tag_key
      metadata_value = var.common_ghes_metrics.tag_value
    }
  }
  model_properties {
    type               = var.common_ghes_metrics.model_properties_type
    alert_condition    = var.ghes_metrics.cpu_usage.alert_condition
    alert_on_no_data   = var.common_ghes_metrics.alert_on_no_data
    dealerting_samples = var.ghes_metrics.cpu_usage.dealerting_samples
    samples            = var.common_ghes_metrics.samples
    threshold          = var.ghes_metrics.cpu_usage.warning.threshold
    violating_samples  = var.common_ghes_metrics.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.cpu_usage.query_definition_type
    aggregation = var.ghes_metrics.cpu_usage.aggregation
    metric_key  = var.ghes_metrics.cpu_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_ghes_metrics.dimension_key
        dimension_value = var.common_ghes_metrics.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_ghes_metrics.dimension_key
      conditions {
        condition {
          type     = var.common_ghes_metrics.entity_filter_condition1_type
          operator = var.common_ghes_metrics.entity_filter_condition1_operator
          value    = var.common_ghes_metrics.entity_filter_condition1_value
        }
      }
    }
  }
}

# cpu critical alerts
resource "dynatrace_metric_events" "cpu_utilization_critical_alerts" {
  count                      = var.ghes_metrics.cpu_usage.critical.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.cpu_usage.critical.enabled
  event_entity_dimension_key = var.common_ghes_metrics.event_entity_dimension_key
  summary                    = var.ghes_metrics.cpu_usage.summary
  event_template {
    description = var.ghes_metrics.cpu_usage.description
    davis_merge = var.common_ghes_metrics.davis_merge
    event_type  = var.common_ghes_metrics.event_type
    title       = var.ghes_metrics.cpu_usage.critical.title
    metadata {
      metadata_key   = var.common_ghes_metrics.tag_key
      metadata_value = var.common_ghes_metrics.tag_value
    }
  }
  model_properties {
    type               = var.common_ghes_metrics.model_properties_type
    alert_condition    = var.ghes_metrics.cpu_usage.alert_condition
    alert_on_no_data   = var.common_ghes_metrics.alert_on_no_data
    dealerting_samples = var.ghes_metrics.cpu_usage.dealerting_samples
    samples            = var.common_ghes_metrics.samples
    threshold          = var.ghes_metrics.cpu_usage.critical.threshold
    violating_samples  = var.common_ghes_metrics.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.cpu_usage.query_definition_type
    aggregation = var.ghes_metrics.cpu_usage.aggregation
    metric_key  = var.ghes_metrics.cpu_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_ghes_metrics.dimension_key
        dimension_value = var.common_ghes_metrics.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_ghes_metrics.dimension_key
      conditions {
        condition {
          type     = var.common_ghes_metrics.entity_filter_condition1_type
          operator = var.common_ghes_metrics.entity_filter_condition1_operator
          value    = var.common_ghes_metrics.entity_filter_condition1_value
        }
      }
    }
  }
}

# disk warning alerts
resource "dynatrace_metric_events" "ghes_disk_utilization_warning_alerts" {
  count                      = var.ghes_metrics.disk_usage.warning.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.disk_usage.warning.enabled
  event_entity_dimension_key = var.common_ghes_metrics.event_entity_dimension_key
  summary                    = var.ghes_metrics.disk_usage.summary
  event_template {
    description = var.ghes_metrics.disk_usage.description
    davis_merge = var.common_ghes_metrics.davis_merge
    event_type  = var.common_ghes_metrics.event_type
    title       = var.ghes_metrics.disk_usage.warning.title
    metadata {
      metadata_key   = var.common_ghes_metrics.tag_key
      metadata_value = var.common_ghes_metrics.tag_value
    }
  }
  model_properties {
    type               = var.common_ghes_metrics.model_properties_type
    alert_condition    = var.ghes_metrics.disk_usage.alert_condition
    alert_on_no_data   = var.common_ghes_metrics.alert_on_no_data
    dealerting_samples = var.ghes_metrics.disk_usage.dealerting_samples
    samples            = var.common_ghes_metrics.samples
    threshold          = var.ghes_metrics.disk_usage.warning.threshold
    violating_samples  = var.common_ghes_metrics.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.disk_usage.query_definition_type
    aggregation = var.ghes_metrics.disk_usage.aggregation
    metric_key  = var.ghes_metrics.disk_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_ghes_metrics.dimension_key
        dimension_value = var.common_ghes_metrics.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_ghes_metrics.dimension_key
      conditions {
        condition {
          type     = var.common_ghes_metrics.entity_filter_condition1_type
          operator = var.common_ghes_metrics.entity_filter_condition1_operator
          value    = var.common_ghes_metrics.entity_filter_condition1_value
        }
      }
    }
  }
}

# disk critical alerts
resource "dynatrace_metric_events" "ghes_disk_utilization_critical_alerts" {
  count                      = var.ghes_metrics.disk_usage.critical.enabled == true ? 1 : 0
  enabled                    = var.ghes_metrics.disk_usage.critical.enabled
  event_entity_dimension_key = var.common_ghes_metrics.event_entity_dimension_key
  summary                    = var.ghes_metrics.disk_usage.summary
  event_template {
    description = var.ghes_metrics.disk_usage.description
    davis_merge = var.common_ghes_metrics.davis_merge
    event_type  = var.common_ghes_metrics.event_type
    title       = var.ghes_metrics.disk_usage.critical.title
    metadata {
      metadata_key   = var.common_ghes_metrics.tag_key
      metadata_value = var.common_ghes_metrics.tag_value
    }
  }
  model_properties {
    type               = var.common_ghes_metrics.model_properties_type
    alert_condition    = var.ghes_metrics.disk_usage.alert_condition
    alert_on_no_data   = var.common_ghes_metrics.alert_on_no_data
    dealerting_samples = var.ghes_metrics.disk_usage.dealerting_samples
    samples            = var.common_ghes_metrics.samples
    threshold          = var.ghes_metrics.disk_usage.critical.threshold
    violating_samples  = var.common_ghes_metrics.violating_samples
  }
  query_definition {
    type        = var.ghes_metrics.disk_usage.query_definition_type
    aggregation = var.ghes_metrics.disk_usage.aggregation
    metric_key  = var.ghes_metrics.disk_usage.metric_key
    dimension_filter {
      filter {
        dimension_key   = var.common_ghes_metrics.dimension_key
        dimension_value = var.common_ghes_metrics.dimension_value
      }
    }
    entity_filter {
      dimension_key = var.common_ghes_metrics.dimension_key
      conditions {
        condition {
          type     = var.common_ghes_metrics.entity_filter_condition1_type
          operator = var.common_ghes_metrics.entity_filter_condition1_operator
          value    = var.common_ghes_metrics.entity_filter_condition1_value
        }
      }
    }
  }
}
module "alerts" {
  source = "./alert_profile"
  for_each           =  var.ghes_alert_configs
  ghes_alert_configs = each.value
}