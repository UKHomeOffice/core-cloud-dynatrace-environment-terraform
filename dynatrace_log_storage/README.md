# Dynatrace Log Storage Module

This module can be used to set Environment level Dynatrace Log Storage settings.
It allows you to include or exclude logs based on specific attributes, such as Kubernetes pod labels.

Log ingest rules can be defined at host, host group, or environment level. Ideally you would use host rules to include or exclude logs from specific hosts, but in some cases, you may want to apply rules at the environment level.

# Example Usage
```
module "dynatrace_log_storage_include_dynatrace_labelled_pods" {
  source          = "./dynatrace_log_storage"
  name            = "Include Dynatrace Labelled Pods"
  enabled         = true
  send_to_storage = true

// DT docs are wrong - Use https://github.com/dynatrace-oss/terraform-provider-dynatrace/blob/a02c5b5b61cfc1d216508202ec7e4f6bd4787069/dynatrace/api/builtin/logmonitoring/logstoragesettings/settings/enums.go#L47-L69 for valid values
  matcher_attribute = "k8s.pod.label"
  matcher_operator  = "MATCHES"
  matcher_values    = ["dynatrace-logs=true"]
}
```