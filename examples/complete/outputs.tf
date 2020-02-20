#################
# VPC
#################
output "this_vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc-security-group.this_vpc_id
}

output "this_vpc_tags" {
  description = "The tags of the VPC."
  value       = module.vpc-security-group.this_vpc_tags
}

output "this_vpc_cidr_block" {
  description = "The VPC cidr block."
  value       = module.vpc-security-group.this_vpc_cidr_block
}

output "this_vpc_name" {
  description = "The name of vpc."
  value       = module.vpc-security-group.this_vpc_name
}

#################
# Subnets
#################
output "this_vswitch_ids" {
  description = "List of IDs of vswitch."
  value       = module.vpc-security-group.this_vswitch_ids
}
output "this_vswitch_tags" {
  description = "List of IDs of vswitch."
  value       = module.vpc-security-group.this_vswitch_tags
}

output "this_availability_zones" {
  description = "List of availability zones in which vswitches launched."
  value       = module.vpc-security-group.this_availability_zones
}

output "this_vswitch_name" {
  description = "List names of vswitch."
  value       = module.vpc-security-group.this_vswitch_names
}

output "this_vswitch_cidr_block" {
  description = "List cidr blocks of vswitch."
  value       = module.vpc-security-group.this_vswitch_cidr_blocks
}

#################
# Security group
#################
output "this_security_group_id" {
  description = "The ID of the security group."
  value       = module.vpc-security-group.this_security_group_id
}

output "this_security_group_vpc_id" {
  description = "The VPC ID."
  value       = module.vpc-security-group.this_security_group_vpc_id
}

output "this_security_group_name" {
  description = "The name of the security group."
  value       = module.vpc-security-group.this_security_group_name
}

output "this_security_group_description" {
  description = "The description of the security group."
  value       = module.vpc-security-group.this_security_group_description
}