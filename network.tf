#---------------------------------------------------------
# define Public VLAN
#---------------------------------------------------------
resource "ibm_network_vlan" "veeam_os360_vlan" {
  name            = "${var.vlan_name}"
  datacenter      = "${var.ibmcloud_datacenter}"
  type            = "PUBLIC"
  router_hostname = "fcr01a.${var.ibmcloud_datacenter}"
  tags = [
    "veeam-os360",
  ]
}
