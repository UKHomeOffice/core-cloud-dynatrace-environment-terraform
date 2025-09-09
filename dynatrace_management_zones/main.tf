terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

locals {
  default_rules_raw = yamldecode(
      templatefile("${path.module}/rules.tftpl", {
        project_id           = var.zone_vars.project_id
        host_prefix          = var.zone_vars.host_prefix
        webapp_prefix        = var.zone_vars.webapp_prefix
        k8s_cluster_operator = var.zone_vars.k8s_cluster_operator
        k8s_cluster_value   = var.zone_vars.k8s_cluster_value
        acc_id           = var.zone_vars.aws_account_id
      })
  ).default_rules

  zone_rules_processed = merge(
    {
      for k, v in local.default_rules_raw :
      k => v
      if contains(var.zone_vars.rules_templates, k)
    },
    var.zone_vars.tenant_exclusive_rules
  )

}

resource "dynatrace_management_zone_v2" "management_zone" {
  name        = var.zone_name
  description = try(var.zone_vars.description, "Management zone for ${var.zone_name}")
  legacy_id   = try(var.zone_vars.legacy_id, null)

  dynamic "rules" {
    for_each = local.zone_rules_processed != null ? local.zone_rules_processed[*] : []
    # Create a 'rules' block if defined in the config.yaml, else skips all following dynamic blocks
    content {
      dynamic "rule" {
        for_each = local.zone_rules_processed
        # Creates one rule definition per entry inside the 'rules' section of the MZ config (name not used)
        content {
            type = rule.value.type
            enabled = rule.value.enabled
            entity_selector = try(rule.value.entity_selector, null)

          dynamic "attribute_rule" {
            for_each = try(rule.value.attribute_rule[*], {})
            # Creates an attribute rule block with conditions as defined - either this or dimension_rule
            content {
              azure_to_pgpropagation = try(attribute_rule.value.azure_to_pgpropagation, false)
              azure_to_service_propagation = try(attribute_rule.value.azure_to_service_propagation, false)
              custom_device_group_to_custom_device_propagation = try(attribute_rule.value.custom_device_group_to_custom_device_propagation, false)
              host_to_pgpropagation = try(attribute_rule.value.host_to_pgpropagation, false)
              pg_to_host_propagation = try(attribute_rule.value.pg_to_host_propagation, true)
              pg_to_service_propagation = try(attribute_rule.value.pg_to_service_propagation, true)
              service_to_host_propagation = try(attribute_rule.value.service_to_host_propagation, false)
              service_to_pgpropagation = try(attribute_rule.value.service_to_pgpropagation, false)
              entity_type = try(attribute_rule.value.entity_type, null)
              
              attribute_conditions {
                dynamic "condition" {
                  for_each = try(attribute_rule.value.attribute_conditions, [])
                  content {
                      key                 = condition.value.key
                      operator            = condition.value.operator
                      case_sensitive      = try(condition.value.case_sensitive, true)
                      dynamic_key         = try(condition.value.dynamic_key, null)
                      dynamic_key_source  = try(condition.value.dynamic_key_source, null)
                      entity_id           = try(condition.value.entity_id, null)
                      enum_value          = try(condition.value.enum_value, null)
                      integer_value       = try(condition.value.integer_value, null)
                      string_value        = try(condition.value.string_value, null)
                      tag                 = try(condition.value.tag, null)
                  }
                }
              }
            }
          }

          dynamic "dimension_rule" {
            for_each = try(rule.value.dimension_rule[*],{})
            # Creates a dimension rule block with conditions as defined - either this or attribute_rule
            content {
              applies_to = dimension_rule.value.applies_to
              dynamic "dimension_conditions" {
                for_each = dimension_rule.value.dimension_conditions != null ? dimension_rule.value.dimension_conditions[*] : []
                content {
                  dynamic "condition" {
                    for_each = try(dimension_rule.value.dimension_conditions[*],{})
                    content {
                      condition_type = condition.value.condition_type
                      rule_matcher = condition.value.rule_matcher
                      value = condition.value.value
                      key = condition.value.key
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

output "zone_var_output" {
  value = local.zone_rules_processed
}