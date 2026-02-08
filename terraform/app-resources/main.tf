# We need this to keep the resource names unique
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "app_data" {
  bucket = "pipecd-demo-storage-\${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "PipeCD Demo Storage"
    Environment = "Staging"
    ManagedBy   = "PipeCD-GitOps"
  }
}

# Output the bucket name so we can see it in PipeCD logs
output "bucket_name" {
  value = aws_s3_bucket.app_data.id
}