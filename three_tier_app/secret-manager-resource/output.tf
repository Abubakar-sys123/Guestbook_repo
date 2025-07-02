output "secret_arn" {
  description = "ARN of the stored secret"
  value       = aws_secretsmanager_secret.this.arn
}

