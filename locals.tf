locals {
  platform_dashboards_present = contains(keys(var.tenant_vars), "platform_dashboards") ? true : false
  platform_dashboards_enabled = local.platform_dashboards_enabled ? var.tenant_vars.platform_dashboards.enabled : false
  files = local.platform_dashboards_enabled ? fileset("${path.module}/dashboards/platform_dashboards/files", "*.json") : []
}