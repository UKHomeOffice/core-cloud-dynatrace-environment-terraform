output "cwl_backup_bucket" {
  description = "The name of the S3 bucket created for CloudWatch Logs backup."
  value       = aws_s3_bucket.cwl_backup_bucket.bucket
}