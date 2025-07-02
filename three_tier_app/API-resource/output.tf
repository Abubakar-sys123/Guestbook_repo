
output "api_id" {
  value = aws_api_gateway_rest_api.this.id
}

output "api_endpoint" {
  value = "https://${aws_api_gateway_rest_api.this.id}.execute-api.${var.region}.amazonaws.com/dev"
}

