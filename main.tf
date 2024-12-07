provider "aws" {
  region = var.aws_region
}

# S3 Module
module "s3" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
  tags        = var.tags
}

# DynamoDB Module
module "dynamodb" {
  source          = "./modules/dynamodb"
  table_name      = var.dynamodb_table_name
  billing_mode    = var.dynamodb_billing_mode
  hash_key        = var.dynamodb_hash_key
  hash_key_type   = var.dynamodb_hash_key_type
  range_key       = var.dynamodb_range_key
  range_key_type  = var.dynamodb_range_key_type
  tags            = var.tags
}

# API Gateway Module
module "api_gateway" {
  source      = "./modules/api_gateway"
  api_name    = var.api_gateway_name
  stage_name  = var.api_gateway_stage_name
  tags        = var.tags
}

# SNS Module
module "sns" {
  source     = "./modules/sns"
  topic_name = var.sns_topic_name
  tags       = var.tags
}

module "lambda" {
  source               = "./modules/lambda"
  function_name        = "order-processor"
  handler              = "index.handler"
  runtime              = "nodejs14.x"
  filename             = "path/to/lambda.zip"
  environment_variables = {
    BUCKET_NAME = module.s3.bucket_name
  }
}

module "step_functions" {
  source          = "./modules/step_functions"
  name            = "order-processing"
  definition_file = "${path.module}/order_processing_definition.json"
  resource_arns   = [
    "arn:aws:lambda:region:account-id:function:validate_order",
    "arn:aws:lambda:region:account-id:function:process_payment",
    "arn:aws:lambda:region:account-id:function:send_confirmation",
  ]
  tags = {
    Environment = var.environment
  }
}


