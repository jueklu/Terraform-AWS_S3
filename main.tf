# S3 Bucket
# ---------
resource "aws_s3_bucket" "jklug-s3" {

  bucket = "jklug-testing123"
  force_destroy = true # Delete with terraform destroy
}

# Bucket Versioning
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.jklug-s3.id
  versioning_configuration {
    status = "Disabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.jklug-s3.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.jklug-s3.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
# End of S3 Bucket
# ----------------
