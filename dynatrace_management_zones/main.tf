terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_managment_zones" "management_zone" {
  for_each = var.tenant_vars.management_zones

  name = zone_name
  description = var.tenant_vars.description
  dynamic "rules" {
    for_each = var.tenant_vars.rules
    content {
      name = rules.key
      type = rules.value.type
      enabled = rules.value.enabled
      entity_selector = ""
    }
  }
}
