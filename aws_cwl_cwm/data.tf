data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

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
  secret_id = data.aws_secretsmanager_secret.dt_endpoint_internal.id
}
data "aws_secretsmanager_secret" "dt_endpoint_internal" {
  name = var.dt_endpoint_internal_name
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

# Trust policy to allow CWL to write to Firehose stream
data "aws_iam_policy_document" "cwl_assume_role" {
  count = var.ingestion_type == "logs" ? 1 : 0
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["logs.${data.aws_region.current.name}.amazonaws.com"]
    }
    condition {
      test     = "StringLike"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:*"
      ]
    }
  }
}

# Permissions policy allowing logs to write to Firehose
data "aws_iam_policy_document" "allow_firehose_put" {
  count = var.ingestion_type == "logs" ? 1 : 0
  statement {
    effect  = "Allow"
    actions = ["firehose:PutRecord", "firehose:PutRecordBatch"]
    resources = [aws_kinesis_firehose_delivery_stream.cwl_firehose.arn]
  }
}