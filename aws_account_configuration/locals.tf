locals {
  # ------------------------------
  # 1️ Optional exclusive services (map of lists)
  #    - Overrides defaults if defined
  # ------------------------------
  exclusive_services = lookup(var.tenant_vars, "optional_exclusive_services", {})

  # ------------------------------
  # 2️ Optional exclude services (list)
  #    - Will remove these services from the default service list
  #    - Only applies if exclusive_services is not defined
  #    - Default: empty list
  # ------------------------------
  optional_exclude_services = lookup(var.tenant_vars, "optional_exclude_services", [])

  # ------------------------------
  # 3️ Filter defaults by optional exclude services
  # ------------------------------
  filtered_defaults = {
    for k, v in var.default_services :
    k => v if !(contains(local.optional_exclude_services, k))
  }

  # ------------------------------
  # 4️ Optional top-up services (map)
  #    - Merge on top of filtered defaults
  #    - Default: empty map
  # ------------------------------
  top_up_services = lookup(var.tenant_vars, "optional_services_top_up", {})
  computed_services = merge(local.filtered_defaults, local.top_up_services)

  # ------------------------------
  # 5️ Final services to configure
  #    - If exclusive_services has keys → use it
  #    - Otherwise → use computed_services (filtered defaults + top-up)
  #    - Ensure type consistency with tomap()
  # ------------------------------
  services_to_configure = length(local.exclusive_services) > 0 ? local.exclusive_services : local.computed_services
}
