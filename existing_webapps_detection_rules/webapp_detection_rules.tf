resource "dynatrace_application_detection_rule" "this" {
  application_identifier = var.web_application_id
  filter_config {
    application_match_target = var.application_match_target
    application_match_type   = var.application_match_type
    pattern                  = var.hostname
  }
}
