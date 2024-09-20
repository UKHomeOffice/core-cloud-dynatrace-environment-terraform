module "simple" {
  source = "../../"
  aws_connections = {
    "connection-1" = {
      account_id = "123"
      role_name  = "dynatrace_role"
    }
  }
}
