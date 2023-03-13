output "app_security_group_id" {
  description = "The network ID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_networking_secgroup.app.id
}

output "db_security_group_id" {
  description = "The network ID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_networking_secgroup.db.id
}

output "dmz_security_group_id" {
  description = "The network ID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_networking_secgroup.dmz.id
}