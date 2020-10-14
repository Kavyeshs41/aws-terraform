variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default     = "eu-west-3"
  description = "AWS Default Region"
}

variable "is_monitoring" {
  type        = bool
  description = "Enable/Disable Monitoring"
  default     = false
}

variable "instance_type" {
  type        = bool
  description = "Instance Type"
  default     = "t2.micro"
}
