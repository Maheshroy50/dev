variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"

}

variable "codedeploy_service_role_arn" {
  description = "ARN of an existing IAM role for CodeDeploy deployment group."
  type        = string
}