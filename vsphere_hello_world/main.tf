provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

### ======= BEGIN OF DATA =======

data "vsphere_datacenter" "dc" {
  name = "K8s-LAB"
}

data "vsphere_host" "host" {
  count		= "${length(var.hosts)}"
  name		= "${var.hosts[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_datastore" "datastore" {
  count		= "${length(var.datastore)}"
  name          = "${var.datastore[count.index]}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  count		= "${length(var.network)}"
  name		= "${var.port_group[count.index]}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

### ======= END OF DATA =======
