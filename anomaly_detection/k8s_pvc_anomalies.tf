resource "dynatrace_k8s_pvc_anomalies" "core-cloud-k8s-pvc-anomalies" {
  scope = "environment"
  low_disk_space_critical {
    enabled = false
  }
  low_disk_space_critical_percentage {
    enabled = true
    configuration {
      observation_period_in_minutes = 5
      sample_period_in_minutes      = 3
      threshold                     = 5
    }
  }
}
