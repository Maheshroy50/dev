output "dns_name" {
  value = module.alb.dns_name
}

output "target_groups" {
  value = module.alb.target_groups
}

output "green_dns_name" {
  value = module.alb.listeners["test"].dns_name
}

output "listeners" {
  value = module.alb.listeners
}