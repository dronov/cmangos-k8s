module "proxmox_instance" {
  source = "./modules/proxmox_instance"

  proxmox_host          = var.proxmox_host
  ubuntu_template_name  = var.ubuntu_template_name
  net_prefix            = var.net_prefix
  ssh_key               = var.ssh_key
  instance_count        = var.instance_count
}
