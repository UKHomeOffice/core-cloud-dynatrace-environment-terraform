output "cwl_backup_bucket" {
  description = "The name of the S3 bucket created for CloudWatch Logs backup."
  value       = aws_s3_bucket.cwl_backup_bucket.bucket
}

output "firehose_access_role_arn" {
  value = aws_iam_role.cc_cosmos_cwl_firehose_access_role.arn
}
output "kms_key_arn" {
  description = "The ARN of the KMS key used for S3 encryption."
  value       = aws_kms_alias.cc_cosmos_firehose_s3_kms_alias.arn
}