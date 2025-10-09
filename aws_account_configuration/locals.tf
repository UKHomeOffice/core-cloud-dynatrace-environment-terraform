locals {
  # Ensure exclusive_services is a list
  exclusive_services = lookup(var.tenant_vars, "optional_exclusive_services", [])

  # Filter defaults safely
  filtered_defaults = {
    for k, v in var.default_services :
    k => v if !(contains(local.exclusive_services, k))
  }

  # Optional top-up services
  top_up_services = lookup(var.tenant_vars, "optional_services_top_up", {})

  # Final services
  services_to_configure = merge(local.filtered_defaults, local.top_up_services)
}

