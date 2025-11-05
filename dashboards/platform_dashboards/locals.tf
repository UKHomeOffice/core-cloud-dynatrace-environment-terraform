
locals {
  groups_to_share_map = { for group in var.groups_to_share : group => group }
}
