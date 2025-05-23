# All the following variables must come from the 
# AWS secret from inside the terragrunt pipeline 
# and would be passed as TF_VAR from the pipeline.
variable "SERVICENOW_END_POINT" {
  description = "ServiceNow endpoint url."
  type        = string
}

variable "SERVICENOW_ENV_ID" {
  description = "The equivalent of the envid of the dynatrace. The id will be used as https://<this var>.service-now.com/oauth_token.do for oauth authentication."
  type        = string
}

variable "SERVICENOW_CLIENT_ID" {
  description = "Username for the above url."
  type        = string
  sensitive   = true
  #ephemeral = true
}

variable "SERVICENOW_CLIENT_SECRET" {
  description = "Password for the above url."
  type        = string
  sensitive   = true
  #ephemeral = true
}
