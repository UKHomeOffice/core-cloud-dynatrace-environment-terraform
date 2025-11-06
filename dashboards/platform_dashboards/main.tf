# Classic (gen2) dashboards
resource "dynatrace_json_dashboard" "this" {
  count    = local.gen2 ? 1 : 0
  contents = file("${path.module}/files/${var.filename}")
}

resource "dynatrace_dashboard_sharing" "this" {
  for_each     = local.groups_to_share_map
  dashboard_id = dynatrace_json_dashboard.this[0].id
  enabled      = true
  permissions {
    permission {
      id    = each.value
      level = "VIEW"
      type  = "GROUP"
    }
  }
}

# Gen3 dashboards

# count    = local.gen2 ? 0 : 1