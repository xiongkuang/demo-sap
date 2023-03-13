

module "network_service" {
  source = "./modules/VPC"

  name_prefix = var.network_name_prefix
  vpc_cidr    = var.vpc_cidr
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




