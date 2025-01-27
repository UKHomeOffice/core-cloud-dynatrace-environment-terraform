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

  ghes_alert_config = var.tenant_vars.ghes_alert
}
module "ghes_dashboards" {
  source = "./dashboards/ghes_dashboards"
  dashboard_json = var.dashboard_json.dashboard_json
}