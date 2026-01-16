terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_autotag_v2" "autotag" {
  name        = var.autotag_name
  description = try(var.autotag_vars.description, "Autotag for ${var.autotag_name}")

  # Only create the rules block if there are rules to apply
  dynamic "rules" {
    for_each = local.autotag_rules_processed != {} ? [true] : []
    content {
      dynamic "rule" {
        for_each = local.autotag_rules_processed
        content {
          type                = rule.value.type
          enabled             = rule.value.enabled
          value_format        = try(rule.value.value_format, null)
          value_normalization = rule.value.value_normalization

          # Entity selector for SELECTOR-type rules
          entity_selector = try(rule.value.entity_selector, null)

          # Attribute rule for ME-type rules
          dynamic "attribute_rule" {
            for_each = rule.value.type == "ME" ? [try(rule.value.attribute_rule, {})] : []
            content {
              entity_type = attribute_rule.value.entity_type

              # Propagation flags (all optional, default false if not specified)
              azure_to_pgpropagation         = try(attribute_rule.value.azure_to_pgpropagation, false)
              azure_to_service_propagation    = try(attribute_rule.value.azure_to_service_propagation, false)
              host_to_pgpropagation          = try(attribute_rule.value.host_to_pgpropagation, false)
              pg_to_host_propagation         = try(attribute_rule.value.pg_to_host_propagation, false)
              pg_to_service_propagation      = try(attribute_rule.value.pg_to_service_propagation, false)
              service_to_host_propagation    = try(attribute_rule.value.service_to_host_propagation, false)
              service_to_pgpropagation       = try(attribute_rule.value.service_to_pgpropagation, false)

              # Exactly one conditions block
              dynamic "conditions" {
                for_each = [true]
                content {
                  dynamic "condition" {
                    for_each = try(attribute_rule.value.conditions, [])
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
        }
      }
    }
  }
}