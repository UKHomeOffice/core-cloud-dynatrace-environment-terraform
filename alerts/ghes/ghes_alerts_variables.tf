variable "ghes_config" {
  type = object({
    ghes_alerting_profile_name                   = string
    ghes_include_mode                            = string
    ghes_delay_in_minutes                        = string
    ghes_email_id                                = list(string)
    ghes_email_notification_enabled              = bool
    ghes_email_notification_name                 = string
    ghes_email_subject                           = string
    ghes_notify_closed_problem                   = bool
    ghes_slack_notification_enabled              = bool
    ghes_slack_notification_name                 = string
    ghes_slack_url                               = string
    ghes_channel_name                            = string
    ghes_slack_message                           = string
    ghes_memory_usage_davis_merge                = bool
    ghes_memory_usage_event_entity_dimension_key = string
    ghes_memory_usage_event_type                 = string
    ghes_memory_usage_summary                    = string
    ghes_memory_usage_description                = string
    ghes_memory_usage_title                      = string
    ghes_memory_usage_model_properties_type      = string
    ghes_memory_usage_alert_condition            = string
    ghes_memory_usage_alert_on_no_data           = bool
    ghes_memory_usage_dealerting_samples         = string
    ghes_memory_usage_samples                    = string
    ghes_memory_usage_violating_samples          = string
  })

}


variable "ghes_memory_usage_query_definition_type" {
  type        = string
  description = "Query definition type for memory utilization userspace."
}

variable "ghes_memory_usage_aggregation" {
  type        = string
  description = "Aggregation method for memory utilization userspace events."
}

variable "ghes_memory_usage_metric_key" {
  type        = string
  description = "Metric key for memory utilization userspace."
}

variable "ghes_memory_usage_dimension_key" {
  type        = string
  description = "Dimension key for memory utilization userspace."
}

variable "ghes_memory_usage_dimension_value" {
  type        = string
  description = "Dimension value for memory utilization userspace."
}

variable "ghes_memory_usage_entity_filter_condition1_type" {
  type        = string
  description = "Type of the first entity filter condition for memory utilization userspace."
}

variable "ghes_memory_usage_entity_filter_condition1_operator" {
  type        = string
  description = "Operator for the first entity filter condition for memory utilization userspace."
}

variable "ghes_memory_usage_entity_filter_condition1_value" {
  type        = string
  description = "Value of the first entity filter condition for memory utilization userspace."
}

variable "ghes_memory_usage_warning_alerts_enabled" {
  type        = bool
  description = "Enable or disable the memory utilization warning alert."
}

variable "ghes_memory_usage_warning_alerts_title" {
  type        = string
  description = "Title of the memory utilization warning alert."
}

variable "ghes_memory_usage_warning_alerts_threshold" {
  type        = string
  description = "Threshold of the memory utilization warning alert."
}

variable "ghes_memory_usage_critical_alerts_enabled" {
  type        = bool
  description = "Enable or disable the memory utilization critical alert."
}

variable "ghes_memory_usage_critical_alerts_title" {
  type        = string
  description = "Title of the memory utilization critical alert."
}

variable "ghes_memory_usage_critical_alerts_threshold" {
  type        = string
  description = "Threshold of the memory utilization critical alert."
}

# Variables for cpu usage
variable "ghes_cpu_usage_davis_merge" {
  type        = bool
  description = "Flag to enable or disable Davis merge for cpu utilization userspace events."
}

variable "ghes_cpu_usage_event_entity_dimension_key" {
  type        = string
  description = "Dimension key for the event entity of cpu utilization userspace."
}

variable "ghes_cpu_usage_event_type" {
  type        = string
  description = "Type of the event for cpu usage."
}

variable "ghes_cpu_usage_summary" {
  type        = string
  description = "Summary of the cpu usage summary."
}

variable "ghes_cpu_usage_description" {
  type        = string
  description = "Description of the cpu usage descriptions"
}

variable "ghes_cpu_usage_title" {
  type        = string
  description = "Title of the cpu usage event."
}

variable "ghes_cpu_usage_model_properties_type" {
  type        = string
  description = "Type of the model properties for cpu usage."
}

variable "ghes_cpu_usage_alert_condition" {
  type        = string
  description = "Alert condition for cpu usage events."
}

variable "ghes_cpu_usage_alert_on_no_data" {
  type        = bool
  description = "Enable or disable alerts for no data in cpu usage."
}

variable "ghes_cpu_usage_dealerting_samples" {
  type        = string
  description = "string of samples for dealerting in cpu usage."
}

variable "ghes_cpu_usage_samples" {
  type        = string
  description = "string of samples for cpu usage events."
}

variable "ghes_cpu_usage_violating_samples" {
  type        = string
  description = "string of violating samples for cpu utilization userspace events."
}

variable "ghes_cpu_usage_query_definition_type" {
  type        = string
  description = "Query definition type for cpu utilization userspace."
}

variable "ghes_cpu_usage_aggregation" {
  type        = string
  description = "Aggregation method for cpu utilization userspace events."
}

