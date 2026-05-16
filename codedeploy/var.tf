variable "ecs_cluster_name" {
  description = "The name of the ECS cluster."
  type        = string
}

variable "ecs_service_name" {
  description = "The name of the ECS service."
  type        = string
}

variable "lb_listener_arns" {
  description = "List of load balancer listener ARNs."
  type        = list(string)
}

variable "test_traffic_route_listener_arns" {
  description = "List of listener ARNs used for test traffic routing."
  type        = list(string)
  default     = []
}

variable "blue_lb_target_group_name" {
  description = "The name of the blue load balancer target group."
  type        = string
}

variable "green_lb_target_group_name" {
  description = "The name of the green load balancer target group."
  type        = string
}



