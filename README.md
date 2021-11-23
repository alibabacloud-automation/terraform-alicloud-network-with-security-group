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

## Usage

Create both VPC and Security group.

```hcl
module "vpc-security-group" {
  source       = "terraform-alicloud-modules/network-with-security-group/alicloud"
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
From the version v1.2.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/network-with-security-group"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.1.0:

```hcl
module "vpc-security-group" {
  source     = "terraform-alicloud-modules/network-with-security-group/alicloud"
  version    = "1.1.0"
  region     = "cn-hangzhou"
  profile    = "Your-Profile-Name"
  create_vpc = true
  vpc_name   = "my-env-vpc"
  // ...
}
```

If you want to upgrade the module to 1.2.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
  region  = "cn-hangzhou"
  profile = "Your-Profile-Name"
}
module "vpc-security-group" {
  source     = "terraform-alicloud-modules/network-with-security-group/alicloud"
  create_vpc = true
  vpc_name   = "my-env-vpc"
  // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-hangzhou"
  profile = "Your-Profile-Name"
  alias   = "hz"
}
module "cdn" {
  source     = "terraform-alicloud-modules/network-with-security-group/alicloud"
  providers  = {
    alicloud = alicloud.hz
  }
  create_vpc = true
  vpc_name   = "my-env-vpc"
  // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
