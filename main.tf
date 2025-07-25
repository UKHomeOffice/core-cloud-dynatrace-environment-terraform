locals {
  default_services = yamldecode(file("default_metrics.yaml"))
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
  source      = "git::https://github.com/UKHomeOffice/core-cloud-aws-secrets-terraform.git?ref=0.0.2"
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
  source                             = "./web_applications/"
  count                              = contains(keys(var.tenant_vars), "web_application") ? 1 : 0
  web_application_name               = var.tenant_vars.web_application.web_application_name
  web_application_type               = var.tenant_vars.web_application.web_application_type
  load_action_key_performance_metric = var.tenant_vars.web_application.load_action_key_performance_metric
  rum_enabled                        = var.tenant_vars.web_application.rum_enabled
  xhr_action_key_performance_metric  = var.tenant_vars.web_application.xhr_action_key_performance_metric
  frustrating_fallback_threshold     = var.tenant_vars.web_application.frustrating_fallback_threshold
  frustrating_threshold              = var.tenant_vars.web_application.frustrating_threshold
  tolerated_fallback_threshold       = var.tenant_vars.web_application.tolerated_fallback_threshold
  tolerated_threshold                = var.tenant_vars.web_application.tolerated_threshold
}
module "web_application_detection_rules" {
  source                             = "./web_application_detection_rules/"
  count                              = contains(keys(var.tenant_vars), "web_application_detection_rules") ? 1 : 0
  web_application_id                 = var.tenant_vars.web_application_detection_rules.web_application_id
  application_match_target           = var.tenant_vars.web_application_detection_rules.application_match_target
  application_match_type             = var.tenant_vars.web_application_detection_rules.application_match_type
  hostname                           = var.tenant_vars.web_application_detection_rules.hostname
}
