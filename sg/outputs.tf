output "alb_security_group_id" {
  value = module.alb_security_group.security_group_id
}

output "ecs_security_group_id" {
  value = module.ecs_security_group.security_group_id
}
