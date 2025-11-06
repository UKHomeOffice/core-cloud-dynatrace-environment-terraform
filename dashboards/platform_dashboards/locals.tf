
locals {
  gen2 = startswith(var.filename, "classic_") ? true : false
  groups_to_share_map = local.gen2 ? groups_to_share : {}
}
