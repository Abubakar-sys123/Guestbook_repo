variable "bucket_name" {
  description = "Name of the S3 bucket for frontend hosting"
  type        = string
  default     = "guestbook-frontend-bucket-dev"

}
variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
  type        = string
}
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default = "10.0.0.0/16"
  type = string
}
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default= "10.0.188.0/24"
  type = string
}
variable "private_subnet_cidr_1" {
  description = "CIDR block for the public subnet"
  default= "10.0.115.0/24"
  type = string
}
variable "availability_zone" {
  description = "Availability Zone for the subnet"
  type        = list(string)
  default= ["us-east-1a", "us-east-1b"]
}
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.155.0/24"
  type        = string
}
variable "db_name" {
  description = "Name of the RDS database"
  type        = string
  default     = "guestbook"
}

variable "db_username" {
  description = "Master username for RDS"
  type        = string
  default     = "admin"
}

 variable "db_password" {
   description = "Master password for RDS"
   type        = string
   sensitive   = true
 }

