# The following variables would directly come from the
# terragrunt pipeline.
variable "servicenow_payload" {
  description = "Message to ServiceNow. Please refer to test pipeline in the terragrunt for implementation example."
  type = map(string)
}

variable "servicenow_alerting_rules" {
  type = map(object({
    include_mode = optional(string, "NONE") # According to https://registry.terraform.io/providers/dynatrace-oss/dynatrace/latest/docs/resources/alerting#nested-schema-for-rulesrule, 'NONE' applies to all monitored entities
    # TODO - This default tag value is to get the code working and 
    # does not match the modules documentation in 
    # https://registry.terraform.io/providers/dynatrace-oss/dynatrace/latest/docs/resources/alerting#nestedblock--rules - 
    # potentially be a bug in the module - 
    # Issue discussed in this conversation - https://hod-dsp.slack.com/archives/C0807UKF7RP/p1746542824632969
    tags = optional(list(string), ["intentional_invalid_tag"]) 
    delay_in_minutes = optional(number, 0)
  }))
}
