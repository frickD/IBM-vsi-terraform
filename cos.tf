#-----------------------------------------------------
# Create COS Instance for Veeam OS365 backup
#-----------------------------------------------------
data "ibm_iam_account_settings" "iam_account_settings" {
}

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
resource "ibm_resource_instance" "veeam-os395-instance123" {
  name              = "${var.account_unique_value}${substr(data.ibm_iam_account_settings.iam_account_settings.account_id,0,5)}"
# resource_group_id = "${var.resourcegroup}"
  resource_group_id = ibm_resource_group.resourcegroup.id
  service           = "cloud-object-storage"               # Do not modify
  location          = "global"                             # Do not modify
  plan              = "standard"                           # is standard or lite
}

#---------------------------------------------------------
# Create COS Bucket
#---------------------------------------------------------
resource "ibm_cos_bucket" "veeam-os395-bucket123" {
  bucket_name           = "${var.account_unique_value}${substr(data.ibm_iam_account_settings.iam_account_settings.account_id,0,5)}"
  resource_instance_id  = ibm_resource_instance.veeam-os395-instance123.id
  region_location       = "eu-de"
  storage_class         = "smart"
}
