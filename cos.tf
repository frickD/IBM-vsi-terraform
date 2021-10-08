#-----------------------------------------------------
# Create COS Instance for Veeam OS365 backup
#-----------------------------------------------------

#---------------------------------------------------------
## DEFINE Ressource Group veeam-os365  or using default
#---------------------------------------------------------
#variable "resourcegroup" {
#  description = "The Ressource Roup must be defined in IBM Cloud IAM"
#  default = "default"
#}

# Create new resource group
resource "ibm_resource_group" "resourcegroup" {
  name     = "veeam-os365"
}

data "ibm_resource_group" "resourcegroup" {
  name = "veeam-os365"
}

#---------------------------------------------------------
# Create COS Instance
#---------------------------------------------------------
resource "ibm_resource_instance" "veeam_cos_instance" {
  name              = "veeam-cos-instance"
# resource_group_id = "${var.resourcegroup}"
  resource_group_id = data.ibm_resource_group.resourcegroup.id
  service           = "veeam-OS365-Bucket"
  location          = "global"
  plan              = "standard"
}

#---------------------------------------------------------
# Create COS Bucket
#---------------------------------------------------------
resource "ibm_cos_bucket" "veeam_cos_instance_bucket" {
  bucket_name           = "veeam-cos-bucket"
  resource_instance_id  = ibm_resource_instance.cos_instance.id
  region_location       = "eu-de"
  storage_class         = "smart"
}
