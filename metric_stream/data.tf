# Trust policy for Metric Stream IAM Role
data "aws_iam_policy_document" "assume_streams" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["streams.metrics.cloudwatch.amazonaws.com"]
    }
  }
}

# Permissions policy allowing metric stream to write to Firehose
data "aws_iam_policy_document" "allow_firehose_put" {
  statement {
    effect    = "Allow"
    actions   = ["firehose:PutRecord", "firehose:PutRecordBatch"]
    resources = [var.firehose_arn]
  }
}
