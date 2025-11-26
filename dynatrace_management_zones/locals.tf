locals {
  # Load the raw template YAML (default_rules)
  default_rules_raw = yamldecode(
    templatefile("${path.module}/rules.tftpl", {
      project_id                   = var.project_id
      env_name                     = var.zone_vars.env_name
      tag_env_name                 = var.zone_vars.tag_env_name
      service_id                   = var.zone_vars.service_id
      webapp_prefix                = var.zone_vars.webapp_prefix
      k8s_cluster_name_begins_with = var.zone_vars.k8s_cluster_name_begins_with
      k8s_cluster_name             = var.zone_vars.k8s_cluster_name
      k8s_namespace                = var.zone_vars.k8s_namespace
      host_group_begins_with       = var.zone_vars.host_group_begins_with
      aws_account_id               = var.zone_vars.aws_account_id
      project_service              = var.zone_vars.project_service
      pg_to_host_propagation       = var.zone_vars.pg_to_host_propagation
      pg_to_service_propagation    = var.zone_vars.pg_to_service_propagation
    })
  ).default_rules

  # Filter only the templates requested in zone_vars.rules_templates
  selected_template_rules = {
    for k, v in local.default_rules_raw :
    k => v
    if contains(var.zone_vars.rules_templates, k)
  }

  # Merge template rules + tenant-exclusions
  zone_rules_merged = merge(
    local.selected_template_rules,
    try(var.zone_vars.tenant_exclusive_rules, {})
  )

  # Normalize: ensure attribute_rule + dimension_rule are single objects or null
  rules_list = [
    for key in sort(keys(local.zone_rules_merged)) : (
      # Normalize one rule at a time
      merge(
        local.zone_rules_merged[key],
        {
          # Keep attribute_rule only if it has >0 conditions
          attribute_rule = (
            try(local.zone_rules_merged[key].attribute_rule, null) != null &&
            length(try(local.zone_rules_merged[key].attribute_rule.attribute_conditions, [])) > 0
          ) ? local.zone_rules_merged[key].attribute_rule : null

          # Keep dimension_rule only if dimension_conditions exists
          dimension_rule = (
            try(local.zone_rules_merged[key].dimension_rule, null) != null &&
            try(local.zone_rules_merged[key].dimension_rule.dimension_conditions, null) != null
          ) ? local.zone_rules_merged[key].dimension_rule : null
        }
      )
    )
  ]
}
