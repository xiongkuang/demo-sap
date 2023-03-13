output "vpc_id" {
  description = "The vpc ID of within HUAWEI Cloud"
  value       = huaweicloud_vpc.sap_demo.id
}

# output "subnet_id" {
#   description = "The UUID of the subnet resource for VPC service within HUAWEI Cloud"
#   value       = huaweicloud_vpc_subnet.sap_demo.id
# }

# output "ipv4_subnet_id" {
#   description = "The network ID of the subnet resource for VPC service within HUAWEI Cloud"
#   value       = huaweicloud_vpc_subnet.sap_demo.ipv4_subnet_id
# }

