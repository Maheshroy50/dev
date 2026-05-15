variable "aws_ecs_cluster_name" {
  description = "The name of the ECS cluster."
  type        = string
  default     = "Krishna-ECS-Cluster"
}

variable "aws_ecs_service_name" {
  description = "The name of the ECS service."
  type        = string
  default     = "Krishna-ECS-Service"
}

variable "existing_task_definition_arn" {
  description = "The ARN of an existing ECS task definition to use."
  type        = string
  default     = "arn:aws:ecs:us-east-1:796472104595:task-definition/Radhe:1"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for ECS tasks."
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security group ID for ECS tasks."
  type        = string
}

variable "alb_target_group_arn" {
  description = "ARN of the ALB target group for ECS."
  type        = string
}




