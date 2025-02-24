
variable "aws_accounts" {
  description = "AWS accounts to add to the Dynatrace allow listDynatrace AWS Account IDs"
  type        = set(string)
}
