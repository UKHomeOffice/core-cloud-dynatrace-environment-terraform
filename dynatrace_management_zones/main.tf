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
    for_each = var.zone_vars.rules != null ? var.zone_vars.rules : {}
    content {
      rule {
        type = rules.value.type
        enabled = rules.value.enabled
        entity_selector = ""

        dynamic "attribute_rule" {
          for_each = rules.value.attribute_rule[*]
          content {
            azure_to_pgpropagation = attribute_rule.value.azure_to_pgpropagation
            azure_to_service_propagation = attribute_rule.value.azure_to_service_propagation
            custom_device_group_to_custom_device_propagation = attribute_rule.value.custom_device_group_to_custom_device_propagation
            host_to_pgpropagation = attribute_rule.value.host_to_pgpropagation
            pg_to_host_propagation = attribute_rule.value.pg_to_host_propagation
            pg_to_service_propagation = attribute_rule.value.pg_to_service_propagation
            service_to_host_propagation = attribute_rule.value.service_to_host_propagation
            service_to_pgpropagation = attribute_rule.value.service_to_pgpropagation
            entity_type = attribute_rule.value.entity_type
            attribute_conditions {
              condition {
                key = attribute_rule.value.attribute_conditions.condition.key
                operator = attribute_rule.value.attribute_conditions.condition.operator
                case_sensitive = attribute_rule.value.attribute_conditions.condition.case_sensitive
                dynamic_key = attribute_rule.value.attribute_conditions.condition.dynamic_key
                dynamic_key_source = attribute_rule.value.attribute_conditions.condition.dynamic_key_source
                entity_id = attribute_rule.value.attribute_conditions.condition.entity_id
                enum_value = attribute_rule.value.attribute_conditions.condition.enum_value
                integer_value = attribute_rule.value.attribute_conditions.condition.integer_value
                string_value = attribute_rule.value.attribute_conditions.condition.string_value
                tag = attribute_rule.value.attribute_conditions.condition.tag
              }
            }
          }
        }

        dynamic "dimension_rule" {
          for_each = rules.value.dimension_rule[*]
          content {
            applies_to = dimension_rule.value.applies_to
            dimension_conditions {
              condition {
                condition_type = dimension_rule.value.dimension_conditions.condition.condition_type
                rule_matcher = dimension_rule.value.dimension_conditions.condition.rule_matcher
                value = dimension_rule.value.dimension_conditions.condition.value
                key = dimension_rule.value.dimension_conditions.condition.key
              }
            }
          }
        }

      }
    }
  }
}
