terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_management_zone_v2" "management_zone" {
# Corresponds to the object structure defined in the variables.tf
# One zone entity, consisting of 0 or 1 'rules' blocks - which in turn consist of 1 or more individual 'rule' definitions

  name = var.zone_name
  description = var.zone_vars.description
  legacy_id = var.zone_vars.legacy_id
  dynamic "rules" {
    for_each = var.zone_vars.rules != null ? var.zone_vars.rules[*] : []
    # Create a 'rules' block if defined in the config.yaml, else skips all following dynamic blocks
    content {
      dynamic "rule" {
        for_each = var.zone_vars.rules
        # Creates one rule definition per entry inside the 'rules' section of the MZ config (name not used)
        content {
            type = rule.value.type
            enabled = rule.value.enabled
            entity_selector = rule.value.entity_selector

          dynamic "attribute_rule" {
            for_each = rule.value.attribute_rule[*]
            # Creates an attribute rule block with conditions as defined - either this or dimension_rule
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
            for_each = rule.value.dimension_rule[*]
            # Creates a dimension rule block with conditions as defined - either this or attribute_rule
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
}


output "zone_var_output"{
  value = "${var.zone_vars}"
}

output "zone_ids" {
  value = {
    for k, management_zone in dynatrace_management_zone_v2.management_zone : k => management_zone.id
  }
}
