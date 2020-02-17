# variables supplied from terraform.tfvars

provider "ibm" {
  iaas_classic_username  = "${var.ibm_sl_username}"
  iaas_classic_api_key   = "${var.ibm_sl_api_key}"
  ibmcloud_api_key       = "${var.ibm_bmx_api_key}"
}
