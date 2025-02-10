resource "aws_cognito_user_pool" "user_pool" {
  name = "user-pool-${terraform.workspace}"
}

resource "aws_cognito_user_pool_client" "app_client" {
  name         = "app-client-${terraform.workspace}"
  user_pool_id = aws_cognito_user_pool.user_pool.id
  generate_secret = true
}
