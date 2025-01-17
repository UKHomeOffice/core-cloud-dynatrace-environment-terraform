resource "dynatrace_alerting" "cosmos-ghes-alerting-profile" {
  name = var.ghes_alerting_profile_name
  rules {
    rule {
      include_mode     = var.ghes_include_mode
      delay_in_minutes = var.ghes_delay_in_minutes
      severity_level   = "AVAILABILITY"
    }
    rule {
      include_mode     = var.ghes_include_mode
      delay_in_minutes = var.ghes_delay_in_minutes
      severity_level   = "CUSTOM_ALERT"
    }
    rule {
      include_mode     = var.ghes_include_mode
      delay_in_minutes = var.ghes_delay_in_minutes
      severity_level   = "ERRORS"
    }
    rule {
      include_mode     = var.ghes_include_mode
      delay_in_minutes = var.ghes_delay_in_minutes
      severity_level   = "MONITORING_UNAVAILABLE"
    }
    rule {
      include_mode     = var.ghes_include_mode
      delay_in_minutes = var.ghes_delay_in_minutes
      severity_level   = "PERFORMANCE"
    }
    rule {
      include_mode     = var.ghes_include_mode
      delay_in_minutes = var.ghes_delay_in_minutes
      severity_level   = "RESOURCE_CONTENTION"
    }
  }
}