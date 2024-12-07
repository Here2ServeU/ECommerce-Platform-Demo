variable "api_name" {
  description = "The name of the API Gateway"
  type        = string
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function to integrate with API Gateway"
  type        = string
}

variable "stage_name" {
  description = "The stage name for the API Gateway (e.g., dev, stage, prod)"
  type        = string
}
