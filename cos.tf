#-----------------------------------------------------
# Create COS Instance for Veeam OS365 backup
#-----------------------------------------------------
resource "ibm_resource_instance" "veeam_cos_instance" {
  name              = "veeam-cos-instance"
# resource_group_id = "${var.resource_group}"
  resource_group_id = data.ibm_resource_group.resource_group.id
  service           = "veeam-OS365-Bucket"
  region_location   = "eu-de"
  storage_class     = "smart"
  plan              = "standard"
  
}

