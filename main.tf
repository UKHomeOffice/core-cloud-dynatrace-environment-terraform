locals {
  default_services = yamldecode(file("default_DT_Metrics.yaml"))
}

module "DT_AWS_Connections" {
  source = "./aws_account_configuration"

  for_each = var.tenant_vars.aws_connections
  tenant_vars = each.value
  connection_name = each.key
  default_services = local.default_services
}