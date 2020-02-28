variable "region" {
  default = "cn-hangzhou"
}

variable "profile" {
  default = "default"
}

provider "alicloud" {
  region  = var.region
  profile = var.profile
}


module "vpc-security-group" {
  source     = "../.."
  region     = var.region
  profile    = var.profile
  create_vpc = true
  vpc_name   = "my-env-vpc"
  vpc_cidr   = "10.10.0.0/16"

  availability_zones = ["cn-hangzhou-e", "cn-hangzhou-f", "cn-hangzhou-g"]
  vswitch_cidrs      = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]

  vpc_tags = {
    Owner       = "user"
    Environment = "staging"
    Name        = "complete"
  }

  vswitch_tags = {
    Project  = "Secret"
    Endpoint = "true"
  }

  # security group
  create_security_group = true
  name                  = "main-sg"
  description           = "Security group which is used as an argument in complete-sg"
  ingress_cidr_blocks   = ["10.10.0.0/16"]
  ingress_rules         = ["https-443-tcp"]
}

