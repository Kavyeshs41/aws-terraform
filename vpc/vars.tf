variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default     = "eu-west-3"
  description = "AWS Default Region"
}

variable "project_name" {
  type        = string
  description = "Name of the Project"
}

variable "env" {
  type        = string
  description = "Deployment Environment Variable"
  default     = "dev"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "NAT Gateway Configuration"
  default     = false
}

variable "enable_vpn_gateway" {
  type        = string
  description = "Vpn Gateway Configuration"
  default     = false
}

variable "cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  type        = list
  description = "Private Subnets CIDR"

  default = [
    "10.0.1.0/24"
  ]

}

variable "public_subnets" {
  type        = list
  description = "Public Subnets CIDR"

  default = [
    "10.0.101.0/24"
  ]

}

variable "default_ox_ip_ranges" {
  type        = list
  description = "Openxcell IP ranges"

  default = [
    "180.211.110.146/32",
    "180.211.110.147/32",
    "180.211.110.148/32",
    "180.211.110.149/32",
    "180.211.110.150/32",
    "203.88.135.122/32",
    "203.88.135.90/32",
    "203.88.135.91/32",
    "203.88.135.92/32",
    "203.88.135.93/32",
    "203.88.135.94/32",
    "27.121.103.6/32"
  ]

}

variable "security_ports" {
  type        = string
  description = "Open Ports for Server"
  default     = "22,443,80,7676"
}
