locals {
  default_services = yamldecode(file("default_metrics.yaml"))
}

module "aws_account_configurations" {
  source = "./aws_account_configuration"

  for_each = var.tenant_vars.aws_connections
  tenant_vars = each.value
  connection_name = each.key
  default_services = local.default_services
}

module "dynatrace_management_zones" {
  source = "./dynatrace_management_zones"

  for_each = var.tenant_vars.management_zones
  zone_vars = each.value
  zone_name = each.key
}
