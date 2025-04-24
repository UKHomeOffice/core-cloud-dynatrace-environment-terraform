resource "dynatrace_json_dashboard" "cosmo_dynamodb_dashboard_template" {
   contents = templatefile("${path.module}/dynamodb/content.tftpl", {})

}