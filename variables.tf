#---------------------------------------------------------
# MODIFY VARIABLES AS NEEDED
#---------------------------------------------------------
variable "iaas_classic_username" {}

variable "iaas_classic_api_keyy" {}

# variable "ibmcloud_api_key" {}


#---------------------------------------------------------
## DEFINE sshkey to be used for compute instances
#---------------------------------------------------------
#variable "ssh_keyname" {
#          description = "add your SSH Key"
#          default = "" 
#         }

#---------------------------------------------------------
## DEFINE Ressource Group (IAM)
#---------------------------------------------------------
variable "resource_group" {
  description = "The Ressource Roup must be defined in IBM Cloud IAM"
  default = "default"
}


#---------------------------------------------------------


variable "server-name" {
  default = "servername"
}

variable "server-count" {
  default = 1
}

variable "ibmcloud_timeout" {
   default = 300
}

variable "ibmcloud_OS-system" {
   description = "you can deploy different OS system on VSI like WIN / Linux. Use the specific image reference code like WIN_2012-STD-R2_64 or CENTOS_LATEST_64  . use CLI comand: $ibmcloud sl vs options"
   default = "CENTOS_LATEST_64"
}