variable "ghes_cpu_usage_metric_key" {
  type        = string
  description = "Metric key for cpu utilization userspace."
}

variable "ghes_cpu_usage_dimension_key" {
  type        = string
  description = "Dimension key for cpu utilization userspace."
}

variable "ghes_cpu_usage_dimension_value" {
  type        = string
  description = "Dimension value for cpu utilization userspace."
}

variable "ghes_cpu_usage_entity_filter_condition1_type" {
  type        = string
  description = "Type of the first entity filter condition for cpu utilization userspace."
}

variable "ghes_cpu_usage_entity_filter_condition1_operator" {
  type        = string
  description = "Operator for the first entity filter condition for cpu utilization userspace."
}

variable "ghes_cpu_usage_entity_filter_condition1_value" {
  type        = string
  description = "Value of the first entity filter condition for cpu utilization userspace."
}

variable "ghes_cpu_usage_warning_alerts_enabled" {
  type        = bool
  description = "Enable or disable the cpu utilization warning alert."
}

variable "ghes_cpu_usage_warning_alerts_title" {
  type        = string
  description = "Title of the cpu utilization warning alert."
}

variable "ghes_cpu_usage_warning_alerts_threshold" {
  type        = string
  description = "Threshold of the cpu utilization warning alert."
}

variable "ghes_cpu_usage_critical_alerts_enabled" {
  type        = bool
  description = "Enable or disable the cpu utilization critical alert."
}

variable "ghes_cpu_usage_critical_alerts_title" {
  type        = string
  description = "Title of the cpu utilization critical alert."
}

variable "ghes_cpu_usage_critical_alerts_threshold" {
  type        = string
  description = "Threshold of the cpu utilization critical alert."
}

# Variables for disk usage
variable "ghes_disk_usage_davis_merge" {
  type        = bool
  description = "Flag to enable or disable Davis merge for disk utilization userspace events."
}

variable "ghes_disk_usage_event_entity_dimension_key" {
  type        = string
  description = "Dimension key for the event entity of disk utilization userspace."
}

variable "ghes_disk_usage_event_type" {
  type        = string
  description = "Type of the event for disk usage."
}

variable "ghes_disk_usage_summary" {
  type        = string
  description = "Summary of the disk usage summary."
}

variable "ghes_disk_usage_description" {
  type        = string
  description = "Description of the disk usage descriptions"
}

variable "ghes_disk_usage_title" {
  type        = string
  description = "Title of the disk usage event."
}

variable "ghes_disk_usage_model_properties_type" {
  type        = string
  description = "Type of the model properties for disk usage."
}

variable "ghes_disk_usage_alert_condition" {
  type        = string
  description = "Alert condition for disk usage events."
}

variable "ghes_disk_usage_alert_on_no_data" {
  type        = bool
  description = "Enable or disable alerts for no data in disk usage."
}

variable "ghes_disk_usage_dealerting_samples" {
  type        = string
  description = "string of samples for dealerting in disk usage."
}

variable "ghes_disk_usage_samples" {
  type        = string
  description = "string of samples for disk usage events."
}

variable "ghes_disk_usage_violating_samples" {
  type        = string
  description = "string of violating samples for disk utilization userspace events."
}

variable "ghes_disk_usage_query_definition_type" {
  type        = string
  description = "Query definition type for disk utilization userspace."
}

variable "ghes_disk_usage_aggregation" {
  type        = string
  description = "Aggregation method for disk utilization userspace events."
}

variable "ghes_disk_usage_metric_key" {
  type        = string
  description = "Metric key for disk utilization userspace."
}

variable "ghes_disk_usage_dimension_key" {
  type        = string
  description = "Dimension key for disk utilization userspace."
}

variable "ghes_disk_usage_dimension_value" {
  type        = string
  description = "Dimension value for disk utilization userspace."
}

variable "ghes_disk_usage_entity_filter_condition1_type" {
  type        = string
  description = "Type of the first entity filter condition for disk utilization userspace."
}

variable "ghes_disk_usage_entity_filter_condition1_operator" {
  type        = string
  description = "Operator for the first entity filter condition for disk utilization userspace."
}

variable "ghes_disk_usage_entity_filter_condition1_value" {
  type        = string
  description = "Value of the first entity filter condition for disk utilization userspace."
}

variable "ghes_disk_usage_warning_alerts_enabled" {
  type        = bool
  description = "Enable or disable the disk utilization warning alert."
}

variable "ghes_disk_usage_warning_alerts_title" {
  type        = string
  description = "Title of the disk utilization warning alert."
}

variable "ghes_disk_usage_warning_alerts_threshold" {
  type        = string
  description = "Threshold of the disk utilization warning alert."
}

variable "ghes_disk_usage_critical_alerts_enabled" {
  type        = bool
  description = "Enable or disable the disk utilization critical alert."
}

variable "ghes_disk_usage_critical_alerts_title" {
  type        = string
  description = "Title of the disk utilization critical alert."
}

variable "ghes_disk_usage_critical_alerts_threshold" {
  type        = string
  description = "Threshold of the disk utilization critical alert."
}
