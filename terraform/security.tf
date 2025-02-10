resource "aws_s3_bucket" "logs_bucket-p1p2" {
  bucket = "lambda-logs-${terraform.workspace}"
  acl    = "private"
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name = "/aws/lambda/${aws_lambda_function.hello_world.function_name}"
  retention_in_days = 14
}
