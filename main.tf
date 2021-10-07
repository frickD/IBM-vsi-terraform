#---------------------------------------------------------
# Create Security Group & Rules
#---------------------------------------------------------
resource "ibm_security_group" "secgroup1" {
    name = "secgroup1"
    description = "allow my traffic for Veeam Server"
}

resource "ibm_security_group_rule" "allow_rdh_tcp" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 3389
    port_range_max = 3389
    protocol = "tcp"
    security_group_id = ibm_security_group.secgroup1.id
}

resource "ibm_security_group_rule" "allow_rdh_udp" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 3389
    port_range_max = 3389
    protocol = "udp"
    security_group_id = ibm_security_group.secgroup1.id
}

resource "ibm_security_group_rule" "allow_in_icmp" {
    direction = "ingress"
    ether_type = "IPv4"
    protocol = "icmp"
    security_group_id = ibm_security_group.secgroup1.id
}

resource "ibm_security_group_rule" "allow_out_all" {
    direction = "egress"
    ether_type = "IPv4"
    port_range_min = 1
    port_range_max = 65000
    protocol = "tcp"
    security_group_id = ibm_security_group.secgroup1.id
}


#---------------------------------------------------------
# Create instance VSI
#---------------------------------------------------------
resource "ibm_compute_vm_instance" "veeam-os365-server" {
  hostname = "${var.server-name}"
  domain = "${var.domain-name}"
  os_reference_code    = "${var.ibmcloud_OS-system}"
  datacenter           = "${var.ibmcloud_datacenter}"
  network_speed        = 1000
  hourly_billing       = true
  private_network_only = false
  cores                = 4
  memory               = 8192
  disks                = [100]
  local_disk           = false
  public_vlan_id       = "${var.ibmcloud_pulic_vlan_id}"
  private_vlan_id      = "${var.ibmcloud_private_vlan_id}"
  public_security_group_ids    = [ibm_security_group.secgroup1.id]
  
  #provisioner "remote-exec" {
  #  script = "remote_sw_deploy.sh"
  #}
}
