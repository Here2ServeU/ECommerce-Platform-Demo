variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "dynamodb_billing_mode" {
  description = "Billing mode for DynamoDB (PROVISIONED or PAY_PER_REQUEST)"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "dynamodb_hash_key" {
  description = "Primary key hash attribute name"
  type        = string
}

variable "dynamodb_hash_key_type" {
  description = "Primary key hash attribute type (S or N)"
  type        = string
}

variable "dynamodb_range_key" {
  description = "Primary key range attribute name (optional)"
  type        = string
  default     = null
}

variable "dynamodb_range_key_type" {
  description = "Primary key range attribute type (S or N), required if range_key is set"
  type        = string
  default     = null
}

variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "api_gateway_stage_name" {
  description = "Name of the deployment stage"
  type        = string
  default     = "dev"
}

variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
