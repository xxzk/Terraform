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
  count		      = "${length(var.hosts)}"
  name		      = "${var.hosts[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_datastore" "datastore" {
  count		      = "${length(var.datastore)}"
  name          = "${var.datastore[count.index]}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "port_group" {
  count		      = "${length(var.port_group)}"
  name		      = "${var.port_group[count.index]}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name            = "${var.template}"
  datacenter_id   = data.vsphere_datacenter.dc.id
}

### ======= END OF DATA =======


resource "vsphere_virtual_machine" "vm_1" {
  name              = "${var.vm_name[0]}"
  resource_pool_id  = "${data.vsphere_host.host[0].resource_pool_id}"
  datastore_id      = "${data.vsphere_datastore.datastore[0].id}"
  guest_id          = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type         = "${data.vsphere_virtual_machine.template.scsi_type}"
  
  network_interface {
    network_id    = "${data.vsphere_network.port_group[0].id}"
    adapter_type  = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  clone {
    template_uuid   = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "${var.vm_domain[0]}"
        domain    = "${var.vm_domain[0]}"
      }

      network_interface {
        ipv4_address = "${var.ipv4_address[0]}"
        ipv4_netmask = "${var.ipv4_address_prefix}"
      }

      ipv4_gateway      = "${var.ipv4_gateway}"
      dns_server_list   = "${var.ipv4_dns}"
    }
  }

  disk {
    unit_number       = 0
    label             = "${data.vsphere_virtual_machine.template.disks.0.label}"
    size              = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub     = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned  = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  disk {
    unit_number       = 1
    label             = "${data.vsphere_virtual_machine.template.disks.1.label}"
    size              = "${data.vsphere_virtual_machine.template.disks.1.size}"
    eagerly_scrub     = "${data.vsphere_virtual_machine.template.disks.1.eagerly_scrub}"
    thin_provisioned  = "${data.vsphere_virtual_machine.template.disks.1.thin_provisioned}"
  }

  disk {
    unit_number       = 2
    label             = "${data.vsphere_virtual_machine.template.disks.2.label}"
    size              = "${data.vsphere_virtual_machine.template.disks.2.size}"
    eagerly_scrub     = "${data.vsphere_virtual_machine.template.disks.2.eagerly_scrub}"
    thin_provisioned  = "${data.vsphere_virtual_machine.template.disks.2.thin_provisioned}"
  }
}
