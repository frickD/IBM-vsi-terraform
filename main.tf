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
  public_security_group_ids    = ibm_security_group.secgroup1.id
  
  #provisioner "remote-exec" {
  #  script = "remote_sw_deploy.sh"
  #}
}
