terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_management_zone_v2" "management_zone" {

  name = var.zone_name
  description = var.zone_vars.description
  rules {
    dynamic "rule" {
      for_each = var.zone_vars.rules
      content {
        type = rule.value.type
        enabled = rule.value.enabled
        entity_selector = ""

        dynamic "attribute_rule" {
          for_each = rule.value.attribute_rule
          content {
            entity_type = attribute_rule.entity_type
            attribute_conditions {
              condition {
                key = attribute_rule.value.attribute_conditions.condition.key
                operator = attribute_rule.value.attribute_conditions.condition.operator
              }
            }
          }
        }

      }
    }
  }
}
