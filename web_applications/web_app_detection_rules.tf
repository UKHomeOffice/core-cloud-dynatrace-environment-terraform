resource "dynatrace_application_detection_rule" "web_application" {
  application_identifier = dynatrace_web_application.this.name
  filter_config {
    application_match_target = var.application_match_target
    application_match_type   = var.application_match_type
    pattern                  = var.hostname
  }
}