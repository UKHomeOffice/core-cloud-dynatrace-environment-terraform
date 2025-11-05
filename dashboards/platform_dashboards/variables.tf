variable "filename" {
  type = string
}
variable "groups_to_share" {
  type    = list(string)
  default = []
}