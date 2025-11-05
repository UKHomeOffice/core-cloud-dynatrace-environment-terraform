locals {
  files = var.tenant_vars.platform_dashboards ? fileset("${path.module}/dashboards/platform_dashboards/files", "*.json") : []
}