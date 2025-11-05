resource "dynatrace_json_dashboard" "this" {
  contents = file("${path.module}/platform_dashboards/${var.filename}.json")
}

resource "dynatrace_dashboard_sharing" "this" {
  for_each     = local.groups_to_share_map
  dashboard_id = dynatrace_json_dashboard.this.id
  enabled      = true
  permissions {
    permission {
      id    = each.key
      level = "EDIT"
      type  = "GROUP"
    }
  }
}