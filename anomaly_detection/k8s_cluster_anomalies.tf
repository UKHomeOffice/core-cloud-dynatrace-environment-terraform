resource "dynatrace_k8s_cluster_anomalies" "core-cloud-k8s-cluster-anomalies" {
  scope = "environment"
  cpu_requests_saturation {
    enabled = false
  }
  memory_requests_saturation {
    enabled = false
  }
  monitoring_issues {
    enabled = true
    configuration {
      observation_period_in_minutes = 20
      sample_period_in_minutes      = 10
    }
  }
  pods_saturation {
    enabled = false
  }
  readiness_issues {
    enabled = true
    configuration {
      observation_period_in_minutes = 5
      sample_period_in_minutes      = 4
    }
  }
}
