terraform-alicloud-network-with-security-group
==============================================

Terraform模块用于在阿里云上同时创建 VPC 和 Security Group。

支持以下类型的资源：

* [VPC](https://www.terraform.io/docs/providers/alicloud/r/vpc.html)
* [VSwitch](https://www.terraform.io/docs/providers/alicloud/r/vswitch.html)
* [ECS-VPC Security Group](https://www.terraform.io/docs/providers/alicloud/r/security_group.html)
* [ECS-VPC Security Group Rule](https://www.terraform.io/docs/providers/alicloud/r/security_group_rule.html)

## 用法

同时创建 VPC 和 Security Group。

```hcl
module "vpc-security-group" {
  source           = "terraform-alicloud-modules/network-with-security-group/alicloud"
  create_vpc       = true
  use_existing_vpc = false
  vpc_name         = "my-env-vpc"
  vpc_cidr         = "10.10.0.0/16"

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

## 示例

* [完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-network-with-security-group/tree/master/examples/complete)

## 注意事项
本Module从版本v1.2.0开始已经移除掉如下的 provider 的显式设置：

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/network-with-security-group"
}
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.1.0:

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

如果你想对正在使用中的Module升级到 1.2.0 或者更高的版本，那么你可以在模板中显式定义一个相同Region的provider：
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
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显式指定这个provider：

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

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

提交问题
-------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

参考
----
Apache 2 Licensed. See LICENSE for full details.

许可
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)