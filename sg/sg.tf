module "alb_security_group" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.0.0"

    name        = var.aws_sg_name
    description = "Security group for ALB"
    vpc_id      = var.vpc_id

    ingress_with_cidr_blocks = [
        {
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = "0.0.0.0/0"
        }
    ]

    egress_with_cidr_blocks = [
        {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = "0.0.0.0/0"
        }
    ]
}

module "ecs_security_group" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.0.0"

    name        = var.aws_ecs_sg
    description = "Security group for ECS tasks"
    vpc_id      = var.vpc_id

    ingress_with_source_security_group_id = [
        {
            from_port                = 80
            to_port                  = 80
            protocol                 = "tcp"
            source_security_group_id = module.alb_security_group.security_group_id
        }
    ]

    egress_with_cidr_blocks = [
        {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = "0.0.0.0/0"
        }
    ]
}