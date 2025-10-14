# IAM role for Metric Stream → Firehose
resource "aws_iam_role" "metric_stream_to_firehose" {
  name               = "${var.metrics_stream_name}-${var.env_name}-ms-role"
  assume_role_policy = data.aws_iam_policy_document.assume_streams.json
}

# Attach permissions to allow PutRecord/PutRecordBatch
resource "aws_iam_role_policy" "ms_policy" {
  role   = aws_iam_role.metric_stream_to_firehose.id
  policy = data.aws_iam_policy_document.allow_firehose_put.json
}

# CloudWatch Metric Stream
resource "aws_cloudwatch_metric_stream" "this" {
  name                            = "${var.metrics_stream_name}-${var.env_name}"
  firehose_arn                    = module.firehose_dynatrace.firehose_arn
  role_arn                        = aws_iam_role.metric_stream_to_firehose.arn
  output_format                   = var.output_format
  include_linked_accounts_metrics = var.include_linked_accounts_metrics

  dynamic "include_filter" {
    for_each = var.include_filter
    content {
      namespace    = include_filter.key
      metric_names = include_filter.value
    }
  }

  dynamic "exclude_filter" {
    for_each = var.exclude_filter
    content {
      namespace    = exclude_filter.key
      metric_names = exclude_filter.value
    }
  }
}
