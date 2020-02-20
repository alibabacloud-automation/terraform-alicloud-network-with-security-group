#################
# VPC
#################
output "this_vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.this_vpc_id
}

output "this_vpc_name" {
  description = "The VPC name"
  value       = module.vpc.this_vpc_name
}

output "this_vpc_tags" {
  description = "The tags of the VPC."
  value       = module.vpc.this_vpc_tags
}

output "this_vpc_cidr_block" {
  description = "The VPC cidr block."
  value       = module.vpc.this_vpc_cidr_block
}

#################
# Subnets
#################
output "this_vswitch_ids" {
  description = "List of IDs of vswitch."
  value       = module.vpc.this_vswitch_ids
}

output "this_availability_zones" {
  description = "List of availability zones in which vswitches launched."
  value       = module.vpc.this_availability_zones
}

output "this_vswitch_names" {
  description = "List names of vswitch."
  value       = module.vpc.this_vswitch_names
}

output "this_vswitch_tags" {
  description = "List tags of vswitch."
  value       = module.vpc.this_vswitch_tags
}

output "this_vswitch_cidr_blocks" {
  description = "List cidr blocks of vswitch."
  value       = module.vpc.this_vswitch_cidr_blocks
}

#################
# Security group
#################
output "this_security_group_id" {
  description = "The ID of the security group."
  value       = module.security_group.this_security_group_id
}

output "this_security_group_vpc_id" {
  description = "The VPC ID."
  value       = module.security_group.this_security_group_vpc_id
}

output "this_security_group_name" {
  description = "The name of the security group."
  value       = module.security_group.this_security_group_name
}

output "this_security_group_description" {
  description = "The description of the security group."
  value       = module.security_group.this_security_group_description
}
