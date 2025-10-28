locals {
  default_services = yamldecode(file("default_metrics.yaml"))
  # Enable/disable check for corecloud_alerts module
  corecloud_alerts_enabled = (
    contains(keys(var.tenant_vars), "corecloud_alerts") &&
    try(contains(keys(var.tenant_vars.corecloud_alerts), "corecloud_alert_configs"), false) &&
    try(var.tenant_vars.corecloud_alerts.corecloud_alert_configs != null, false) &&
    try(contains(keys(var.tenant_vars.corecloud_alerts), "corecloud_profile_alerting_rules"), false) &&
    try(var.tenant_vars.corecloud_alerts.corecloud_profile_alerting_rules != null, false)
  )
}

module "aws_account_configurations" {
  source = "./aws_account_configuration"

  for_each         = var.tenant_vars.aws_connections
  tenant_vars      = each.value
  connection_name  = each.key
  default_services = local.default_services
}

module "dynatrace_generic_types" {
  count  = contains(keys(var.tenant_vars), "generic_types") ? 1 : 0
  source = "./dynatrace_generic_types"
}

module "dynatrace_management_zones" {
  source = "./dynatrace_management_zones"

  for_each = var.tenant_vars.management_zones
  # Create one management zone per named entry under the "management_zones" block of the config.yaml
  zone_vars = each.value
  # Value is the attribute/parameter content of each named entry
  zone_name = each.key
  # Name reference for the zone within config yaml is used as the literal name of the MZ to be created
}

module "ghes_alerts" {
  source = "./alerts/ghes"
  count  = contains(keys(var.tenant_vars), "ghes_alert") ? 1 : 0
  ghes_alert_configs = contains(keys(var.tenant_vars.ghes_alert), "ghes_alert_configs"
    ) && var.tenant_vars.ghes_alert.ghes_alert_configs != null ? tomap(var.tenant_vars.ghes_alert.ghes_alert_configs
  ) : tomap({})
  bcp_alerting = contains(keys(var.tenant_vars.ghes_alert), "bcp_alerting") ? var.tenant_vars.ghes_alert.bcp_alerting : {
    enabled               = false
    alerting_profile_name = ""
    include_mode          = ""
    delay_in_minutes      = 0
    tag_key               = ""
    tag_value             = ""
    email_name            = ""
    email_subject         = ""
    email_to              = []
  }
  slack_webhook_urls = var.slack_webhook_urls
}


module "metric_events" {
  source = "./metric_events"
  count = (contains(keys(var.tenant_vars), "metric_events"
    ) && contains(keys(var.tenant_vars.metric_events), "common_metric_values"
    ) && contains(keys(var.tenant_vars.metric_events), "metrics"
  ) && var.tenant_vars.metric_events.common_metric_values != null && var.tenant_vars.metric_events.metrics != null) ? 1 : 0
  common_metrics_vars = var.tenant_vars.metric_events.common_metric_values
  metrics_vars        = var.tenant_vars.metric_events.metrics
}

module "ghes_dashboards" {
  source        = "./dashboards/ghes_dashboards"
  count         = contains(keys(var.tenant_vars), "ghes_dashboard_hostname") ? 1 : 0
  ghes_hostname = var.tenant_vars.ghes_dashboard_hostname
  # dt_admin_group_name = var.tenant_vars.dt_admin_group_name
  dt_admin_group_id = var.tenant_vars.dt_admin_group_id
}

module "dynatrace_privatelink_aws_accounts_allowlist" {
  source       = "./dynatrace_privatelink_aws_accounts_allowlist"
  count        = contains(keys(var.tenant_vars), "privatelink_allowlist_aws_accounts") ? 1 : 0
  aws_accounts = var.tenant_vars.privatelink_allowlist_aws_accounts
}

module "golden_dashboards" {
  count  = contains(keys(var.tenant_vars), "golden_dashboards") ? 1 : 0
  source = "./dashboards/golden_dashboards"
}

module "aws_secrets" {
  source      = "git::https://github.com/UKHomeOffice/core-cloud-aws-secrets-terraform.git?ref=0.2.3"
  count       = contains(keys(var.tenant_vars), "aws_secrets") ? 1 : 0
  aws_secrets = var.tenant_vars.aws_secrets
}

