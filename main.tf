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

# Instantiate other modules similarly
