resource "dynatrace_log_storage" "include_dynatrace_labelled_pods" {
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
