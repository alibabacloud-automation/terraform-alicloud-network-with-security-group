data "alicloud_zones" "default" {
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

resource "alicloud_security_group" "default_1" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_security_group" "default_2" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

module "vpc_security_group" {
  source = "../.."

  # VPC
  create_vpc       = true
  use_existing_vpc = false

  vpc_name        = var.vpc_name
  vpc_cidr        = "172.16.0.0/16"
  vpc_description = var.vpc_description
  vpc_tags        = var.vpc_tags

  # Vswitch
  vswitch_cidrs       = ["172.16.0.0/21"]
  availability_zones  = data.alicloud_zones.default.ids
  vswitch_name        = var.vswitch_name
  use_num_suffix      = false
  vswitch_description = var.vswitch_description
  vswitch_tags        = var.vswitch_tags

  # security group
  create_security_group = true

  name                = var.name
  description         = "tf-testacc-sg-description"
  security_group_tags = var.security_group_tags

  # alicloud_security_group_rule
  ingress_rules              = ["https-443-tcp"]
  ingress_cidr_blocks        = ["10.10.0.0/16"]
  priority_for_ingress_rules = 1
  default_ingress_priority   = 50

  ingress_with_cidr_blocks = [
    {
      cidr_blocks = "10.10.0.0/20"
      priority    = 1
      rule        = "dns-udp"
    },
    {
      priority    = 2
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
      description = var.rule_description
    }
  ]
  ingress_ports = [50]
  ingress_with_cidr_blocks_and_ports = [
    {
      cidr_blocks = "10.11.0.0/20"
      priority    = 1
      ports       = "10"
      protocol    = "tcp"
    },
    {
      cidr_blocks = "172.10.0.0/20"
      protocol    = "udp"
      description = var.rule_description
    }
  ]
  ingress_with_source_security_group_id = [
    {
      source_security_group_id = alicloud_security_group.default_1.id
      priority                 = 1
      rule                     = "mysql-tcp"
    },
    {
      source_security_group_id = alicloud_security_group.default_2.id
      priority                 = 2
      from_port                = 10
      to_port                  = 10
      protocol                 = "tcp"
      description              = var.rule_description
    },
  ]

  egress_rules              = ["http-80-tcp"]
  egress_cidr_blocks        = ["10.10.0.0/16"]
  priority_for_egress_rules = 1
  default_egress_priority   = 50
  egress_with_cidr_blocks = [
    {
      cidr_blocks = "10.10.0.0/20"
      priority    = 1
      rule        = "ipsec-500-udp"
    },
    {
      priority    = 2
      from_port   = 10
      to_port     = 20
      protocol    = "udp"
      description = var.rule_description
    }
  ]
  egress_ports = [90]
  egress_with_cidr_blocks_and_ports = [
    {
      cidr_blocks = "10.10.0.0/20"
      priority    = 1
      ports       = "50"
      protocol    = "tcp"
    },
    {
      cidr_blocks = "172.10.0.0/20"
      protocol    = "udp"
      description = var.rule_description
    }
  ]
  egress_with_source_security_group_id = [
    {
      source_security_group_id = alicloud_security_group.default_1.id
      priority                 = 1
      rule                     = "mysql-tcp"
    },
    {
      source_security_group_id = alicloud_security_group.default_2.id
      priority                 = 2
      from_port                = 10
      to_port                  = 10
      protocol                 = "tcp"
      description              = var.rule_description
    }
  ]

}
