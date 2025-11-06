# Classic (gen2) dashboards
resource "dynatrace_json_dashboard" "this" {
  count    = startswith(var.filename, "classic_") ? 1 : 0
  contents = file("${path.module}/files/${var.filename}")
}

resource "dynatrace_dashboard_sharing" "this" {
  for_each     = local.groups_to_share_map
  dashboard_id = dynatrace_json_dashboard.this.id
  enabled      = true
  permissions {
    permission {
      id    = each.key
      level = "VIEW"
      type  = "GROUP"
    }
  }
}

# Gen3 dashboards
