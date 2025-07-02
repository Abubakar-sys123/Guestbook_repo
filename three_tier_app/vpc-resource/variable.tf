variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}
variable "private_subnet_cidr_1" {
  description = "CIDR block for the public subnet"
  type        = string
}
variable "availability_zone" {
  description = "Availability Zone for the subnet"
  type        = list(string)
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}
variable "nat_gateway_id" {
  description = "NAT Gateway ID for private subnet internet access"
  type        = string
}

