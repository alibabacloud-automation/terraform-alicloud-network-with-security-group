Terraform module which create both VPC and Security group on Alibaba Cloud.  
terraform-alicloud-network-with-security-group
=============================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-network-with-security-group/blob/master/README-CN.md)

Terraform module which create both VPC and Security group on Alibaba Cloud.

These types of resources are supported:

* [VPC](https://www.terraform.io/docs/providers/alicloud/r/vpc.html)
* [VSwitch](https://www.terraform.io/docs/providers/alicloud/r/vswitch.html)
* [ECS-VPC Security Group](https://www.terraform.io/docs/providers/alicloud/r/security_group.html)
* [ECS-VPC Security Group Rule](https://www.terraform.io/docs/providers/alicloud/r/security_group_rule.html)

## Terraform versions

The Module requires Terraform 0.12 and Terraform Provider AliCloud 1.56.0+.

## Usage

Create both VPC and Security group.

```hcl
module "vpc-security-group" {
  source       = "terraform-alicloud-modules/network-with-security-group/alicloud"
  region       = "cn-hangzhou"
  profile      = "Your-Profile-Name"
  create_vpc   = true
  vpc_name     = "my-env-vpc"
  vpc_cidr     = "10.10.0.0/16"

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
```

## Examples

* [complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-network-with-security-group/tree/master/examples/complete)

## Notes
* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Zhou qilin(z17810666992@163.com), He Guimin(@xiaozhu36, heguimin36@163.com).

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
