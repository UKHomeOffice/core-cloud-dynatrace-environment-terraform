variable "tenant_vars" {
  type = any
}

# Please note: 
#   A shared variable file, called `servicenow_shared_variables.tf`, 
#   contains more variable definition to share the variable 
#   definition with the `dynatrace_servicenow_integration` module 
#   which would come from the AWS secrets from the terragrunt 
#   pipeline, as TF_VARS.