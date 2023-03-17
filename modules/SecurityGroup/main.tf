terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.43.0"
    }
  }
}


#define the security group and the sg rules of sap app
resource "huaweicloud_networking_secgroup" "app" {
  name                 = format("%s-app", var.name_prefix)
  delete_default_rules = true
}

resource "huaweicloud_networking_secgroup_rule" "app_in_v4_icmp_all" {
  security_group_id = huaweicloud_networking_secgroup.app.id
  ethertype         = "IPv4"
  direction         = "ingress"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "huaweicloud_networking_secgroup_rule" "app_in_v6_icmp_all" {
  security_group_id = huaweicloud_networking_secgroup.app.id
  ethertype         = "IPv6"
  direction         = "ingress"
  protocol          = "icmp"
  remote_ip_prefix  = "::/0"
}

resource "huaweicloud_networking_secgroup_rule" "app_in_v4_samegroup" {
  security_group_id = huaweicloud_networking_secgroup.app.id
  ethertype         = "IPv4"
  direction         = "ingress"
  remote_group_id   = huaweicloud_networking_secgroup.app.id
}

resource "huaweicloud_networking_secgroup_rule" "app_in_v6_samegroup" {
  security_group_id = huaweicloud_networking_secgroup.app.id
  ethertype         = "IPv6"
  direction         = "ingress"
  remote_group_id   = huaweicloud_networking_secgroup.app.id
}

resource "huaweicloud_networking_secgroup_rule" "app_out_v4_all" {
  security_group_id = huaweicloud_networking_secgroup.app.id
  ethertype         = "IPv4"
  direction         = "egress"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "huaweicloud_networking_secgroup_rule" "app_out_v6_all" {
  security_group_id = huaweicloud_networking_secgroup.app.id
  ethertype         = "IPv6"
  direction         = "egress"
  remote_ip_prefix  = "::/0"
}


#define the security group and the sg rules of sap app
resource "huaweicloud_networking_secgroup" "db" {
  name                 = format("%s-db", var.name_prefix)
  delete_default_rules = true
}

resource "huaweicloud_networking_secgroup_rule" "db_in_v4_icmp_all" {
  security_group_id = huaweicloud_networking_secgroup.db.id
  ethertype         = "IPv4"
  direction         = "ingress"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "huaweicloud_networking_secgroup_rule" "db_in_v6_icmp_all" {
  security_group_id = huaweicloud_networking_secgroup.db.id
  ethertype         = "IPv6"
  direction         = "ingress"
  protocol          = "icmp"
  remote_ip_prefix  = "::/0"
}

resource "huaweicloud_networking_secgroup_rule" "db_in_v4_samegroup" {
  security_group_id = huaweicloud_networking_secgroup.db.id
  ethertype         = "IPv4"
  direction         = "ingress"
  remote_group_id   = huaweicloud_networking_secgroup.db.id
}

resource "huaweicloud_networking_secgroup_rule" "db_in_v6_samegroup" {
  security_group_id = huaweicloud_networking_secgroup.db.id
  ethertype         = "IPv6"
  direction         = "ingress"
  remote_group_id   = huaweicloud_networking_secgroup.db.id
}

resource "huaweicloud_networking_secgroup_rule" "db_out_v4_all" {
  security_group_id = huaweicloud_networking_secgroup.db.id
  ethertype         = "IPv4"
  direction         = "egress"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "huaweicloud_networking_secgroup_rule" "db_out_v6_all" {
  security_group_id = huaweicloud_networking_secgroup.db.id
  ethertype         = "IPv6"
  direction         = "egress"
  remote_ip_prefix  = "::/0"
}


#define the security group and the sg rules of sap app
resource "huaweicloud_networking_secgroup" "dmz" {
  name                 = format("%s-dmz", var.name_prefix)
  delete_default_rules = true
}

resource "huaweicloud_networking_secgroup_rule" "dmz_in_v4_icmp_all" {
  security_group_id = huaweicloud_networking_secgroup.dmz.id
  ethertype         = "IPv4"
  direction         = "ingress"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "huaweicloud_networking_secgroup_rule" "dmz_in_v6_icmp_all" {
  security_group_id = huaweicloud_networking_secgroup.dmz.id
  ethertype         = "IPv6"
  direction         = "ingress"
  protocol          = "icmp"
  remote_ip_prefix  = "::/0"
}

resource "huaweicloud_networking_secgroup_rule" "dmz_in_v4_samegroup" {
  security_group_id = huaweicloud_networking_secgroup.dmz.id
  ethertype         = "IPv4"
  direction         = "ingress"
  remote_group_id   = huaweicloud_networking_secgroup.dmz.id
}

resource "huaweicloud_networking_secgroup_rule" "dmz_in_v6_samegroup" {
  security_group_id = huaweicloud_networking_secgroup.dmz.id
  ethertype         = "IPv6"
  direction         = "ingress"
  remote_group_id   = huaweicloud_networking_secgroup.dmz.id
}

resource "huaweicloud_networking_secgroup_rule" "dmz_out_v4_all" {
  security_group_id = huaweicloud_networking_secgroup.dmz.id
  ethertype         = "IPv4"
  direction         = "egress"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "huaweicloud_networking_secgroup_rule" "dmz_out_v6_all" {
  security_group_id = huaweicloud_networking_secgroup.dmz.id
  ethertype         = "IPv6"
  direction         = "egress"
  remote_ip_prefix  = "::/0"
}
