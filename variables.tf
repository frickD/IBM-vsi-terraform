#---------------------------------------------------------
# MODIFY VARIABLES AS NEEDED
#---------------------------------------------------------

variable "server-name" {
  default = "veeamos365"
}

variable "server_tag" {
  default = "veeamos365"
}

variable "domain-name" {
  default = "test.com"
}

variable "ibmcloud_datacenter" {
   description = "you can use following data center in Frankfurt: fra02 , fra04, fra05"
   default = "fra02"
  }

#----------------------------------------------------------
# The VLAN-ID is not the VLAN name from Portal, you can find
# this number in URL like https://cloud.ibm.com/classic/network/vlans/xxxxxxx
# The VLAN-ID has 7 digits
#----------------------------------------------------------
variable "ibmcloud_pulic_vlan_id" {
   description = "you can add the existing public VLAN-ID from traget data center"
  }

variable "ibmcloud_private_vlan_id" {
   description = "you can add the existing private VLAN-ID from traget data center"
  }

variable "ibmcloud_OS-system" {
   description = "you can deploy different OS system on VSI like WIN / Linux. Use the specific image reference code like WIN_2012-STD-R2_64 or CENTOS_LATEST_64  . use CLI comand: $ibmcloud sl vs options"
   default = "WIN_LATEST_64"
}

variable "flavor_name" {
   description = "you can deploy different flavor for VSI like BL1_4X16X100 / M1_2X16X100 .  use CLI comand: $ibmcloud sl vs options"
   default = "BL1_4X16X100"
}


variable "ibmcloud_timeout" {
   default = 300
}
