resource "aws_s3_bucket" "logs_bucket" {
  bucket = "lambda-logs-${random_string.suffix.result}-${terraform.workspace}"
  acl    = "private"
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name = "/aws/lambda/${aws_lambda_function.hello_world.function_name}"
  retention_in_days = 14
}