module "dynatrace_servicenow_integration" {
  source = "./dynatrace_servicenow_integration"
  count = contains(
    keys(var.tenant_vars),
    "servicenow_integration"
  ) ? 1 : 0

  SERVICENOW_END_POINT     = var.SERVICENOW_END_POINT
  SERVICENOW_ENV_ID        = var.SERVICENOW_ENV_ID
  SERVICENOW_CLIENT_ID     = var.SERVICENOW_CLIENT_ID
  SERVICENOW_CLIENT_SECRET = var.SERVICENOW_CLIENT_SECRET

  servicenow_payload = contains(
    keys(var.tenant_vars.servicenow_integration),
    "servicenow_payload"
  ) ? var.tenant_vars.servicenow_integration.servicenow_payload : tomap({})

  servicenow_alerting_rules = contains(
    keys(var.tenant_vars.servicenow_integration),
    "servicenow_alerting_profile_rules"
  ) ? tomap(var.tenant_vars.servicenow_integration.servicenow_alerting_profile_rules) : tomap({})

  accept_any_cert = contains(
    keys(var.tenant_vars.servicenow_integration),
    "accept_any_cert"
  ) ? var.tenant_vars.servicenow_integration.accept_any_cert : "true"

  notify_event_merges = contains(
    keys(var.tenant_vars.servicenow_integration),
    "notify_event_merges"
  ) ? var.tenant_vars.servicenow_integration.notify_event_merges : "true"

  notify_closed_problems = contains(
    keys(var.tenant_vars.servicenow_integration),
    "notify_closed_problems"
  ) ? var.tenant_vars.servicenow_integration.notify_closed_problems : "true"

  snow_integration_state = contains(
    keys(var.tenant_vars.servicenow_integration),
    "snow_integration_state"
  ) ? var.tenant_vars.servicenow_integration.snow_integration_state : "false"
}

module "dynatrace_aws_monitoring_profile_integration" {
  source = "./alerts/aws_monitoring_profile"
  count = contains(
    keys(var.tenant_vars),
    "aws_monitoring_profile_integration"
  ) ? 1 : 0

  aws_monitoring_profile_alerting_rules = contains(
    keys(var.tenant_vars.aws_monitoring_profile_integration),
    "aws_monitoring_profile_rules"
  ) ? tomap(var.tenant_vars.aws_monitoring_profile.aws_monitoring_profile_rules) : tomap({})

  aws_monitoring_profile_alert_config = var.tenant_vars.aws_monitoring_profile_integration
  slack_webhook_url                   = var.slack_webhook_urls["aws_monitoring_profile"]
}

module "anomaly_detection" {
  count  = contains(keys(var.tenant_vars), "anomaly_detection") ? 1 : 0
  source = "./anomaly_detection/"
}


module "dynatrace_log_storage_rules" {
  count  = contains(keys(var.tenant_vars), "dynatrace_log_storage_rules") ? 1 : 0
  source = "./dynatrace_log_storage"

  rules = [
    {
      name              = "include-dynatrace-pods"
      enabled           = true
      send_to_storage   = true
      matcher_attribute = "k8s.namespace.name"
      matcher_values    = ["kube-system"]
    },
    {
      name              = "include-dt-containers"
      enabled           = true
      send_to_storage   = true
      matcher_attribute = "k8s.pod.label"
      matcher_values    = ["dynatrace-logs=true"]
    }
  ]
}

module "web_application" {
  source   = "./web_applications/"
  for_each = contains(keys(var.tenant_vars), "web_applications") ? var.tenant_vars.web_applications : {}

  web_application_name = each.value.name
  web_application_type = each.value.type
  rum_enabled          = each.value.rum_enabled
  matcher              = each.value.matcher
  pattern              = each.value.pattern
  description          = try(each.value.description, "")
}

module "dynatrace_corecloud_alerts" {
  source                           = "./alerts/corecloud"
  count                            = local.corecloud_alerts_enabled ? 1 : 0
  corecloud_alert_configs          = try(var.tenant_vars.corecloud_alerts.corecloud_alert_configs, null)
  corecloud_profile_alerting_rules = try(var.tenant_vars.corecloud_alerts.corecloud_profile_alerting_rules, null)
  slack_webhook_urls               = var.slack_webhook_urls
}

