provider "aws" {
  region = var.aws_region
}

# S3 Module for hosting the frontend
module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.bucket_name
}

# CloudFront Module for CDN
module "cloudfront" {
  source          = "../../modules/cloudfront"
  bucket_name     = module.s3.bucket_name
  s3_bucket_domain = module.s3.bucket_name
}

# DynamoDB Module for storing form submissions
module "dynamodb" {
  source      = "../../modules/dynamodb"
  table_name  = var.dynamodb_table_name
}

# Lambda Module for processing form submissions
module "lambda" {
  source             = "../../modules/lambda"
  function_name      = var.lambda_function_name
}

# API Gateway Module to link Lambda with the frontend
module "api_gateway" {
  source                = "../../modules/api_gateway"
  api_name              = var.api_name
  lambda_function_arn   = module.lambda.function_arn
  stage_name            = var.stage_name
}

# Existing modules (s3, cloudfront, dynamodb, lambda, api_gateway) go here

# RDS Module for structured backend storage
module "rds" {
  source               = "../../modules/rds"
  allocated_storage    = var.rds_allocated_storage
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instance_class
  db_name              = var.rds_db_name
  username             = var.rds_username
  password             = var.rds_password
  publicly_accessible  = var.rds_publicly_accessible
  subnet_group         = var.rds_subnet_group
  security_group_ids   = var.rds_security_group_ids
}
