variable "secret_name" {
  description = "Name of the secret"
  type        = string
  default     = "guestbook-secret"
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_host" {
  description = "RDS host endpoint"
  type        = string
}

variable "db_port" {
  description = "RDS port"
  type        = number
  default     = 3306
}

variable "db_name" {
  description = "Database name"
  type        = string
}

