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
