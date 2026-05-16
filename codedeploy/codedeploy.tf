resource "aws_codedeploy_app" "this" {
  compute_platform = "ECS"
  name             = "Blue-Green-Deployment"
}

data "aws_iam_role" "codedeploy" {
  name = "ECSCodeDeploy"
}


resource "aws_codedeploy_deployment_group" "this" {
  app_name               = aws_codedeploy_app.this.name
  deployment_group_name  = "Blue-Green-Deployment"
  service_role_arn       = var.codedeploy_service_role_arn
  deployment_config_name = "CodeDeployDefault.ECSCanary10Percent5Minutes"

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout    = "STOP_DEPLOYMENT"
      wait_time_in_minutes = 10
    }

    terminate_blue_instances_on_deployment_success {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = 15
    }
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  ecs_service {
    cluster_name = var.ecs_cluster_name
    service_name = var.ecs_service_name
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = var.lb_listener_arns
      }

      target_group {
        name = var.blue_lb_target_group_name
      }

      target_group {
        name = var.green_lb_target_group_name
      }

      test_traffic_route {
        listener_arns = var.test_traffic_route_listener_arns
      }
    }
  }
}