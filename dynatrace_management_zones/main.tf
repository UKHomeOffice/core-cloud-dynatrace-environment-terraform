terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_management_zones" "management_zone" {
  for_each = var.tenant_vars.management_zones

  name = var.zone_name
  description = var.zone_vars.description
  dynamic "rules" {
    for_each = var.zone_vars.rules
    content {
      name = rules.key
      type = rules.value.type
      enabled = rules.value.enabled
      entity_selector = ""
    }
  }
}
