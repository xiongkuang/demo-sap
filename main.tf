data "huaweicloud_availability_zones" "az_names" {}

module "network_service" {
  source = "./modules/VPC"

  name_prefix = var.network_name_prefix
  vpc_cidr    = var.vpc_cidr
  az_name     = data.huaweicloud_availability_zones.az_names.names[0]
}

module "security_groups" {
  source = "./modules/SecurityGroup"

  name_prefix = var.name_prefix
}

module "sfs_storage" {
  source = "./modules/SFS"

  name_prefix           = var.name_prefix
  app_security_group_id = module.security_groups.app_security_group_id
  db_security_group_id  = module.security_groups.db_security_group_id
  app_subnet_id         = module.network_service.app_subnet_id
  db_subnet_id          = module.network_service.db_subnet_id
  az_name               = data.huaweicloud_availability_zones.az_names.names[0]
}


# module "ecs_service" {
#   source = "./modules/ECS"

#   instance_count    = var.instance_count
#   image_name        = var.image_name
#   name_prefix       = var.ecs_name_prefix
#   az_names          = data.huaweicloud_availability_zones.test.names
#   subnet_id         = module.network_service.subnet_id
#   security_group_id = module.network_service.security_group_id
#   admin_password    = var.ecs_admin_password
#   user_data_path    = "${file("./scripts/user_data.sh")}" 
# }




