provider "aws" {
  region = var.aws_region
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
  environment = var.environment
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

# Instantiate other modules similarly
