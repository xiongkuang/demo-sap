variable "name_prefix" {
  description = "The name prefix for resources within HUAWEI Cloud"
}

variable "app_security_group_id" {
  description = "The security group ID for the VPC service within HUAWEI Cloud"
}

variable "db_security_group_id" {
  description = "The security group ID for the VPC service within HUAWEI Cloud"
}

variable "app_subnet_id" {
  description = "The network ID of subnet resource within HUAWEI Cloud"
}

variable "db_subnet_id" {
  description = "The network ID of subnet resource within HUAWEI Cloud"
}

variable "az_name" {
  description = "The az where the SFS locate"
}

