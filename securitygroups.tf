#---------------------------------------------------------
# Create Security Group & Rules
#---------------------------------------------------------
resource "ibm_security_group" "secgroup1" {
    name = "secgroup1"
    description = "allow my traffic for Veeam Server"
}

resource "ibm_security_group_rule" "allow_rdh_tcp" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 3389
    port_range_max = 3389
    protocol = "tcp"
    security_group_id = ibm_security_group.secgroup1.id
}

resource "ibm_security_group_rule" "allow_rdh_udp" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 3389
    port_range_max = 3389
    protocol = "udp"
    security_group_id = ibm_security_group.secgroup1.id
}

resource "ibm_security_group_rule" "allow_in_icmp" {
    direction = "ingress"
    ether_type = "IPv4"
    protocol = "icmp"
    security_group_id = ibm_security_group.secgroup1.id
}

resource "ibm_security_group_rule" "allow_out_all" {
    direction = "egress"
    ether_type = "IPv4"
    port_range_min = 1
    port_range_max = 65000
    protocol = "tcp"
    security_group_id = ibm_security_group.secgroup1.id
}