module "dynatrace_kafka_settings" {
  source        = "./settings/kafka"
  count         = contains(keys(var.tenant_vars), "kafka_settings") ? 1 : 0
  enabled       = try(var.tenant_vars.kafka_settings.enabled, false)
  kafka_streams = try(var.tenant_vars.kafka_settings.kafka_streams, false)
}

module "hub_extensions" {

  source   = "./hub_extensions"
  for_each = contains(keys(var.tenant_vars), "hub_extensions") ? var.tenant_vars.hub_extensions : {}

  tenant_vars     = each.value
  extn_version    = each.value.extn_version
  management_zone = each.value.management_zone
  description     = try(each.value.description, "")
  featureSets     = each.value.featureSets
  extension_name  = each.value.extension_name
  enabled         = try(each.value.enabled, true)
  activationTags  = each.value.activationTags != null ? each.value.activationTags : ["[AWS]dynatrace: true"]
}
module "oam_sink" {
  source   = "./oam_sink/"
  for_each = contains(keys(var.tenant_vars), "oam_sink") ? var.tenant_vars.oam_sink : {}

  tenant_vars = each.value
  org_id      = each.value.org_id
  sink_name   = each.value.sink_name
  ou_paths    = each.value.ou_paths
}

module "oam_link" {
  source   = "./oam_link/"
  for_each = contains(keys(var.tenant_vars), "oam_link") ? var.tenant_vars.oam_link : {}

  label_template = each.value.label_template
  metric_filter  = each.value.metric_filter
  tenant_vars    = each.value
  sink_arn = try(
    values(module.oam_sink)[0].sink_arn,
    ""
  )
}
module "firehose_dynatrace" {
  source   = "./firehose_dynatrace/"
  for_each = contains(keys(var.tenant_vars), "firehose_dynatrace") ? var.tenant_vars.firehose_dynatrace : {}

  tenant_vars                            = each.value
  s3_backup_bucket_name                  = each.value.s3_backup_bucket_name
  env                                    = each.value.env
  destination                            = each.value.destination
  dynatarce_eu_url                       = each.value.dynatarce_eu_url
  log_group_name                         = each.value.log_group_name
  log_stream_name                        = each.value.log_stream_name
  dynatrace_api_token_secret_arn         = each.value.dynatrace_api_token_secret_arn
  dynatrace_delivery_endpoint_secret_arn = each.value.dynatrace_delivery_endpoint_secret_arn
  lifecycle_expiration_days              = each.value.lifecycle_expiration_days

}
module "metric_stream" {
  source   = "./metric_stream/"
  for_each = contains(keys(var.tenant_vars), "metric_stream") ? var.tenant_vars.metric_stream : {}

  tenant_vars                     = each.value
  output_format                   = each.value.output_format
  env_name                        = each.value.env_name
  metrics_stream_name             = each.value.metrics_stream_name
  include_linked_accounts_metrics = each.value.include_linked_accounts_metrics
  firehose_arn                    = module.firehose_dynatrace[var.tenant_vars.metric_stream_to_firehose_map[each.key]].firehose_arn
}

module "aws_cwl_s3_bucket" {
  source   = "./aws_cwl_cwm"
  for_each = contains(keys(var.tenant_vars), "aws_cwl_cwm") ? var.tenant_vars.aws_cwl_cwm : {}
  tags     = each.value.tags

  #s3 config
  s3_backup_bucket_name     = each.value.s3_backup_bucket_name
  lifecycle_expiration_days = each.value.lifecycle_expiration_days
  s3_encryption_algorithm   = each.value.s3_encryption_algorithm
  versioning_status         = each.value.versioning_status
  s3_backup_prefix          = each.value.s3_backup_prefix
  s3_error_prefix           = each.value.s3_error_prefix
  #firehose config
  cw_log_group_name   = each.value.cw_log_group_name
  cw_log_stream_name  = each.value.cw_log_stream_name
  firehose_name       = each.value.firehose_name
  buffering_size      = each.value.buffering_size
  buffering_interval  = each.value.buffering_interval
  retry_duration      = each.value.retry_duration
  ingestion_type      = each.value.ingestion_type
  common_attributes   = try(each.value.common_attributes, [])
  #dt config
  dt_cwl_api_token_name    = each.value.dt_cwl_api_token_name
  dt_endpoint_name         = each.value.dt_endpoint_name
  dt_cwm_api_token_name    = each.value.dt_cwm_api_token_name
}
