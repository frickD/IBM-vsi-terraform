#---------------------------------------------------------
# MODIFY VARIABLES AS NEEDED
#---------------------------------------------------------
variable "ibm_sl_username" {}

variable "ibmcloud_iaas_api_key" {}

variable "ibmcloud_api_key" {}


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
