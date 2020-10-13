locals {
  website = var.is_website == false ? {} : var.website

  tag = {
    Name        = var.bucket_name
    Environment = var.env
  }

  versioning = {
    enabled = var.versioning
  }

  policy = var.attach_policy == false ? null : data.aws_iam_policy_document.bucket_policy.json
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "Stmt1539680321919"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    effect = "Allow"

    actions = [
      "s3:*"
    ]

    resources = [
      format("arn:aws:s3:::%s", var.bucket_name)
    ]
  }
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "1.15.0"

  bucket        = var.bucket_name
  create_bucket = true
  tags          = local.tag

  acl        = var.acl
  versioning = local.versioning
  website    = local.website

  attach_policy = var.attach_policy
  policy        = data.aws_iam_policy_document.bucket_policy.json
}
