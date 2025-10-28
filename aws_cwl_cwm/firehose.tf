# This Firehose stream delivers CloudWatch metrics or logs to a Dynatrace HTTP endpoint.
# It supports backup to S3 for failed records and includes buffering, retry, and logging configurations.
resource "aws_kinesis_firehose_delivery_stream" "dynatrace_http_stream" {
  name        = var.firehose_name
  destination = "http_endpoint"

  http_endpoint_configuration {
    name               = "Dynatrace"
    url                = data.aws_secretsmanager_secret_version.dt_endpoint.secret_string
    s3_backup_mode     = "FailedDataOnly"
    buffering_size     = var.buffering_size
    buffering_interval = var.buffering_interval
    retry_duration     = var.retry_duration

    role_arn = aws_iam_role.cc_cosmos_cwl_firehose_access_role.arn

    access_key = var.ingestion_type == "metrics" ? data.aws_secretsmanager_secret_version.cw_metrics_api_token.secret_string : data.aws_secretsmanager_secret_version.cw_logs_api_token.secret_string

    request_configuration {
      content_encoding = "GZIP"

      # only for CloudWatch metrics
      dynamic "common_attributes" {
        for_each = var.ingestion_type == "metrics" ? var.common_attributes : []
        content {
          name  = common_attributes.value.name
          value = common_attributes.value.value
        }
      }
    }

    # for failed puts to destination 
    s3_configuration {
      role_arn            = aws_iam_role.cc_cosmos_cwl_firehose_access_role.arn
      bucket_arn          = aws_s3_bucket.cwl_backup_bucket.arn
      prefix              = var.s3_backup_prefix
      error_output_prefix = var.s3_error_prefix

      buffering_size     = var.buffering_size
      buffering_interval = var.buffering_interval
      compression_format = "GZIP"

      # Encryption for the backup
      kms_key_arn = aws_kms_key.cc_cosmos_s3_kms_key.arn
    }

    cloudwatch_logging_options {
      enabled         = true
      log_group_name  = var.cw_log_group_name
      log_stream_name = var.cw_log_stream_name
    }
  }

  tags = var.tags
}



