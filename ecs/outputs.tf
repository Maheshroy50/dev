output "cluster_name" {
  value = module.ecs.cluster_name
}

output "cluster_id" {
  value = module.ecs.cluster_id
}

output "services" {
  value = module.ecs.services
}
output "service_name" {
  value = module.ecs.services["web"].name
  description = "Name of the ECS web service"
}