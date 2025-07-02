variable "private_subnet_ids" {
  description = "Private subnet IDs for the RDS instance"
  type        = list(string)
}

variable "rds_sg_id" {
  description = "Security group ID for RDS instance"
  type        = string
}

variable "secret_name" {
  description = "Name of the existing secret in Secrets Manager"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID for the RDS instance"
  type        = string
}

