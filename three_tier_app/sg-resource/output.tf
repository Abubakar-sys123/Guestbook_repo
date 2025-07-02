output "lambda_sg_id" {
  description = "Security Group ID for Lambda"
  value       = aws_security_group.lambda_sg.id
}

output "rds_sg_id" {
  description = "Security Group ID for RDS"
  value       = aws_security_group.rds_sg.id
}

output "rds_endpoint_sg_id" {
  description = "Security Group ID for RDS VPC Endpoint"
  value       = aws_security_group.rds_endpoint_sg.id
}

output "secrets_endpoint_sg_id" {
  description = "Security Group ID for Secrets Manager VPC Endpoint"
  value       = aws_security_group.secrets_endpoint_sg.id
}

