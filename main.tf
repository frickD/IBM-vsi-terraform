#---------------------------------------------------------
# public SSH key
#---------------------------------------------------------
resource "ibm_compute_ssh_key" "ssh_key_vsi" {
  label      = var.ssh_label
  public_key = var.ssh_public_key
}

#---------------------------------------------------------
# Create instance VSI
#---------------------------------------------------------
resource "ibm_compute_vm_instance" "veeam-os360-server" {
  bulk_vms {
    hostname = "${var.server-name}-vm1"
    domain = "${var.domain-name}"
  }
  os_reference_code    = "${var.ibmcloud_OS-system}"
  datacenter           = "${var.ibmcloud_datacenter}"
  network_speed        = 1000
  hourly_billing       = true
  private_network_only = false
  cores                = 4
  memory               = 8192
  disks                = [100]
  local_disk           = false
  ssh_key_ids = [
    ibm_compute_ssh_key.ssh_key_vsi.id,
  ]
  #provisioner "remote-exec" {
  #  script = "remote_sw_deploy.sh"
  #}
}
