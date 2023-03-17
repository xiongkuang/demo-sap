output "vpc_id" {
  description = "The vpc ID of within HUAWEI Cloud"
  value       = huaweicloud_vpc.sap_demo.id
}

output "app_subnet_id" {
  description = "The UUID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_vpc_subnet.app.id
}

output "heartbeat_subnet_id" {
  description = "The UUID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_vpc_subnet.heartbeat.id
}

output "db_subnet_id" {
  description = "The UUID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_vpc_subnet.db.id
}

output "dmz_subnet_id" {
  description = "The UUID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_vpc_subnet.dmz.id
}

output "app_subnet_cidr" {
  description = "The UUID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_vpc_subnet.app.cidr
}

output "db_subnet_cidr" {
  description = "The UUID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_vpc_subnet.db.cidr
}


output "heartbeat_subnet_cidr" {
  description = "The UUID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_vpc_subnet.heartbeat.cidr
}