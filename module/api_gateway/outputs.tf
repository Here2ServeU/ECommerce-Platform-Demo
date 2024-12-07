output "api_id" {
  description = "The ID of the API Gateway"
  value       = aws_apigatewayv2_api.api.id
}

output "api_endpoint" {
  description = "The URL of the API Gateway"
  value       = aws_apigatewayv2_stage.stage.invoke_url
}

output "integration_id" {
  description = "The ID of the API Gateway Lambda integration"
  value       = aws_apigatewayv2_integration.lambda_integration.id
}
