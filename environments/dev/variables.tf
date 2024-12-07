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

variable "rds_allocated_storage" {
  description = "The size of the RDS instance storage in GB"
  default     = 20
}

variable "rds_engine" {
  description = "The database engine (e.g., mysql, postgres)"
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "The version of the database engine"
  default     = "8.0"
}

variable "rds_instance_class" {
  description = "The instance class for RDS"
  default     = "db.t3.micro"
}

variable "rds_db_name" {
  description = "The name of the database"
  default     = "t2s_services_dev"
}

variable "rds_username" {
  description = "The username for the database"
  default     = "admin"
}

variable "rds_password" {
  description = "The password for the database"
  default     = "securepassword123"
}

variable "rds_publicly_accessible" {
  description = "Whether the RDS instance should be publicly accessible"
  default     = false
}

variable "rds_subnet_group" {
  description = "The DB subnet group name"
  default     = "default"
}

variable "rds_security_group_ids" {
  description = "The security group IDs for RDS access"
  default     = []
}
