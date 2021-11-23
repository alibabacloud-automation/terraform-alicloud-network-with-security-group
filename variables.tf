variable "region" {
  description = "(Deprecated from version 1.2.0) The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "(Deprecated from version 1.2.0) The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "(Deprecated from version 1.2.0) This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "(Deprecated from version 1.2.0) Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

#################
# VPC
#################
variable "create_vpc" {
  description = "Whether to create vpc. If false, you can specify an existing vpc by setting 'vpc_id'."
  type        = bool
  default     = true
}

variable "existing_vpc_id" {
  description = "The vpc id used to launch several vswitches."
  type        = string
  default     = ""
}

variable "use_existing_vpc" {
  description = "The vpc id used to launch several vswitches. If set, the 'create_vpc' will be ignored."
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "The vpc name used to launch a new vpc."
  type        = string
  default     = "TF-VPC"
}

variable "vpc_description" {
  description = "The vpc description used to launch a new vpc."
  type        = string
  default     = "A new VPC created by Terrafrom module terraform-alicloud-vpc"
}

variable "vpc_cidr" {
  description = "The cidr block used to launch a new vpc."
  type        = string
  default     = "172.16.0.0/12"
}

variable "vpc_tags" {
  description = "The tags used to launch a new vpc. Before 1.5.0, it used to retrieve existing VPC."
  type        = map(string)
  default     = {}
}

#################
# Vswitch
#################
variable "vswitch_cidrs" {
  description = "List of cidr blocks used to launch several new vswitches. If not set, there is no new vswitches will be created."
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  description = "List available zones to launch several VSwitches."
  type        = list(string)
  default     = []
}

variable "vswitch_name" {
  description = "The vswitch name prefix used to launch several new vswitches."
  default     = "TF-VSwitch"
}

variable "use_num_suffix" {
  description = "Always append numerical suffix(like 001, 002 and so on) to vswitch name, even if the length of 'vswitch_cidrs' is 1. Default to false."
  type        = bool
  default     = false
}

variable "vswitch_description" {
  description = "The vswitch description used to launch several new vswitch."
  type        = string
  default     = "New VSwitch created by Terrafrom module terraform-alicloud-vpc."
}

variable "vswitch_tags" {
  description = "The tags used to launch serveral vswitches."
  type        = map(string)
  default     = {}
}

#################
# security-group
#################
variable "create_security_group" {
  description = "Whether to create security group. If false, you can specify an existing vpc by setting 'existing_group_id'."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of security group. It is used to create a new security group. A random name prefixed with 'terraform-sg-' will be set if it is empty."
  type        = string
  default     = ""
}

variable "description" {
  description = "Description of security group."
  type        = string
  default     = "Security Group managed by Terraform"
}

variable "security_group_tags" {
  description = "A mapping of tags to assign to security group."
  type        = map(string)
  default     = {}
}

#################
# ingress_rules
#################
variable "ingress_rules" {
  description = "List of ingress rules to create by name."
  type        = list(string)
  default     = []
}

variable "priority_for_ingress_rules" {
  description = "A priority is used when setting 'ingress_rules'. Default to 'default_ingress_priority'."
  type        = number
  default     = 1
}

variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used. The valid keys contains 'cidr_blocks', 'from_port', 'to_port', 'protocol', 'description', 'priority' and 'rule'."
  type        = list(map(string))
  default     = []
}
variable "ingress_with_source_security_group_id" {
  description = "List of ingress rules to create where `source_security_group_id` is used."
  type        = list(map(string))
  default     = []
}

variable "ingress_with_cidr_blocks_and_ports" {
  description = "List of ingress rules to create where 'cidr_blocks' and 'ports' is used. The valid keys contains 'cidr_blocks', 'ports', 'protocol', 'description' and 'priority'. The ports item's 'from' and 'to' have the same port. Example: '80,443' means 80/80 and 443/443."
  type        = list(map(string))
  default     = []
}
variable "ingress_ports" {
  description = "The port list used on 'ingress_with_cidr_blocks_and_ports' ports rules."
  type        = list(number)
  default     = []
}

variable "ingress_cidr_blocks" {
  description = "The IPv4 CIDR ranges list to use on ingress cidrs rules."
  type        = list(string)
  default     = []
}

variable "default_ingress_priority" {
  description = "A default ingress priority."
  type        = number
  default     = 50
}

#################
# egress_rules
#################
variable "egress_rules" {
  description = "List of egress rules to create by name."
  type        = list(string)
  default     = []
}
variable "priority_for_egress_rules" {
  description = "A priority where 'egress_rules' is used. Default to 'default_egress_priority'."
  type        = number
  default     = 1
}

variable "egress_with_cidr_blocks" {
  description = "List of egress rules to create where 'cidr_blocks' is used. The valid keys contains 'cidr_blocks', 'from_port', 'to_port', 'protocol', 'description' and 'priority'."
  type        = list(map(string))
  default     = []
}

variable "egress_with_source_security_group_id" {
  description = "List of egress rules to create where 'source_security_group_id' is used."
  type        = list(map(string))
  default     = []
}

variable "egress_with_cidr_blocks_and_ports" {
  description = "List of egress rules to create where 'cidr_blocks' and 'ports' is used. The valid keys contains 'cidr_blocks', 'ports', 'protocol', 'description' and 'priority'. The ports item's 'from' and 'to' have the same port. Example: '80,443' means 80/80 and 443/443."
  type        = list(map(string))
  default     = []
}
variable "egress_ports" {
  description = "The port list used on 'egress_with_cidr_blocks_and_ports' ports rules."
  type        = list(number)
  default     = []
}

variable "egress_cidr_blocks" {
  description = "The IPv4 CIDR ranges list to use on egress cidrs rules."
  type        = list(string)
  default     = []
}

variable "default_egress_priority" {
  description = "A default egress priority."
  type        = number
  default     = 50
}
