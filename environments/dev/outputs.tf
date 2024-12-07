output "s3_bucket_name" {
  description = "The name of the S3 bucket hosting the frontend"
  value       = module.s3.bucket_name
}

output "cloudfront_url" {
  description = "The CloudFront distribution URL for the website"
  value       = module.cloudfront.cloudfront_distribution_domain_name
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  value       = module.dynamodb.table_name
}

output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = module.lambda.function_name
}

output "api_gateway_url" {
  description = "The URL of the API Gateway"
  value       = module.api_gateway.api_endpoint
}
