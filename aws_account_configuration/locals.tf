locals {
  # Initialise the exclusive service map (to be empty if not defined)
  exclusive_services = lookup(var.tenant_vars, "optional_exclusive_services", {})

  # Initialise the topup service map (to be empty if not defined)
  top_up_services = lookup(var.tenant_vars, "optional_services_top_up", {})

  # Merge the topup service map with the default service map
  computed_services = merge(var.default_services, local.top_up_services)

  # Finally choose the exclusive service map *if it is not empty*
  # over the computed service map
  services_to_configure = length(local.exclusive_services) > 0 ? local.exclusive_services : local.computed_services

  default_tags_to_monitor = var.tags_to_monitor
}
