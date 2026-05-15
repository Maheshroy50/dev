variable "aws_sg_name" {
  description = "The name of the security group."
  type        = string
  default     = "Mahesh-SG"

}


variable "aws_ecs_sg" {
  description = "The security group for ECS tasks."
  type        = string
  default     = "krishna-ECS-SG"

}

variable "vpc_id" {
  description = "The VPC ID where security groups will be created."
  type        = string

}