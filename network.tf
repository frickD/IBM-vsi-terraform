#---------------------------------------------------------
# define Public VLAN and Network 
#---------------------------------------------------------

#---------------------------------------------------------
# You can create a public VLAN, or use an existing.
# Using an existing VLAN via VLAN varibale and add the specific VLAN-ID.
# Need a new public VLAN, activate following statement
#---------------------------------------------------------
#resource "ibm_network_vlan" "veeam_os365_vlan" {
#  name            = "veeam_os365_vlan"
#  datacenter      = "${var.ibmcloud_datacenter}"
#  type            = "PUBLIC"
#  tags = [
#    "veeam-os365",
#  ]
#}

resource "ibm_network_public_ip" "veeam-os365-ip" {
  routes_to = ibm_compute_vm_instance.veeam-os365-server.ipv4_address
}
