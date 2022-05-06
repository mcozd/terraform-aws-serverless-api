output "api" {
  value       = aws_api_gateway_rest_api.api
  description = "The created api resource."
}

output "resource-policy" {
  value       = aws_api_gateway_rest_api_policy.api
  description = "The resource policy of the created api."
}
