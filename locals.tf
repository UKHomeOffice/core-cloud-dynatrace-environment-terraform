locals {
  # Parse the JSON stored in SSM
  default_tags                = jsondecode(data.aws_ssm_parameter.default_tags.value)
  platform_dashboards_present = contains(keys(var.tenant_vars), "platform_dashboards") ? true : false
  platform_dashboards_enabled = local.platform_dashboards_present ? var.tenant_vars.platform_dashboards.enabled : false
  files                       = local.platform_dashboards_enabled ? fileset("${path.module}/dashboards/platform_dashboards/files", "*.json") : []
}
