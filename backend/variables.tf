variable "aws_region" {
  description = "Name of the Region where we want to deploy"
  type = string
  default = "us-east-1" 

variable "backend_name" {
  description = "Name of the S3 Bucket to store the State File"
  type = string
  default        = "ecommerce-statefile"
}

variable "Environment" {
  description = "Name of the S3 Bucket to store the State File"
  type = string 
  default        = "dev"
}
