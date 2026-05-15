module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.1"

  name = var.aws_vpc_name
  cidr = var.aws_vpc_cidr

  azs             = var.aws_availability_zones
  public_subnets  = var.aws_public_subnet_cidrs
  private_subnets = var.aws_private_subnet_cidrs

  enable_dns_hostnames = var.aws_vpc_enable_dns_hostnames
  enable_dns_support   = var.aws_vpc_enable_public_dns_support

  enable_nat_gateway = var.aws_nat_gateway_enable
  single_nat_gateway = true

  tags = var.aws_vpc_tags
}