terraform {
  required_version = ">= 1.5.0"
}

module "cloudtrail_baseline" {
  source = "../../modules/aws-cloudtrail-baseline"
  name   = "org-cloudtrail"
}

module "iam_password_policy" {
  source                  = "../../modules/aws-iam-password-policy"
  minimum_password_length = 14
}

module "networking_baseline" {
  source        = "../../modules/aws-networking-baseline"
  allowed_cidrs = ["10.0.0.0/8"]
}
