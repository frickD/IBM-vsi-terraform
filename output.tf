#---------------------------------------------------------
## Log output public IP
#---------------------------------------------------------

output "veeam-os365-ip"{
  value = "http://${ibm_network_public_ip.veeam-os365-ip.ip_address}"
}
