locals {
  endpoint_config              = var.endpoints_on_edge ? ["EDGE"] : ["REGIONAL"]
  has_default_policy_overwrite = var.default_policy != ""
}

resource "aws_api_gateway_rest_api" "api" {
  name                         = var.name
  description                  = var.description
  disable_execute_api_endpoint = var.no_execute_api_access
  endpoint_configuration {
    types = local.endpoint_config
  }
}

data "aws_iam_policy_document" "default_resource_policy" {
  count = local.has_default_policy_overwrite ? 0 : 1
  statement {
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["execute-api:Invoke"]
    resources = ["${aws_api_gateway_rest_api.api.execution_arn}/*/*/*"]
  }
}

resource "aws_api_gateway_rest_api_policy" "api" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  policy      = local.has_default_policy_overwrite ? var.default_policy : data.aws_iam_policy_document.default_resource_policy[0].json
}
