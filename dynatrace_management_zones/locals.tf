locals {
  default_rules_raw = yamldecode(
    templatefile("${path.module}/rules.tftpl", {
      project_id                   = var.project_id
      env_name                     = var.zone_vars.env_name
      tag_env_name                 = var.zone_vars.env_name
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

  zone_rules_processed = merge(
    {
      for k, v in local.default_rules_raw :
      k => v if try(contains(var.zone_vars.rules_templates, k), false)
    },
    var.zone_vars.tenant_exclusive_rules
  )

  zone_rules_sorted = [
    for k in sort(keys(local.zone_rules_processed)) :
    local.zone_rules_processed[k]
  ]
}
