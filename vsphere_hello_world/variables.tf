variable "vsphere_user" {
  description = "vCenter Login User."
  type        = string
  sensitive   = true
}


variable "vsphere_password" {
  description = "vCenter Login User Password."
  type        = string
  sensitive   = true
}


variable "vsphere_server" {
  description = "vCenter IP Address."
  type        = string
  sensitive   = true
}


variable "hosts" {
  description = "The ESXi hosts name list in vSphere."
  default = [
    "192.168.200.1",
    "192.168.200.2",
    "192.168.200.3"
  ]
}

variable "datastore" {
  description = "The datastore list in vSphere."
  default = [
    "Local_192.168.200.1",
    "Local_192.168.200.2",
    "Local_192.168.200.3"
  ]
}

variable "port_group" {
  default = [
    "VM Network"
  ]
}
