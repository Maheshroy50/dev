resource "aws_codedeploy_deployment_config" "canary10" {
  compute_platform = "ECS"
  deployment_config_name = "CodeDeployDefault.ECSCanary10Percent5Minutes"
  
  traffic_routing_config {
    type = "TimeBasedCanary"
    time_based_canary {
       interval =   10
       percentage =  10
    }
  }
}

module "codedeploy" {
  source                     = "git::https://github.com/faros-ai/terraform-aws-codedeploy-for-ecs.git?ref=tags/1.3.1"

  name                       = "Blue-Green-Deployment"
  ecs_cluster_name           = var.ecs_cluster_name
  ecs_service_name           = var.ecs_service_name
  lb_listener_arns           = var.lb_listener_arns
  blue_lb_target_group_name  = var.blue_lb_target_group_name
  green_lb_target_group_name = var.green_lb_target_group_name
  
  auto_rollback_enabled            = true
  auto_rollback_events             = ["DEPLOYMENT_FAILURE"]
  action_on_timeout                = "CONTINUE_DEPLOYMENT"
  wait_time_in_minutes             = 20
  termination_wait_time_in_minutes = 20
  
  test_traffic_route_listener_arns = var.test_traffic_route_listener_arns
  description                      = "CodeDeploy deployment group for ECS blue-green deployment"

  tags = {
    Environment = "prod"
  }
}
 

