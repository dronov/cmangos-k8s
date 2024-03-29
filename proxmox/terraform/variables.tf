variable "ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDM92Vb893P/I2bBiJeY0Q7kNjfizy4nVcj1lRS08VyVHpLCivBIZLFn0eKDss2LbSh0oXnrFug4Ez3vnRi63Sg1fPgUtPP0omwoQahlFTLmZ27mYeDkRxD3mCrjeFwajaqjwnhV3dvAe9+1D4Na9J0cq2RZphKzPLaNRM74qrHGb1RIsUqPFbWlDRKenOP2kvS/lEIVqKpnlFnqK3NPh4+27D0od5+doYx6Q9WFwPpVSNyZf9UXsknZhvuS6P2xVcfm2pTZBeAlhbHILdw/3HVs+koA8YmedH9bWy/ZEKl6gGkpErAm/lfEbkmj2H0ZmgkAJaIvODJskH5Fzal0HMp mishadronov"
}
variable "proxmox_host" {
  type    = string
  default = "twtrp"
}
variable "ubuntu_template_name" {
  type    = string
  default = "jammy-tpl"
}
variable "net_prefix" {
  type    = string
  default = "192.168.0"
}
variable "instance_count" {
  type    = number
  default = 9
}
