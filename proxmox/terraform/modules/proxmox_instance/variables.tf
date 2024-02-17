# modules/proxmox_instance/variables.tf
variable "instance_count" {
  type    = number
}

variable "proxmox_host" {
  type    = string
}

variable "ubuntu_template_name" {
  type    = string
}

variable "net_prefix" {
  type    = string
}

variable "ssh_key" {
  type    = string
}