locals {
  dynatrace_url_param_name = "dt-url"

  dynatrace_ingest_url = var.ingestion_type == "metrics" ? data.aws_secretsmanager_secret_version.dt_endpoint.secret_string : data.aws_secretsmanager_secret_version.dt_logs_api_endpoint.secret_string

  dynatrace_access_key = var.ingestion_type == "metrics" ? data.aws_secretsmanager_secret_version.cw_metrics_api_token.secret_string : data.aws_secretsmanager_secret_version.cw_logs_api_token.secret_string

  firehose_name      = var.ingestion_type == "metrics" ? "cc-cosmos-cwm-firehose" : "cc-cosmos-cwl-firehose"
  cw_log_group_name  = "${local.firehose_name}-log-group"
  cw_log_stream_name = "${local.firehose_name}-log-stream"
  s3_backup_prefix   = "backup/failed/"
  s3_error_prefix    = "errors/"
}

# This Firehose stream delivers CloudWatch metrics or logs to a Dynatrace HTTP endpoint.
# It supports backup to S3 for failed records and includes buffering, retry, and logging configurations.
resource "aws_kinesis_firehose_delivery_stream" "dynatrace_http_stream" {
  name        = local.firehose_name
  destination = "http_endpoint"

  http_endpoint_configuration {
    name               = "Dynatrace"
    url                = local.dynatrace_ingest_url
    s3_backup_mode     = "FailedDataOnly"
    buffering_size     = var.buffering_size
    buffering_interval = var.buffering_interval
    retry_duration     = var.retry_duration

    role_arn   = aws_iam_role.cc_cosmos_cwl_firehose_access_role.arn
    access_key = local.dynatrace_access_key
    request_configuration {
      content_encoding = "GZIP"

      # only for CloudWatch metrics
      dynamic "common_attributes" {
        for_each = var.ingestion_type == "metrics" ? [1] : []
        content {
          name  = local.dynatrace_url_param_name
          value = data.aws_secretsmanager_secret_version.dt_endpoint_internal.secret_string
        }
      }
    }

    # for failed puts to destination 
    s3_configuration {
      role_arn            = aws_iam_role.cc_cosmos_cwl_firehose_access_role.arn
      bucket_arn          = aws_s3_bucket.cwl_backup_bucket.arn
      prefix              = local.s3_backup_prefix
      error_output_prefix = local.s3_error_prefix

      buffering_size     = var.buffering_size
      buffering_interval = var.buffering_interval
      compression_format = "GZIP"

      # Encryption for the backup
      kms_key_arn = aws_kms_key.cc_cosmos_s3_kms_key.arn
    }

    cloudwatch_logging_options {
      enabled         = true
      log_group_name  = local.cw_log_group_name
      log_stream_name = local.cw_log_stream_name
    }
  }
  server_side_encryption {
    enabled  = true
    key_arn  = aws_kms_key.cc_cosmos_s3_kms_key.arn
    key_type = "CUSTOMER_MANAGED_CMK"
  }

  tags = var.tags
}

resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  count             = var.ingestion_type == "logs" ? 1 : 0
  name              = var.cloudwatch_log_group_name
  retention_in_days = var.log_retention_days
  kms_key_id        = aws_kms_key.cc_cosmos_s3_kms_key.arn
  tags              = var.tags
}

resource "aws_cloudwatch_log_destination" "cloudwatch_logs_destination" {
  count      = var.ingestion_type == "logs" ? 1 : 0
  name       = var.destination_name
  role_arn   = aws_iam_role.cwl_to_firehose_role[0].arn
  target_arn = aws_kinesis_firehose_delivery_stream.dynatrace_http_stream.arn
  tags       = var.tags
}