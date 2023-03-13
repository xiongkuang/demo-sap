terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.43.0"
    }
  }
}

resource "huaweicloud_vpc" "sap_demo" {
  name = format("%s-vpc", var.name_prefix)
  cidr = var.vpc_cidr
}

resource "huaweicloud_vpc_subnet" "app" {
  vpc_id = huaweicloud_vpc.sap_demo.id

  name        = "subnet-app"
  cidr        = cidrsubnet(var.vpc_cidr, 8, 0)
  gateway_ip  = cidrhost(cidrsubnet(var.vpc_cidr, 8, 0), 1)
  ipv6_enable = true
}

resource "huaweicloud_vpc_subnet" "heartbeat" {
  vpc_id = huaweicloud_vpc.sap_demo.id

  name        = "subnet-heartbeat"
  cidr        = cidrsubnet(var.vpc_cidr, 8, 1)
  gateway_ip  = cidrhost(cidrsubnet(var.vpc_cidr, 8, 1), 1)
  ipv6_enable = true
}

resource "huaweicloud_vpc_subnet" "db" {
  vpc_id = huaweicloud_vpc.sap_demo.id

  name        = "subnet-db"
  cidr        = cidrsubnet(var.vpc_cidr, 8, 2)
  gateway_ip  = cidrhost(cidrsubnet(var.vpc_cidr, 8, 2), 1)
  ipv6_enable = true
}



resource "huaweicloud_vpc_subnet" "dmz" {
  vpc_id = huaweicloud_vpc.sap_demo.id

  name        = "subnet-dmz"
  cidr        = cidrsubnet(var.vpc_cidr, 8, 3)
  gateway_ip  = cidrhost(cidrsubnet(var.vpc_cidr, 8, 3), 1)
  ipv6_enable = true
}
