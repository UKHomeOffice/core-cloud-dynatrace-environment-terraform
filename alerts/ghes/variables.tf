variable "ghes_alert_configs" {
  type = map(object({
    # generic config for ghes alerts
    enabled                           = bool
    alerting_profile_name             = string
    notify_closed_problem             = bool
    include_mode                      = string
    delay_in_minutes                  = string
    slack_notification_enabled        = bool
    slack_message                     = string
    slack_notification_name           = string
    slack_url                         = string
    channel_name                      = string
    tag_key                           = string
    tag_value                         = string
  }))
}

variable "common_ghes_metrics"{
  type = map({
      model_properties_type             = string
      alert_on_no_data                  = bool
      samples                           = string
      violating_samples                 = string
      davis_merge                       = bool
      event_type                        = string
      tag_key                           = string
      tag_value                         = string
      event_entity_dimension_key        = string
      dimension_key                     = string
      dimension_value                   = string
      entity_filter_condition1_type     = string
      entity_filter_condition1_operator = string
      entity_filter_condition1_value    = string
  })
}


    # config related to ghes metrics
variable "ghes_metrics" {
  type = object({
    memory_usage = object({
      summary                           = string
      description                       = string
      alert_condition                   = string
      dealerting_samples                = string
      query_definition_type             = string
      aggregation                       = string
      metric_key                        = string
      warning = object({
        enabled   = bool
        title     = string
        threshold = string
      })
      critical = object({
        enabled   = bool
        title     = string
        threshold = string
      })
    })
    cpu_usage = object({
      summary                           = string
      description                       = string
      alert_condition                   = string
      dealerting_samples                = string
      query_definition_type             = string
      aggregation                       = string
      metric_key                        = string
      warning = object({
        enabled   = bool
        title     = string
        threshold = string
      })
      critical = object({
        enabled   = bool
        title     = string
        threshold = string
      })
    })
    disk_usage = object({
      summary                           = string
      description                       = string
      alert_condition                   = string
      dealerting_samples                = string
      query_definition_type             = string
      aggregation                       = string
      metric_key                        = string
      warning = object({
        enabled   = bool
        title     = string
        threshold = string
      })
      critical = object({
        enabled   = bool
        title     = string
        threshold = string
      })
    })
  })
}
