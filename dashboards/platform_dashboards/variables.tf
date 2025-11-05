variable "files" {
  type = string
}
variable "groups_to_share" {
  type    = list(string)
  default = []
}