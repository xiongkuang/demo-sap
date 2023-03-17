variable "image_name" {
  description = "The name of IMS image within HUAWEI Cloud"
}

variable "admin_password" {
  description = "The password of ECS instance administrator within HUAWEI Cloud"
}

variable "az_name" {
  description = "The AZ"
}

variable "app_security_group_id" {
  description = "The security group ID for the VPC service within HUAWEI Cloud"
}

variable "app_subnet_id" {
  description = "The network ID of subnet resource within HUAWEI Cloud"
}

variable "app_subnet_cidr" {
  description = "The network ID of subnet resource within HUAWEI Cloud"
}

variable "db_security_group_id" {
  description = "The security group ID for the VPC service within HUAWEI Cloud"
}

variable "db_subnet_id" {
  description = "The network ID of subnet resource within HUAWEI Cloud"
}

variable "db_subnet_cidr" {
  description = "The network ID of subnet resource within HUAWEI Cloud"
}

variable "heartbeat_subnet_id" {
  description = "The network ID of subnet resource within HUAWEI Cloud"
}

variable "heartbeat_subnet_cidr" {
  description = "The network ID of subnet resource within HUAWEI Cloud"
}



# variable "dmz_security_group_id" {
#   description = "The security group ID for the VPC service within HUAWEI Cloud"
# }

# variable "dmz_subnet_id" {
#   description = "The network ID of subnet resource within HUAWEI Cloud"
# }

# variable "dmz_subnet_cidr" {
#   description = "The network ID of subnet resource within HUAWEI Cloud"
# }


# variable "user_data_path" {
#   description = "the path of the user data"

# }