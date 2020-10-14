locals {
  instance_name = var.project_name
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.15.0"

  name           = local.instance_name
  instance_count = var.instance_count

  ami                    = "ami-ebd02392"
  instance_type          = var.instance_type
  key_name               = "user1"
  monitoring             = var.is_monitoring
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
