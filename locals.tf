locals {
  platform_dashboards_enabled = contains(keys(var.tenant_vars), "platform_dashboards") ? true : false
  files = local.platform_dashboards_enabled ? fileset("${path.module}/dashboards/platform_dashboards/files", "*.json") : []
}