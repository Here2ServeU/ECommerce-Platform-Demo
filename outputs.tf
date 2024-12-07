output "s3_bucket_id" {
  description = "ID of the S3 bucket"
  value       = module.s3.bucket_id
}

output "dynamodb_table_id" {
  description = "ID of the DynamoDB table"
  value       = module.dynamodb.table_id
}

output "api_gateway_endpoint" {
  description = "Endpoint URL of the API Gateway"
  value       = module.api_gateway.api_endpoint
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = module.sns.topic_arn
}
