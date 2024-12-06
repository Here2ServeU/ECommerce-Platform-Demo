variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment (dev, stage, prod)"
  default     = "dev"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  default     = "ecommerce-platform-bucket"
}

# Add additional variables as needed
