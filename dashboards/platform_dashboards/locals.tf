
locals {
  gen2 = startswith(var.filename, "classic_") ? 1 : 0
  groups_to_share_map = local.gen2 ? { for group in var.groups_to_share : group => group } : {}
}
