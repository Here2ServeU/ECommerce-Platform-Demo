variable "aws_region" {
  description = "AWS region for deployment"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket for the frontend"
  default     = "t2s-services-dev"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for storing form submissions"
  default     = "t2s-services-form-submissions-dev"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function for processing form submissions"
  default     = "t2s-services-lambda-dev"
}

variable "api_name" {
  description = "The name of the API Gateway"
  default     = "t2s-services-api-dev"
}

variable "stage_name" {
  description = "The stage name for the API Gateway"
  default     = "dev"
}
