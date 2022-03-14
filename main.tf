locals {
  create_vpc = var.use_existing_vpc ? false : var.create_vpc
}

module "vpc" {
  source = "alibaba/vpc/alicloud"

  create          = local.create_vpc
  vpc_id          = var.existing_vpc_id
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  vpc_description = var.vpc_description
  vpc_tags        = var.vpc_tags

  vswitch_cidrs       = var.vswitch_cidrs
  availability_zones  = var.availability_zones
  vswitch_name        = var.vswitch_name
  use_num_suffix      = var.use_num_suffix
  vswitch_description = var.vswitch_description
  vswitch_tags        = var.vswitch_tags

}

module "security_group" {
  source = "alibaba/security-group/alicloud"

  # alicloud_security_group
  create      = var.create_security_group
  name        = var.name
  vpc_id      = module.vpc.vpc_id
  description = var.description
  tags        = var.security_group_tags

  # alicloud_security_group_rule
  ingress_rules              = var.ingress_rules
  ingress_cidr_blocks        = var.ingress_cidr_blocks
  priority_for_ingress_rules = var.priority_for_ingress_rules
  default_ingress_priority   = var.default_ingress_priority

  # (Available In v2.1.0+)Ingress - Maps of rules and each item with cidr_blocks or ingress_cidr_blocks
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks

  # Ingress - Using a list of ports
  ingress_ports                      = var.ingress_ports
  ingress_with_cidr_blocks_and_ports = var.ingress_with_cidr_blocks_and_ports

  # Ingress - Maps of rules and each item with source_security_group_id
  ingress_with_source_security_group_id = var.ingress_with_source_security_group_id

  # Egress - List of rules (simple)
  egress_rules              = var.egress_rules
  egress_cidr_blocks        = var.egress_cidr_blocks
  priority_for_egress_rules = var.priority_for_egress_rules
  default_egress_priority   = var.default_egress_priority

  # (Available In v2.1.0+) Egress - Maps of rules and each item with cidr_blocks or egress_cidr_blocks
  egress_with_cidr_blocks = var.egress_with_cidr_blocks

  # Egress - Using a list of ports
  egress_with_cidr_blocks_and_ports = var.egress_with_cidr_blocks_and_ports
  egress_ports                      = var.egress_ports

  # Egress - Maps of rules and each item with source_security_group_id
  egress_with_source_security_group_id = var.egress_with_source_security_group_id

}