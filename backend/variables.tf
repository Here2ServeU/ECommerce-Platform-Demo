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
