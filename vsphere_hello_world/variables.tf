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

variable "vsphere_datacenter" {
  description   = "vSphere datacenter name."
  type          = string
  default       = "K8s-LAB"
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

variable "template" {
  default = "DF-CentOS-79"
}

variable "vm_name" {
  default = [
    "Terraform_Test-1",
    "Terraform_Test-2",
    "Terraform_Test-3"
  ]
}

variable "vm_domain" {
  default = [
    "Terraform-Test-1",
    "Terraform-Test-2",
    "Terraform-Test-3"
  ]
}

variable "folder" {
  default = "Eric_LAB"
}

variable "ipv4_address" {
  default = [
    "192.168.200.126",
    "192.168.200.127",
    "192.168.200.128",
  ]
}

variable "ipv4_address_prefix" {
  default = "24"
}

variable "ipv4_gateway" {
  default = "192.168.200.254"
}

variable "ipv4_dns" {
  default = ["1.1.1.1","8.8.8.8"]
}