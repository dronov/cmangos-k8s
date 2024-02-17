resource "proxmox_vm_qemu" "instance" {
  count       = var.instance_count
  name        = count.index == 3 || count.index == 1 ? "infra${count.index}" : "server${count.index}"
  target_node = var.proxmox_host
  clone       = var.ubuntu_template_name
  os_type     = "linux"
  cores       = 4
  sockets     = 1
  cpu         = "host"
  memory      = count.index == 3 || count.index == 1 ? 4096 : 2048
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  qemu_os     = "other"

  disk {
    slot     = 0
    size     = "50G"
    type     = "scsi"
    storage  = "local-lvm"
    iothread = 0
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = count.index == 3 || count.index == 1 ? "ip=${var.net_prefix}.5${count.index}/24,gw=${var.net_prefix}.1" : "ip=${var.net_prefix}.10${count.index + 1}/24,gw=${var.net_prefix}.1"

  lifecycle {
    ignore_changes = [network]
  }

  sshkeys = var.ssh_key
}