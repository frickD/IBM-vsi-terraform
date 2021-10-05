#-------------------------------------------------------
# variables supplied from terraform.tfvars
# Please update and check necessary Terraform version. 
# information is available at Terraform provider Doc.
#-------------------------------------------------------

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">=1.14.0"
    }
  }
}

variable "iaas_classic_username" {}
variable "iaas_classic_api_key" {}

provider "ibm" {
  iaas_classic_username = "${var.iaas_classic_username}"
  iaas_classic_api_key  = "${var.iaas_classic_api_key}"
  # ibmcloud_api_key      = "${var.ibmcloud_api_key}"
}
