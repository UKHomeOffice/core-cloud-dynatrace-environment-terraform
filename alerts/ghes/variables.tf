variable "ghes_alert_config" {
  type = object({
    # generic config for ghes alerts
    enabled                           = bool
    alerting_profile_name             = string
    notify_closed_problem             = bool
    include_mode                      = string
    delay_in_minutes                  = string
    email_notification_enabled        = bool
    email_from                        = list(string)
    email_notification_name           = string
    email_subject                     = string
    slack_notification_enabled        = bool
    slack_message                     = string
    slack_notification_name           = string
    slack_url                         = string
    channel_name                      = string
    davis_merge                       = bool
    event_type                        = string
    event_entity_dimension_key        = string
    model_properties_type             = string
    dimension_key                     = string
    dimension_value                   = string
    entity_filter_condition1_type     = string
    entity_filter_condition1_operator = string
    entity_filter_condition1_value    = string
    alert_on_no_data                  = bool
    samples                           = string
    violating_samples                 = string

    # config related to memory usage alerts for ghes
    memory_usage = object({
      summary               = string
      description           = string
      alert_condition       = string
      dealerting_samples    = string
      query_definition_type = string
      aggregation           = string
      metric_key            = string
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

    # config related to cpu usage alerts for ghes
    cpu_usage = object({
      summary               = string
      description           = string
      title                 = string
      alert_condition       = string
      dealerting_samples    = string
      query_definition_type = string
      aggregation           = string
      metric_key            = string
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

    # config related to disk usage alerts for ghes
    disk_usage = object({
      summary               = string
      description           = string
      title                 = string
      alert_condition       = string
      dealerting_samples    = string
      query_definition_type = string
      aggregation           = string
      metric_key            = string
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
