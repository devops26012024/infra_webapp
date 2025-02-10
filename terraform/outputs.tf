output "api_gateway_url" {
  value = aws_apigatewayv2_api.http_api.api_endpoint
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.app_client.id
}
