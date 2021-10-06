output "Data_Center_ID" {
  description	= "Data Center ID."
  value		= data.vsphere_datacenter.dc.id 
}

output "ESXi_hosts_list" {
  description	= "ESXi hosts in the vsphere cluster."
  value		= data.vsphere_host.host
}

output "datastore_list" {
  description	= "The Datastore."
  value		= data.vsphere_datastore.datastore
}

output "port_group_list" {
  description	= "The Network."
  value		= data.vsphere_network.port_group
}

output "Default_CentOS_Template" {
  description = "Used template id."
  value       = data.vsphere_virtual_machine.template
}