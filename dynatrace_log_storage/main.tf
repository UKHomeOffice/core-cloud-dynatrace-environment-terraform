
resource "dynatrace_log_storage" "dynatrace_log_storage_rule" {
  for_each = { for rule in var.rules : rule.name => rule }

  name              = each.value.name
  enabled           = each.value.enabled
  send_to_storage   = each.value.send_to_storage

  matchers {
    matcher {
      attribute = each.value.matcher_attribute
      operator  = each.value.matcher_operator
      values    = each.value.matcher_values
    }
  }
}
