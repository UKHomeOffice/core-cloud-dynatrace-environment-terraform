resource "dynatrace_json_dashboard" "tenant-review" {
    contents = data.github_repository_file.dtr-cs
}


data "github_repository_file" "dtr-cs" {
  repository          = "dynatrace-oss/CustomerSuccess"
  branch              = "main"
  file                = "Dynatrace Tenant Review/Dynatrace Tenant Review (1.10.3).json"
}
