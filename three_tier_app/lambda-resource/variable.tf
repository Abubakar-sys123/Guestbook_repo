
variable "function_name" {
  type        = string
  description = "Name of the Lambda function"
}

variable "handler" {
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "runtime" {
  type        = string
  default     = "python3.11"
}

variable "lambda_zip_path" {
  description = "Path to zipped Lambda deployment package"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for Lambda"
  type        = list(string)
}

variable "lambda_sg_id" {
  description = "Security group ID for Lambda"
  type        = string
}

variable "secret_name" {
  description = "Secrets Manager name"
  type        = string
}

variable "secret_arn" {
  description = "ARN of the secret"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "api_gateway_invoke_arn" {
  description = "Full ARN of the API Gateway used in Lambda permission"
  type        = string
}
variable "layer_arn" {
  description = "ARN of the PyMySQL Lambda Layer"
  type        = string
}

