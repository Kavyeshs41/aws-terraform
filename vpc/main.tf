locals {
  vpc_name = var.project_name
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.57.0"

  name = local.vpc_name
  cidr = var.cidr

  azs = [
    data.aws_availability_zones.available.names[0]
  ]

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

  public_subnet_tags = {
    Name = format("%s-public", local.vpc_name)
  }

  private_subnet_tags = {
    Name = format("%s-private", local.vpc_name)
  }

  tags = {
    Name        = var.project_name
    Terraform   = "true"
    Environment = var.env
  }

}

resource "aws_security_group" "security_group" {
  name        = var.project_name
  description = format("%s - Openxcell Open ports", var.project_name)
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.project_name
    Environment = var.env
  }
}

resource "aws_security_group_rule" "example" {
  count = length(split(",", var.security_ports))

  type        = "ingress"
  from_port   = "${element(split(",", var.security_ports), count.index)}"
  to_port     = "${element(split(",", var.security_ports), count.index)}"
  protocol    = "tcp"
  cidr_blocks = var.default_ox_ip_ranges
  description = format("Open for OX", )

  security_group_id = "${aws_security_group.security_group.id}"
}
