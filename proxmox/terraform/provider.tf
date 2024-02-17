provider "proxmox" {
  pm_api_url          = data.sops_file.secrets.data["pm_api_url"]
  pm_api_token_id     = data.sops_file.secrets.data["pm_api_token_id"]
  pm_api_token_secret = data.sops_file.secrets.data["pm_api_token_secret"]
  pm_tls_insecure     = true
}
