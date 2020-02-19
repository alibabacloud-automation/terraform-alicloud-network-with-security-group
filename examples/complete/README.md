# Complete network-with-security-group example

Configuration in this directory Create both VPC and Security group.


# Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Outputs
| Name | Description |
|------|-------------|
| this_vpc_id | The ID of the VPC |
| this_vpc_tags | The tags of the VPC |
| this_vswitch_ids | List of IDs of vswitch |
| this_vswitch_tags | List of IDs of vswitch |
| this_security_group_id | The ID of the security group |
| this_security_group_vpc_id |The VPC ID |
| this_security_group_name | The name of the security group |
| this_security_group_description | The description of the security group |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
