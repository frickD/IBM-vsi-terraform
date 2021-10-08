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

#data "ibm_resource_group" "resourcegroup" {
#  name = "veeam-os365"
#}

#---------------------------------------------------------
# Create COS Instance
#---------------------------------------------------------
resource "ibm_resource_instance" "veeam_cos_instance" {
  name              = "veeam-os395-instance"
# resource_group_id = "${var.resourcegroup}"
  resource_group_id = ibm_resource_group.resourcegroup.id
  service           = "cloud-object-storage"               # Do not modify
  location          = "global"                             # Do not modify
  plan              = "standard"                           # is standard or lite
}

#---------------------------------------------------------
# Create COS Bucket
#---------------------------------------------------------
resource "ibm_cos_bucket" "veeam_cos_instance_bucket" {
  bucket_name           = "veeam-os365-bucket"
  resource_instance_id  = ibm_resource_instance.veeam_cos_instance.id
  region_location       = "eu-de"
  storage_class         = "smart"
}
