variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default     = "eu-west-3"
  description = "AWS Default Region"
}

variable "bucket_name" {
  type        = string
  description = "Name of S3 Bucket"
}

variable "website" {
  type        = map(string)
  description = "S3 Hosting Configuration"
  default = {
    index_document = "index.html"
    error_document = "error.html"
  }
}

variable "is_website" {
  type        = bool
  description = "Configure Bucket for Hosting"
  default     = false
}

variable "acl" {
  type        = string
  description = "Bucket Access Control List"
  default     = "private"
}

variable "env" {
  type        = string
  description = "Deployment Environment Variable"
  default     = "dev"
}

variable "attach_policy" {
  type        = bool
  description = "Attach Policy with Bucket"
  default     = false
}

variable "versioning" {
  type        = string
  description = "Versioning Configuration"
  default     = false
}
