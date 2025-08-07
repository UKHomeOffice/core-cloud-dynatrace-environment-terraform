# Please note: 
#   A shared variable file, called `servicenow_shared_variables.tf`, 
#   contains more variable definition to share the variable 
#   definition with the `dynatrace_servicenow_integration` module 
#   which would come from the AWS secrets from the terragrunt 
#   pipeline, as TF_VARS.

variable "tenant_vars" {
  type = any
}

variable "AWS_MONITORING_PROFILE_SLACK_URL" {
  type = string
  description = "Slack url to send notification by the AWS_MONITORING module."
  default = "Provided to ignore when the module is skipped in an environment."
  sensitive = true
}
variable "GHES_SLACK_URLS" {
  type = map(string)
  description = "Slack urls to send GHES notifications."
  sensitive = true
  default = {} # "Provided to ignore when the module is skipped in an environment."
}
