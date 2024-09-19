variable "aws_connections" {
  description = "A map of AWS Connections to create. The key is the name of the connection."
  type = map(object({
    account_id = string
    role_name  = string
  }))
  default = {}
}
