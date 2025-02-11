variable "lambda_configs" { 
  type = map(object({
    memory_size = number
    timeout     = number  
  }))
  default = {
    prod = { memory_size = 512, timeout = 15 }
  }
}

resource "aws_lambda_function" "hello_world" { 
  function_name = "hello-world-${terraform.workspace}"
  role            = aws_iam_role.github_actions_role.arn
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  filename      = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")

  memory_size = lookup(var.lambda_configs, terraform.workspace, var.lambda_configs["prod"]).memory_size
  timeout     = lookup(var.lambda_configs, terraform.workspace, var.lambda_configs["prod"]).timeout
}


