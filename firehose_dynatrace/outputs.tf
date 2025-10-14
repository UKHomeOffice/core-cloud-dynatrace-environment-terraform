output "firehose_arn" {
  value = aws_kinesis_firehose_delivery_stream.this.arn
}

output "firehose_role_arn" {
  value = aws_iam_role.firehose.arn
}

output "backup_bucket" {
  value = aws_s3_bucket.backup.bucket
}
