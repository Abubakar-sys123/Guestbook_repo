output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.guestbook_frontend.bucket
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.guestbook_frontend.arn
}

