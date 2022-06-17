terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.17.1"
    }
    alicloud = {
      source = "aliyun/alicloud"
      version = ">=1.164.0"
    }
  }
}
