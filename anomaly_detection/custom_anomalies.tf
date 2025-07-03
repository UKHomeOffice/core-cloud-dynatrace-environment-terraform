# Custom apps - Crash rate increase
resource "dynatrace_custom_app_crash_rate" "core-cloud-custom_app_crash_rate" {
  crash_rate_increase {
    enabled        = true
    detection_mode = "auto"
    crash_rate_increase_auto {
      baseline_violation_percentage = 150
      concurrent_users              = 100
      sensitivity                   = "low"
    }
  }
}