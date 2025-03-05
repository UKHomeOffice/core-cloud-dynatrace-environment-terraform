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
  source            = "./alerts/ghes"
  count             = contains(keys(var.tenant_vars), "ghes_alert") ? 1 : 0
  ghes_alert_config = var.tenant_vars.ghes_alert
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
  source        = "./dashboards/golden_dashboards"
  tenant_vars   = var.tenant_vars
  s3_dashboard_name = var.s3_dashboard_name
  s3_owner_name = var.s3_owner_name
  s3_shared = var.s3_shared
  s3_preset = var.s3_preset
  rds_dashboard_name = var.rds_dashboard_name
  rds_owner_name = var.rds_owner_name
  rds_preset = var.rds_preset
  rds_shared = var.rds_shared
  msk_dashboard_name = var.msk_dashboard_name
  msk_owner_name = var.msk_owner_name
  msk_preset = var.msk_preset
  msk_shared = var.msk_shared
  cloudfront_dashboard_name = var.cloudfront_dashboard_name
  cloudfront_owner_name = var.cloudfront_owner_name
  cloudfront_preset = var.cloudfront_preset
  cloudfront_shared = var.cloudfront_shared
  elasticsearch_dashboard_name = var.elasticsearch_dashboard_name
  elasticsearch_owner_name = var.elasticsearch_owner_name
  elasticsearch_preset = var.elasticache_preset
  elasticsearch_shared = var.elasticsearch_shared
  elasticache_dashboard_name = var.elasticache_dashboard_name
  elasticache_owner_name = var.elasticache_owner_name
  elasticache_preset = var.elasticache_preset
  elasticache_shared = var.elasticache_shared
  dynamodb_dashboard_name = var.dynamodb_dashboard_name
  dynamodb_owner_name = var.dynamodb_owner_name
  dynamodb_preset = var.dynamodb_preset
  dynamodb_shared = var.dynamodb_shared
}
