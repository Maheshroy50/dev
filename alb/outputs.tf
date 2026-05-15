output "dns_name" {
  value = module.alb.dns_name
}

output "target_groups" {
  value = module.alb.target_groups
}

output "listeners" {
  value = module.alb.listeners
}

output "http_listener_arn" {
  value = module.alb.listeners["http"].arn
  description = "ARN of the HTTP listener"
}

output "test_listener_arn" {
  value = module.alb.listeners["test"].arn
  description = "ARN of the test traffic listener"
}
