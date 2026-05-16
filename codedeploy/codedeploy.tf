module "codedeploy" {
  source = "git::https://github.com/faros-ai/terraform-aws-codedeploy-for-ecs.git?ref=tags/1.3.1"

  name                       = "Blue-Green-Deployment"
  ecs_cluster_name           = var.ecs_cluster_name
  ecs_service_name           = var.ecs_service_name
  lb_listener_arns           = var.lb_listener_arns
  blue_lb_target_group_name  = var.blue_lb_target_group_name
  green_lb_target_group_name = var.green_lb_target_group_name

  test_traffic_route_listener_arns = var.test_traffic_route_listener_arns
   auto_rollback_enabled            = true
  auto_rollback_events             = ["DEPLOYMENT_FAILURE"]
  action_on_timeout                = "STOP_DEPLOYMENT"
  wait_time_in_minutes             = 10
  termination_wait_time_in_minutes = 15
  description                      = "CodeDeploy configuration for blue-green deployment of ECS service"


  tags = {
    Environment = "prod"

}
}