# Cloudwatch Logs DT API token
data "aws_secretsmanager_secret" "cw_logs_api_token" {
  name = var.dt_cwl_api_token
}

data "aws_secretsmanager_secret_version" "cw_logs_api_token" {
  secret_id = data.aws_secretsmanager_secret.cw_logs_api_token.id
}

# CloudWatch Metrics DT API token
data "aws_secretsmanager_secret" "cw_metrics_api_token" {
  name = var.dt_cwm_api_token
}

data "aws_secretsmanager_secret_version" "cw_metrics_api_token" {
  secret_id = data.aws_secretsmanager_secret.cw_metrics_api_token.id
}

# DT destination endpoint
data "aws_secretsmanager_secret" "dt_endpoint" {
  name = var.dt_endpoint
}

data "aws_secretsmanager_secret_version" "dt_endpoint" {
  secret_id = data.aws_secretsmanager_secret.dt_endpoint.id
}