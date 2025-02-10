terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

resource "null_resource" "set_workspace" {
  provisioner "local-exec" {
    command = <<EOT
      if [ "$GITHUB_REF_NAME" = "main" ]; then
        terraform workspace select prod || terraform workspace new prod
      else
        terraform workspace select dev || terraform workspace new dev
      fi
    EOT
  }
}
