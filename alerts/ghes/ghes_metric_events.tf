
resource "dynatrace_email_notification" "ghes_email_alerts" {
  active                 = var.ghes_email_notification_enabled
  name                   = var.ghes_email_notification_name
  profile                = dynatrace_alerting.cosmos-ghes-alerting-profile.id
  subject                = var.ghes_email_subject
  to                     = var.ghes_email_id
  notify_closed_problems = var.ghes_notify_closed_problem
  body                   = "{ProblemDetailsHTML}"
}

resource "dynatrace_slack_notification" "ghes_slack_alerts" {
  active  = var.ghes_slack_notification_enabled
  name    = var.ghes_slack_notification_name
  profile = dynatrace_alerting.cosmos-ghes-alerting-profile.id
  url     = var.ghes_slack_url
  channel = var.ghes_channel_name
  message = var.ghes_slack_message
}

# memory warning alerts
resource "dynatrace_metric_events" "ghes_freeable_memory_warning_alerts" {
  enabled                    = var.ghes_memory_usage_warning_alerts_enabled
  event_entity_dimension_key = var.ghes_memory_usage_event_entity_dimension_key
  summary                    = var.ghes_memory_usage_summary
  event_template {
    description = var.ghes_memory_usage_description
    davis_merge = var.ghes_memory_usage_davis_merge
    event_type  = var.ghes_memory_usage_event_type
    title       = var.ghes_memory_usage_warning_alerts_title
  }
  model_properties {
    type               = var.ghes_memory_usage_model_properties_type
    alert_condition    = var.ghes_memory_usage_alert_condition
    alert_on_no_data   = var.ghes_memory_usage_alert_on_no_data
    dealerting_samples = var.ghes_memory_usage_dealerting_samples
    samples            = var.ghes_memory_usage_samples
    threshold          = var.ghes_memory_usage_warning_alerts_threshold
    violating_samples  = var.ghes_memory_usage_violating_samples
  }
  query_definition {
    type        = var.ghes_memory_usage_query_definition_type
    aggregation = var.ghes_memory_usage_aggregation
    metric_key  = var.ghes_memory_usage_metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_memory_usage_dimension_key
        dimension_value = var.ghes_memory_usage_dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_memory_usage_dimension_key
      conditions {
        condition {
          type     = var.ghes_memory_usage_entity_filter_condition1_type
          operator = var.ghes_memory_usage_entity_filter_condition1_operator
          value    = var.ghes_memory_usage_entity_filter_condition1_value
        }
      }
    }
  }
}

# memory critical alerts
resource "dynatrace_metric_events" "ghes_freeable_memory_critical_alerts" {
  enabled                    = var.ghes_memory_usage_critical_alerts_enabled
  event_entity_dimension_key = var.ghes_memory_usage_event_entity_dimension_key
  summary                    = var.ghes_memory_usage_summary
  event_template {
    description = var.ghes_memory_usage_description
    davis_merge = var.ghes_memory_usage_davis_merge
    event_type  = var.ghes_memory_usage_event_type
    title       = var.ghes_memory_usage_critical_alerts_title
  }
  model_properties {
    type               = var.ghes_memory_usage_model_properties_type
    alert_condition    = var.ghes_memory_usage_alert_condition
    alert_on_no_data   = var.ghes_memory_usage_alert_on_no_data
    dealerting_samples = var.ghes_memory_usage_dealerting_samples
    samples            = var.ghes_memory_usage_samples
    threshold          = var.ghes_memory_usage_critical_alerts_threshold
    violating_samples  = var.ghes_memory_usage_violating_samples
  }
  query_definition {
    type        = var.ghes_memory_usage_query_definition_type
    aggregation = var.ghes_memory_usage_aggregation
    metric_key  = var.ghes_memory_usage_metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_memory_usage_dimension_key
        dimension_value = var.ghes_memory_usage_dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_memory_usage_dimension_key
      conditions {
        condition {
          type     = var.ghes_memory_usage_entity_filter_condition1_type
          operator = var.ghes_memory_usage_entity_filter_condition1_operator
          value    = var.ghes_memory_usage_entity_filter_condition1_value
        }
      }
    }
  }
}

# cpu warning alerts
resource "dynatrace_metric_events" "ghes_cpu_utilization_warning_alerts" {
  enabled                    = var.ghes_cpu_usage_warning_alerts_enabled
  event_entity_dimension_key = var.ghes_cpu_usage_event_entity_dimension_key
  summary                    = var.ghes_cpu_usage_summary
  event_template {
    description = var.ghes_cpu_usage_description
    davis_merge = var.ghes_cpu_usage_davis_merge
    event_type  = var.ghes_cpu_usage_event_type
    title       = var.ghes_cpu_usage_warning_alerts_title
  }
  model_properties {
    type               = var.ghes_cpu_usage_model_properties_type
    alert_condition    = var.ghes_cpu_usage_alert_condition
    alert_on_no_data   = var.ghes_cpu_usage_alert_on_no_data
    dealerting_samples = var.ghes_cpu_usage_dealerting_samples
    samples            = var.ghes_cpu_usage_samples
    threshold          = var.ghes_cpu_usage_warning_alerts_threshold
    violating_samples  = var.ghes_cpu_usage_violating_samples
  }
  query_definition {
    type        = var.ghes_cpu_usage_query_definition_type
    aggregation = var.ghes_cpu_usage_aggregation
    metric_key  = var.ghes_cpu_usage_metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_cpu_usage_dimension_key
        dimension_value = var.ghes_cpu_usage_dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_cpu_usage_dimension_key
      conditions {
        condition {
          type     = var.ghes_cpu_usage_entity_filter_condition1_type
          operator = var.ghes_cpu_usage_entity_filter_condition1_operator
          value    = var.ghes_cpu_usage_entity_filter_condition1_value
        }
      }
    }
  }
}

