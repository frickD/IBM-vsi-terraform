#---------------------------------------------------------
# MODIFY VARIABLES AS NEEDED
#---------------------------------------------------------
variable "iaas_username" {
          description = "add your IBM Cloud username"
                  }

variable "ibmcloud_iaas_api_key" {
          description = "add your IBM Cloud IaaS API Key
	            }

variable "ibmcloud_api_key" {
          description = "add your IBM Cloud API Key
                    }

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
