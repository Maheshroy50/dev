module "vpc" {
  source = "./vpc"
}

module "sg" {
  source = "./sg"

  vpc_id = module.vpc.vpc_id

  depends_on = [module.vpc]
}

module "alb" {
  source = "./alb"

  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  security_group_ids = [module.sg.alb_security_group_id]

  depends_on = [module.vpc, module.sg]
}

module "ecs" {
  source = "./ecs"

  private_subnet_ids    = module.vpc.private_subnet_ids
  ecs_security_group_id = module.sg.ecs_security_group_id
  alb_target_group_arn  = module.alb.target_groups["blue"].arn

  depends_on = [module.vpc, module.alb, module.sg]
}

module "codedeploy" {
  source = "./codedeploy"

  ecs_cluster_name                 = module.ecs.cluster_name
  ecs_service_name                 = module.ecs.services["web"].id
  lb_listener_arns                 = [module.alb.http_listener_arn]
  test_traffic_route_listener_arns = [module.alb.test_listener_arn]
  blue_lb_target_group_name        = module.alb.target_groups["blue"].name
  green_lb_target_group_name       = module.alb.target_groups["green"].name

  depends_on = [module.ecs, module.alb]
}