variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"

}

variable "green_lb_target_group_name" {
  description = "The name of the green load balancer target group."
  type        = string
}