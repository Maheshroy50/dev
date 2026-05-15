module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "7.5.0"

  cluster_name = var.aws_ecs_cluster_name

  # Using module defaults for capacity providers

  tags = {
    Name = var.aws_ecs_cluster_name
  }

  services = {
    web = {
      name             = var.aws_ecs_service_name
      desired_count    = 1
      platform_version = "LATEST"
      deployment_controller = {
        type = "CODE_DEPLOY"
      }

      create_task_definition = false
      container_definitions  = {}

      subnet_ids        = var.private_subnet_ids
      security_group_ids = [var.ecs_security_group_id]

      load_balancer = {
        ecs = {
          target_group_arn = var.alb_target_group_arn
          container_name   = "Krishna"
          container_port   = 80
        }
      }

      task_definition_arn = var.existing_task_definition_arn
    }
  }
}
 
