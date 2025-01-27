resource "dynatrace_json_dashboard" "this" {
    contents = var.dashboard_json
}