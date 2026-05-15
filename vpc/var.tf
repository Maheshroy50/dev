variable "aws_vpc_name" {
    description = "The name of the VPC."
    type        = string
    default     = "Mahesh-VPC"
  
}

variable "aws_vpc_cidr" {
    description = "The CIDR block for the VPC."
    type        = string
    default     = "10.0.0.0/16"
  
}

variable "aws_vpc_enable_dns_hostnames" {
    description = "Whether to enable DNS hostnames in the VPC."
    type        = bool
    default     = true
  
}

variable "aws_vpc_enable_public_dns_support" {
    description = "Whether to enable public DNS support in the VPC."
    type        = bool
    default     = true
  
}

variable "aws_vpc_tags" {
    description = "A map of tags to assign to the VPC."
    type        = map(string)
    default     = {
        Name        = "Mahesh-VPC"
        Environment = "Development"
    }
  
}

variable "aws_availability_zones" {
    description = "A list of availability zones to use for the subnets."
    type        = list(string)
    default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  
}

variable "aws_public_subnet_cidrs" {
    description = "A list of CIDR blocks for the public subnets."
    type        = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  
}

variable "aws_private_subnet_cidrs" {
    description = "A list of CIDR blocks for the private subnets."
    type        = list(string)
    default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  
}

variable "aws_nat_gateway_enable" {
    description = "Whether to create NAT gateways for the private subnets."
    type        = bool
    default     = true
  
}


