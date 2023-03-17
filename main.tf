data "huaweicloud_availability_zones" "az_names" {}

module "network_service" {
  source = "./modules/VPC"

  name_prefix = var.name_prefix
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
  vpc_id                = module.network_service.vpc_id 
  app_security_group_id = module.security_groups.app_security_group_id
  db_security_group_id  = module.security_groups.db_security_group_id
  app_subnet_id         = module.network_service.app_subnet_id
  db_subnet_id          = module.network_service.db_subnet_id
  az_name               = data.huaweicloud_availability_zones.az_names.names[0]
}


module "ecs_service" {
  source = "./modules/ECS"

  image_name        = var.image_name
  az_name           = data.huaweicloud_availability_zones.az_names.names[0]
  admin_password    = var.ecs_admin_password

  app_subnet_id         = module.network_service.app_subnet_id
  app_security_group_id = module.security_groups.app_security_group_id
  db_subnet_id         = module.network_service.db_subnet_id 
  db_security_group_id = module.security_groups.db_security_group_id

  app_subnet_cidr = module.network_service.app_subnet_cidr
  db_subnet_cidr = module.network_service.db_subnet_cidr

  heartbeat_subnet_id = module.network_service.heartbeat_subnet_id
  heartbeat_subnet_cidr = module.network_service.heartbeat_subnet_cidr
  # user_data_path    = "${file("./scripts/user_data.sh")}" 
}




