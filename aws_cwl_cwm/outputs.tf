output "cwl_backup_bucket" {
  description = "The name of the S3 bucket created for CloudWatch Logs backup."
  value       = aws_s3_bucket.cwl_backup_bucket.bucket
}
output "firehose_destination" {
  description = "Destination type of the delivery stream"
  value       = aws_kinesis_firehose_delivery_stream.dynatrace_http_stream.destination
}
output "kms_key_arn" {
  description = "The ARN of the KMS key used for S3 encryption."
  value       = aws_kms_key.cc_cosmos_s3_kms_key.arn
}

output "firehose_stream_arn" {
  description = "ARN of the Kinesis Firehose delivery stream"
  value       = aws_kinesis_firehose_delivery_stream.dynatrace_http_stream.arn
}