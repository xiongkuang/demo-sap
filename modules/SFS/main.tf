terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.43.0"
    }
  }
}

resource "huaweicloud_sfs_turbo" "saptrans" {
  name              = format("%s-saptrans", var.name_prefix)
  size              = 500
  share_proto       = "NFS"
  vpc_id            = var.vpc_id
  subnet_id         = var.app_subnet_id
  security_group_id = var.app_security_group_id
  availability_zone = var.az_name
}

resource "huaweicloud_sfs_turbo" "sapmnt" {
  name              = format("%s-sapmnt", var.name_prefix)
  size              = 500
  share_proto       = "NFS"
  vpc_id            = var.vpc_id
  subnet_id         = var.app_subnet_id
  security_group_id = var.app_security_group_id
  availability_zone = var.az_name
}

resource "huaweicloud_sfs_turbo" "hanabackup" {
  name              = format("%s-hanabackup", var.name_prefix)
  size              = 500
  share_proto       = "NFS"
  vpc_id            = var.vpc_id
  subnet_id         = var.db_subnet_id
  security_group_id = var.db_security_group_id
  availability_zone = var.az_name
}