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
  dynamic "rules" {
    for_each = var.zone_vars.rules
    content {
      rule {
        type = rules.value.type
        enabled = rules.value.enabled
        entity_selector = ""

        dynamic "attribute_rule" {
          for_each = rules.value.attribute_rule[*]
          content {
            entity_type = attribute_rule.value.entity_type
            attribute_conditions {
              condition {
                key = attribute_rule.value.attribute_conditions.condition.key
                operator = attribute_rule.value.attribute_conditions.condition.operator
              }
            }
          }
        }
        dynamic "dimension_rule" {
          for_each = rules.value.dimension_rule[*]
          content {
            applies_to = dimension_rule.applies_to
            dimension_conditions {
              condition {
                condition_type = dimension_rule.condition.condition_type
                rule_matcher = dimension_rule.condition.rule_matcher
                value = dimension_rule.condition.value
                key = dimension_rule.condition.key
              }
            }
          }
        }
      }
    }
  }
}
