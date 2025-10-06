variable "rules" {
  description = "List of log storage rules."
  type = list(object({
    name              = string
    enabled           = optional(bool, true)
    send_to_storage   = optional(bool, true)
    matcher_attribute = string
    matcher_values    = list(string)
  }))
}
