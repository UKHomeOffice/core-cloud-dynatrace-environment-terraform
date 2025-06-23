# output for dynatrace_log_storage module
output "dynatrace_log_storage_include_dynatrace_labelled_pods_id" {
  description = "The ID of the Dynatrace log storage rule for Dynatrace labelled pods."
  value       = module.dynatrace_log_storage_include_dynatrace_labelled_pods.dynatrace_log_storage_id
}

