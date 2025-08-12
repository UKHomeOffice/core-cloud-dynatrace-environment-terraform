resource "dynatrace_k8s_cluster_anomalies" "core-cloud-k8s-cluster-anomalies" {
  scope = "environment"
  cpu_requests_saturation {
    enabled = false
  }
  memory_requests_saturation {
    enabled = false
  }
  monitoring_issues {
    enabled = false
  }
  pods_saturation {
    enabled = false
  }
  readiness_issues {
    enabled = false
  }
}
