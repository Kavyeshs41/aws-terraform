output "vpc_id" {
  value = module.vpc.vpc_id
}

output "sg_id" {
  value = aws_security_group.security_group.id
}
