variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "s3_bucket" {
  description = "S3 bucket for storing Terraform state"
  type        = string
  default     = "my-terraform-state-bucket"
}

variable "dynamodb_table" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
  default     = "terraform-lock"
}

/*
variable "lambda_configs" {
  description = "Configuration for Lambda function"
  type = map(object({
    memory_size = number
    timeout     = number
  }))
  default = {
    dev  = { memory_size = 128, timeout = 5 }
    prod = { memory_size = 512, timeout = 15 }
  }
}
*/

variable "github_org" {
  description = "GitHub organization for OIDC authentication"
  type        = string
  default     = "devops26012024"
}

variable "environment" {
  description = "Current Terraform workspace (dev/prod)"
  type        = string
  default     = "dev"
}
