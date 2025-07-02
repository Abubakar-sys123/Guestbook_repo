terraform {
  backend "s3" {
    bucket         = "backend-abubakar19"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "Terraform-lock"
    encrypt        = true
  }
}

