#---------------------------------------------------------
## Log output public IP
#---------------------------------------------------------

output "veeam-os360-ip"{
  value = "http://${ibm_network_public_ip.veeam-os360-ip.ip_address}"
}
