variable "name" {
  description = "Name of the log storage rule."
  type        = string
}

variable "enabled" {
  description = "Whether the log storage rule is enabled."
  type        = bool
  default     = true
}

variable "send_to_storage" {
  description = "Whether to send logs to storage."
  type        = bool
  default     = true
}

variable "matcher_attribute" {
  description = "Attribute to match."
  type        = string
}

variable "matcher_operator" {
  description = "Operator for the matcher."
  type        = string
}

variable "matcher_values" {
  description = "Values for the matcher."
  type        = list(string)
}
