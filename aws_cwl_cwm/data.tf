# Cloudwatch Logs DT API token
data "aws_secretsmanager_secret" "cw_logs_api_token" {
  name = var.dt_cwl_api_token_name
}

data "aws_secretsmanager_secret_version" "cw_logs_api_token" {
  secret_id = data.aws_secretsmanager_secret.cw_logs_api_token.id
}

# CloudWatch Metrics DT API token
data "aws_secretsmanager_secret" "cw_metrics_api_token" {
  name = var.dt_cwm_api_token_name
}

data "aws_secretsmanager_secret_version" "cw_metrics_api_token" {
  secret_id = data.aws_secretsmanager_secret.cw_metrics_api_token.id
}

# DT destination endpoint
data "aws_secretsmanager_secret" "dt_endpoint" {
  name = var.dt_endpoint_name
}
# DT destination endpoint internal
data "aws_secretsmanager_secret_version" "dt_endpoint_internal" {
  secret_id = var.dt_endpoint_internal_name.dt_endpoint_internal.id
}
data "aws_secretsmanager_secret" "dt_endpoint_internal"{
  name = data.dt_endpoint_internal_name
}

data "aws_secretsmanager_secret_version" "dt_endpoint" {
  secret_id = data.aws_secretsmanager_secret.dt_endpoint.id
}

# DT logs ingestion endpoint
data "aws_secretsmanager_secret" "dt_logs_api_endpoint" {
  name = var.dt_logs_api_endpoint_name
}

data "aws_secretsmanager_secret_version" "dt_logs_api_endpoint" {
  secret_id = data.aws_secretsmanager_secret.dt_logs_api_endpoint.id
}