#################
# VPC
#################
vpc_name        = "tupdate-f-testacc-vpc"
vpc_description = "update-tf-testacc-vpc-description"
vpc_tags = {
  Name = "updateVPC"
}

#################
# Vswitch
#################
vswitch_name        = "update-tf-testacc-vswitch"
vswitch_description = "update-tf-testacc-vswitch-description"
vswitch_tags = {
  Name = "updateVSWITCH"
}

#################
# security-group
#################
name = "update-tf-testacc-sg"
security_group_tags = {
  Name = "updateSG"
}

#################
# ingress_rules
#################
rule_descriptio = "update-tf-testacc-rulw-description"