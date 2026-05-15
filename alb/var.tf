variable "aws_alb_name" {
  description = "The name of the Application Load Balancer."
  type        = string
  default     = "Blue-Green-ALB"

}

variable "aws_lb_target_group_name" {
  description = "The name of the load balancer target group."
  type        = string
  default     = "Blue-LB-Target-Group"

}

variable "vpc_id" {
  description = "The VPC ID for the ALB."
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB."
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the ALB."
  type        = list(string)
}

variable "aws_lb_target_group_secound_name" {
  description = "The name of the second load balancer target group."
  type        = string
  default     = "Green-LB-Target-Group"

}