

resource "dynatrace_log_storage" "dynatrace_log_storage_rule" {
  name            = var.name
  enabled         = var.enabled
  send_to_storage = var.send_to_storage

  matchers {
    matcher {
      attribute = var.matcher_attribute
      operator  = var.matcher_operator
      values    = var.matcher_values
    }
  }
}
