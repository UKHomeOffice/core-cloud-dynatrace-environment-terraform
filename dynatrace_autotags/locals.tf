locals {
  ##################################
  # Load default autotag rules from template
  ##################################
  autotag_default_rules_raw = yamldecode(
    templatefile("${path.module}/autotag_rules.tftpl", {
      project_id = var.project_id
    })
  ).default_rules

  ##################################
  # Select templates
  ##################################
  autotag_rules_templates = coalesce(
    try(var.autotag_vars.autotag_rules_templates, null),
    var.default_autotag_rules
  )

  ##################################
  # Filter defaults based on selected templates
  ##################################
  filtered_default_rules = {
    for k, v in local.autotag_default_rules_raw :
    k => v
    if local.autotag_rules_templates != null && contains(local.autotag_rules_templates, k)
  }

  ##################################
  # Merge defaults + tenant overrides (tenant overrides take precedence)
  ##################################
  autotag_rules_processed = merge(
    local.filtered_default_rules,
    try(var.autotag_vars.tenant_exclusive_rules, {})
  )
}