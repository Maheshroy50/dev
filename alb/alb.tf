module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.7.0"

  name               = var.aws_alb_name
  vpc_id             = var.vpc_id
  subnets            = var.public_subnet_ids
  security_groups    = var.security_group_ids
  load_balancer_type = "application"
  enable_deletion_protection = false

  listeners = {
    http = {
      port     = 80
      protocol = "HTTP"
      forward = {
        target_group_key = "blue"
      }
    }
    
   test = {
      port     = 81
      protocol = "HTTP"
      forward = {
        target_group_key = "green"
      }
    }
  
  }



  target_groups = {
    blue = {
      name = var.aws_lb_target_group_name
      port        = 80
      protocol    = "HTTP"
      target_type = "ip"
      vpc_id      = var.vpc_id
      create_attachment = false
    }

    green = {
      name = var.aws_lb_target_group_secound_name
      port        = 80
      protocol    = "HTTP"
      target_type = "ip"
      vpc_id      = var.vpc_id
      create_attachment = false
    }
  }

  tags = {
    Name = var.aws_alb_name
  }

}