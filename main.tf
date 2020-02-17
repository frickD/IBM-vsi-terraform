resource "ibm_compute_vm_instance" "terraform-bulk-vms" {
  bulk_vms {
    hostname = "${server-name}-vm1"
    domain = "poc.com"
  }
  bulk_vms {
    hostname = "${server-name}-vm2"
    domain = "poc.com"
  }
  os_reference_code    = "${var.ibmcloud_OS-system}"
  datacenter           = "${var.ibmcloud_datacenter}"
  network_speed        = 1000
  hourly_billing       = true
  private_network_only = true
  cores                = 1
  memory               = 4096
  disks                = [100]
  local_disk           = false
}