# cpu critical alerts
resource "dynatrace_metric_events" "ghes_cpu_utilization_critical_alerts" {
  enabled                    = var.ghes_cpu_usage_critical_alerts_enabled
  event_entity_dimension_key = var.ghes_cpu_usage_event_entity_dimension_key
  summary                    = var.ghes_cpu_usage_summary
  event_template {
    description = var.ghes_cpu_usage_description
    davis_merge = var.ghes_cpu_usage_davis_merge
    event_type  = var.ghes_cpu_usage_event_type
    title       = var.ghes_cpu_usage_critical_alerts_title
  }
  model_properties {
    type               = var.ghes_cpu_usage_model_properties_type
    alert_condition    = var.ghes_cpu_usage_alert_condition
    alert_on_no_data   = var.ghes_cpu_usage_alert_on_no_data
    dealerting_samples = var.ghes_cpu_usage_dealerting_samples
    samples            = var.ghes_cpu_usage_samples
    threshold          = var.ghes_cpu_usage_critical_alerts_threshold
    violating_samples  = var.ghes_cpu_usage_violating_samples
  }
  query_definition {
    type        = var.ghes_cpu_usage_query_definition_type
    aggregation = var.ghes_cpu_usage_aggregation
    metric_key  = var.ghes_cpu_usage_metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_cpu_usage_dimension_key
        dimension_value = var.ghes_cpu_usage_dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_cpu_usage_dimension_key
      conditions {
        condition {
          type     = var.ghes_cpu_usage_entity_filter_condition1_type
          operator = var.ghes_cpu_usage_entity_filter_condition1_operator
          value    = var.ghes_cpu_usage_entity_filter_condition1_value
        }
      }
    }
  }
}

variable "disk" {
  type = object({
    name = 
  })
}

variable "cpu" {

}

# disk warning alerts
resource "dynatrace_metric_events" "ghes_disk_utilization_warning_alerts" {
  enabled                    = var.ghes_disk_usage_warning_alerts_enabled
  event_entity_dimension_key = var.ghes_disk_usage_event_entity_dimension_key
  summary                    = var.ghes_disk_usage_summary
  event_template {
    description = var.ghes_disk_usage_description
    davis_merge = var.ghes_disk_usage_davis_merge
    event_type  = var.ghes_disk_usage_event_type
    title       = var.ghes_disk_usage_warning_alerts_title
  }
  model_properties {
    type               = var.ghes_disk_usage_model_properties_type
    alert_condition    = var.ghes_disk_usage_alert_condition
    alert_on_no_data   = var.ghes_disk_usage_alert_on_no_data
    dealerting_samples = var.ghes_disk_usage_dealerting_samples
    samples            = var.ghes_disk_usage_samples
    threshold          = var.ghes_disk_usage_warning_alerts_threshold
    violating_samples  = var.ghes_disk_usage_violating_samples
  }
  query_definition {
    type        = var.ghes_disk_usage_query_definition_type
    aggregation = var.ghes_disk_usage_aggregation
    metric_key  = var.ghes_disk_usage_metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_disk_usage_dimension_key
        dimension_value = var.ghes_disk_usage_dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_disk_usage_dimension_key
      conditions {
        condition {
          type     = var.ghes_disk_usage_entity_filter_condition1_type
          operator = var.ghes_disk_usage_entity_filter_condition1_operator
          value    = var.ghes_disk_usage_entity_filter_condition1_value
        }
      }
    }
  }
}

# disk critical alerts
resource "dynatrace_metric_events" "ghes_disk_utilization_critical_alerts" {
  enabled                    = var.ghes_disk_usage_critical_alerts_enabled
  event_entity_dimension_key = var.ghes_disk_usage_event_entity_dimension_key
  summary                    = var.ghes_disk_usage_summary
  event_template {
    description = var.ghes_disk_usage_description
    davis_merge = var.ghes_disk_usage_davis_merge
    event_type  = var.ghes_disk_usage_event_type
    title       = var.ghes_disk_usage_critical_alerts_title
  }
  model_properties {
    type               = var.ghes_disk_usage_model_properties_type
    alert_condition    = var.ghes_disk_usage_alert_condition
    alert_on_no_data   = var.ghes_disk_usage_alert_on_no_data
    dealerting_samples = var.ghes_disk_usage_dealerting_samples
    samples            = var.ghes_disk_usage_samples
    threshold          = var.ghes_disk_usage_critical_alerts_threshold
    violating_samples  = var.ghes_disk_usage_violating_samples
  }
  query_definition {
    type        = var.ghes_disk_usage_query_definition_type
    aggregation = var.ghes_disk_usage_aggregation
    metric_key  = var.ghes_disk_usage_metric_key
    dimension_filter {
      filter {
        dimension_key   = var.ghes_disk_usage_dimension_key
        dimension_value = var.ghes_disk_usage_dimension_value
      }
    }
    entity_filter {
      dimension_key = var.ghes_disk_usage_dimension_key
      conditions {
        condition {
          type     = var.ghes_disk_usage_entity_filter_condition1_type
          operator = var.ghes_disk_usage_entity_filter_condition1_operator
          value    = var.ghes_disk_usage_entity_filter_condition1_value
        }
      }
    }
  }
}
