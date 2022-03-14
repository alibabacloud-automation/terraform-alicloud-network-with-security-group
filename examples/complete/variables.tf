#################
# VPC
#################
variable "vpc_name" {
  description = "The vpc name used to launch a new vpc."
  type        = string
  default     = "tf-testacc-vpc"
}

variable "vpc_description" {
  description = "The vpc description used to launch a new vpc."
  type        = string
  default     = "tf-testacc-vpc-description"
}

variable "vpc_tags" {
  description = "The tags used to launch a new vpc. Before 1.5.0, it used to retrieve existing VPC."
  type        = map(string)
  default = {
    Name = "VPC"
  }
}

#################
# Vswitch
#################
variable "vswitch_name" {
  description = "The vswitch name prefix used to launch several new vswitches."
  type        = string
  default     = "tf-testacc-vswitch"
}

variable "vswitch_description" {
  description = "The vswitch description used to launch several new vswitch."
  type        = string
  default     = "tf-testacc-vswitch-description"
}

variable "vswitch_tags" {
  description = "The tags used to launch serveral vswitches."
  type        = map(string)
  default = {
    Name = "VSWITCH"
  }
}

#################
# security-group
#################
variable "name" {
  description = "Name of security group. It is used to create a new security group. A random name prefixed with 'terraform-sg-' will be set if it is empty."
  type        = string
  default     = "tf-testacc-sg"
}

variable "security_group_tags" {
  description = "A mapping of tags to assign to security group."
  type        = map(string)
  default = {
    Name = "SG"
  }
}

#################
# ingress_rules
#################
variable "rule_description" {
  description = "The description of the security group rule."
  type        = string
  default     = "tf-testacc-rulw-description"
}