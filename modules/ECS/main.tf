terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.43.0"
    }
  }
}

data "huaweicloud_images_image" "slesforsap" {
  name        = var.image_name
  visibility  = "private"
  most_recent = true
}

data "huaweicloud_compute_flavors" "saps4app" {
  performance_type = "computingv3"
  generation       = "c6"
  cpu_core_count   = 4
  memory_size      = 16
}

data "huaweicloud_compute_flavors" "saphana" {
  performance_type = "highmem"
  generation       = "m6"
  cpu_core_count   = 32
  memory_size      = 256
}

resource "huaweicloud_compute_instance" "saps4app" {
  count     = 2
  image_id  = data.huaweicloud_images_image.slesforsap.id
  flavor_id = data.huaweicloud_compute_flavors.saps4app.ids[0]

  name              = "SAPS4PRD${count.index + 1}"
  admin_pass        = var.admin_password
  availability_zone = var.az_name

  security_group_ids = [
    var.app_security_group_id,
  ]

  system_disk_type = "SAS"
  system_disk_size = 40

  data_disks {
    type = "SAS"
    size = 200
  }
  data_disks {
    type = "SAS"
    size = "20"
  }
  data_disks {
    type = "SAS"
    size = "20"
  }

  network {
    uuid        = var.app_subnet_id
    fixed_ip_v4 = cidrhost(var.app_subnet_cidr, count.index + 10)
  }

  network {
    uuid        = var.heartbeat_subnet_id
    fixed_ip_v4 = cidrhost(var.heartbeat_subnet_cidr, count.index + 5)
  }
  #If the user_data field is specified for a Linux ECS that is created using an image
  # with Cloud-Init installed, the admin_pass field becomes invalid.
  # user_data = var.user_data_path
}

resource "huaweicloud_compute_instance" "saphana" {
  count     = 2
  image_id  = data.huaweicloud_images_image.slesforsap.id
  flavor_id = data.huaweicloud_compute_flavors.saphana.ids[0]

  name              = "SAPS4PRDDB${count.index + 1}"
  admin_pass        = var.admin_password
  availability_zone = var.az_name

  security_group_ids = [
    var.db_security_group_id,
  ]

  system_disk_type = "SSD"
  system_disk_size = 40

  data_disks {
    type = "SSD"
    size = 10
  }
  data_disks {
    type = "SSD"
    size = "256"
  }
  data_disks {
    type = "SSD"
    size = "256"
  }
  data_disks {
    type = "SAS"
    size = "256"
  }

  network {
    uuid        = var.db_subnet_id
    fixed_ip_v4 = cidrhost(var.db_subnet_cidr, count.index + 10)
  }

  network {
    uuid        = var.heartbeat_subnet_id
    fixed_ip_v4 = cidrhost(var.heartbeat_subnet_cidr, count.index + 3)
  }
  #If the user_data field is specified for a Linux ECS that is created using an image
  # with Cloud-Init installed, the admin_pass field becomes invalid.
  # user_data = var.user_data_path
}

resource "huaweicloud_evs_volume" "sbd" {
  count             = 2
  name              = "sbd${count.index + 1}"
  description       = "sbd shared volume"
  volume_type       = "SAS"
  size              = 10
  availability_zone = var.az_name
  multiattach       = true
}

resource "huaweicloud_compute_volume_attach" "attachToApp1" {
  instance_id = huaweicloud_compute_instance.saps4app[0].id
  volume_id   = huaweicloud_evs_volume.sbd[0].id
}

resource "huaweicloud_compute_volume_attach" "attachToApp2" {
  instance_id = huaweicloud_compute_instance.saps4app[1].id
  volume_id   = huaweicloud_evs_volume.sbd[0].id
}

resource "huaweicloud_compute_volume_attach" "attachToDb1" {
  instance_id = huaweicloud_compute_instance.saphana[0].id
  volume_id   = huaweicloud_evs_volume.sbd[1].id
}

resource "huaweicloud_compute_volume_attach" "attachToDb2" {
  instance_id = huaweicloud_compute_instance.saphana[1].id
  volume_id   = huaweicloud_evs_volume.sbd[1].id
}


#append vip to servers
resource "huaweicloud_networking_vip" "ascsvip" {
  name = "ascsvip"
  network_id = var.app_subnet_id
  ip_address = cidrhost(var.app_subnet_cidr, 12)
}

resource "huaweicloud_networking_vip" "ersvip" {
  name = "ersvip"
  network_id = var.app_subnet_id
  ip_address = cidrhost(var.app_subnet_cidr, 13)
}

resource "huaweicloud_networking_vip" "hanavip" {
  name = "hanavip"
  network_id = var.db_subnet_id
  ip_address = cidrhost(var.db_subnet_cidr, 12)
}

resource "huaweicloud_networking_vip_associate" "associate_ascs_vip" {
  vip_id   = huaweicloud_networking_vip.ascsvip.id
  port_ids = [
    huaweicloud_compute_instance.saps4app[0].network[0].port, 
    huaweicloud_compute_instance.saps4app[1].network[0].port
    ]
}

resource "huaweicloud_networking_vip_associate" "associate_ers_vip" {
  vip_id   = huaweicloud_networking_vip.ersvip.id
  port_ids = [
    huaweicloud_compute_instance.saps4app[0].network[0].port, 
    huaweicloud_compute_instance.saps4app[1].network[0].port
    ]
}

resource "huaweicloud_networking_vip_associate" "associate_hana_vip" {
  vip_id   = huaweicloud_networking_vip.hanavip.id
  port_ids = [
    huaweicloud_compute_instance.saphana[0].network[0].port, 
    huaweicloud_compute_instance.saphana[1].network[0].port
    ]
}
