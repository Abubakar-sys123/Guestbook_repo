
variable "api_name" {
  description = "Name of the API"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "Invoke ARN of the Lambda function"
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

