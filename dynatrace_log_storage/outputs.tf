output "dynatrace_log_storage_id" {
  description = "The ID of the Dynatrace log storage rule."
  value       = dynatrace_log_storage.include_dynatrace_labelled_pods.id
}
