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
  source = "./anomaly_detection/"
}


module "dynatrace_log_storage_rules" {
  source = "./dynatrace_log_storage"

  rules = [
    {
      name              = "include-dynatrace-pods"
      enabled           = true
      send_to_storage   = true
      matcher_attribute = "k8s.namespace.name"
      matcher_operator  = "EQUALS"
      matcher_values    = ["kube-system"]
    },
    {
      name              = "include-dt-containers"
      enabled           = true
      send_to_storage   = true
      matcher_attribute = "k8s.pod.label"
      matcher_operator  = "MATCHES"
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
  source  = "./settings/kafka"
  count   = contains(keys(var.tenant_vars), "kafka_settings") ? 1 : 0
  enabled = var.tenant_vars.kafka_settings.enabled
}

module "hub_extensions" {

  source   = "./hub_extensions"
  for_each = contains(keys(var.tenant_vars), "hub_extensions") ? var.tenant_vars.hub_extensions : {}

  tenant_vars     = each.value
  version         = each.value.version
  management_zone = each.value.management_zone
  description     = try(each.value.description, "")
  featureSets     = each.value.featureSets
  extension_name  = each.value.extension_name
  enabled         = try(each.value.enabled, true)
  activationTags  = each.value.activationTags != null ? each.value.activationTags : [{ tag = "[AWS]dynatrace: true" }]
}
