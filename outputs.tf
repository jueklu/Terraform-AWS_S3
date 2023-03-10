# Output: S3 Bucket ARN
output "s3_bucket_arn" {
  value       = aws_s3_bucket.jklug-s3.arn
  description = "S3 ARN"
}