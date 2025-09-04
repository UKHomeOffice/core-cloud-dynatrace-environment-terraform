terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

locals {
  default_rules_raw = merge([
    for template in var.zone_vars.rules_templates :
    yamldecode(
      templatefile("${path.module}/${template}", {
        project_id           = try(var.zone_vars.project_id, "")
        host_prefix          = try(var.zone_vars.host_prefix, "")
        webapp_prefix        = try(var.zone_vars.webapp_prefix, "")
        k8s_cluster_operator = try(var.zone_vars.k8s_cluster_operator, "EXISTS")
        k8s_cluster_value    = try(var.zone_vars.k8s_cluster_value, "")
        account_id           = try(var.zone_vars.account_id, "992382599151")
      })
    ).default_rules
  ]...)

  rules_map = {
    for rule_key, rule_value in try(var.zone_vars.tenant_exclusive_rules, {}) :
    rule_key => merge(
      try(local.default_rules_raw[rule_key], {}),
      try(rule_value, {}),
      {
        enabled = try(local.default_rules_raw[rule_key].enabled, true)
        type    = try(local.default_rules_raw[rule_key].type, "SELECTOR")
        attribute_rule = try(local.default_rules_raw[rule_key].attribute_rule, null) != null ? merge(
          try(local.default_rules_raw[rule_key].attribute_rule, {}),
          try(rule_value.attribute_rule, {}),
          {
            entity_type = try(local.default_rules_raw[rule_key].attribute_rule.entity_type, rule_value.attribute_rule.entity_type, null)
          }
        ) : null
      }
    )
  }

  zone_vars_preprocessed = merge(
    { rules_templates = var.zone_vars.rules_templates },
    var.zone_vars,
    { rules = local.rules_map }
  )
}

resource "dynatrace_management_zone_v2" "management_zone" {
  name        = var.zone_name
  description = try(var.zone_vars.description, "Management zone for ${var.zone_name}")
  legacy_id   = try(var.zone_vars.legacy_id, null)

  dynamic "rules" {
    for_each = try(local.zone_vars_preprocessed.rules, null) != null ? [local.zone_vars_preprocessed.rules] : []
    content {
      dynamic "rule" {
        for_each = rules.value
        content {
          type            = rule.value.type
          enabled         = rule.value.enabled
          entity_selector = try(rule.value.entity_selector, null)

          dynamic "attribute_rule" {
            for_each = try(rule.value.attribute_rule, null) != null ? [rule.value.attribute_rule] : []
            content {
              azure_to_pgpropagation                  = try(attribute_rule.value.azure_to_pgpropagation, null)
              azure_to_service_propagation            = try(attribute_rule.value.azure_to_service_propagation, null)
              custom_device_group_to_custom_device_propagation = try(attribute_rule.value.custom_device_group_to_custom_device_propagation, null)
              host_to_pgpropagation                   = try(attribute_rule.value.host_to_pgpropagation, null)
              pg_to_host_propagation                  = try(attribute_rule.value.pg_to_host_propagation, null)
              pg_to_service_propagation               = try(attribute_rule.value.pg_to_service_propagation, null)
              service_to_host_propagation             = try(attribute_rule.value.service_to_host_propagation, null)
              service_to_pgpropagation                = try(attribute_rule.value.service_to_pgpropagation, null)
              entity_type                             = try(attribute_rule.value.entity_type, null)

              dynamic "attribute_conditions" {
                for_each = try(attribute_rule.value.attribute_conditions, [])
                content {
                  dynamic "condition" {
                    for_each = attribute_conditions.value
                    content {
                      key                 = condition.value.key
                      operator            = condition.value.operator
                      case_sensitive      = try(condition.value.case_sensitive, null)
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
          }

          dynamic "dimension_rule" {
            for_each = try(rule.value.dimension_rule, null) != null ? [rule.value.dimension_rule] : []
            content {
              applies_to = dimension_rule.value.applies_to
              dimension_conditions {
                condition {
                  condition_type = dimension_rule.value.dimension_conditions.condition.condition_type
                  rule_matcher   = dimension_rule.value.dimension_conditions.condition.rule_matcher
                  value          = dimension_rule.value.dimension_conditions.condition.value
                  key            = try(dimension_rule.value.dimension_conditions.condition.key, null)
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
  value = local.zone_vars_preprocessed
}