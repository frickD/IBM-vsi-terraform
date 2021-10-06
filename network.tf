#---------------------------------------------------------
# define Public VLAN , Network and Firewall
#---------------------------------------------------------
resource "ibm_network_vlan" "veeam_os360_vlan" {
  name            = "veeam_os360_vlan"
  datacenter      = "${var.ibmcloud_datacenter}"
  type            = "PUBLIC"
  router_hostname = "fcr01a.${var.ibmcloud_datacenter}"
  tags = [
    "veeam-os360",
  ]
}

resource "ibm_network_public_ip" "veeam-os360-ip" {
  routes_to = ibm_compute_vm_instance.veeam-os360-server.ipv4_address
}

resource "ibm_firewall" "veeam-os360-fw" {
  ha_enabled     = false
  public_vlan_id = ibm_compute_vm_instance.veeam-os360-server.public_vlan_id
}

resource "ibm_firewall_policy" "rules" {
  firewall_id = ibm_firewall.veeam-os360-fw.id
  rules {
    action               = "deny"
    src_ip_address       = "0.0.0.0"
    src_ip_cidr          = 0
    dst_ip_address       = "any"
    dst_ip_cidr          = 32
    dst_port_range_start = 1
    dst_port_range_end   = 65535
    notes                = "Deny all"
    protocol             = "tcp"
  }
  rules {
    action               = "permit"
    src_ip_address       = "0.0.0.0"
    src_ip_cidr          = 0
    dst_ip_address       = "any"
    dst_ip_cidr          = 32
    dst_port_range_start = 22
    dst_port_range_end   = 22
    notes                = "Allow SSH"
    protocol             = "tcp"
  }
  rules {
    action               = "permit"
    src_ip_address       = "0.0.0.0"
    src_ip_cidr          = 0
    dst_ip_address       = "any"
    dst_ip_cidr          = 32
    dst_port_range_start = 3389
    dst_port_range_end   = 3389
    notes                = "Allow RDH UDP port"
    protocol             = "udp"
  }
  rules {
    action               = "permit"
    src_ip_address       = "0.0.0.0"
    src_ip_cidr          = 0
    dst_ip_address       = "any"
    dst_ip_cidr          = 32
    dst_port_range_start = 3389
    dst_port_range_end   = 3389
    notes                = "Allow RDH TCP port"
    protocol             = "tcp"
  }
}
