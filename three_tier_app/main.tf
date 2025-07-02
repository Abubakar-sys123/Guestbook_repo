#this is new
#this is main module
module "s3" {
  source      = "./s3_resource"
  bucket_name = var.bucket_name
}
module "cloudfront" {
  source      = "./cloudfront-resource"
  bucket_name = var.bucket_name
}

module "vpc" {
  source               = "./vpc-resource"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr_1 = var.private_subnet_cidr_1
  private_subnet_cidr  = var.private_subnet_cidr
  availability_zone    = var.availability_zone
  nat_gateway_id       = module.nat_gateway.nat_gateway_id
}
module "security_groups" {
  source   = "./sg-resource"
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
}


module "nat_gateway" {
  source                   = "./nat gateway-resource"
  public_subnet_id         = module.vpc.public_subnet_id
}

module "api_gateway" {
  source                = "./API-resource"
  api_name              = "guestbook-api"
  lambda_invoke_arn     = module.lambda.lambda_invoke_arn
  lambda_function_name  = module.lambda.lambda_function_name
  region = var.aws_region
}

data "aws_secretsmanager_secret" "guestbook_secret" {
  name = "guestbook-secret"
}
data "aws_caller_identity" "current" {}

module "lambda" {
  source                  = "./lambda-resource"
  function_name           = "guestbook-lambda"
  lambda_zip_path         = "lambda-resource/guestbook.zip"
  subnet_ids              = [module.vpc.private_subnet_id]
  lambda_sg_id            = module.security_groups.lambda_sg_id
  secret_name             = "guestbook-secret"
  secret_arn              = data.aws_secretsmanager_secret.guestbook_secret.arn
  api_gateway_invoke_arn  = "arn:aws:execute-api:${var.aws_region}:${data.aws_caller_identity.current.account_id}:${module.api_gateway.api_id}/*/*/*"
  layer_arn               = "arn:aws:lambda:us-east-1:700807700625:layer:pymysql-layer:2"
}
module "rds" {
  source              = "./rds-resource"
  vpc_id = module.vpc.vpc_id
  private_subnet_ids  = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_id]
  rds_sg_id           = module.security_groups.rds_sg_id

  secret_name         = "guestbook-secret"
}
 module "secrets" {
   source       = "./secret-manager-resource"
   secret_name  = "guestbook-secret"

   db_username  = var.db_username
   db_password  = var.db_password
   db_name      = var.db_name
   db_host      = module.rds.db_host
   db_port      = module.rds.db_port
 }
