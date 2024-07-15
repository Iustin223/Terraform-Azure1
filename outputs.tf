output "vm_password" {
  description = "Parola generată aleatoriu pentru VM"
  value       = random_password.vm_password.result
  sensitive   = true
}

output "vm_public_ips" {
  description = "Adresele IP publice ale masinilor virtuale"
  value       = azurerm_public_ip.pip[*].ip_address
}

output "vm_private_ips" {
  description = "Adresele ip private ale masinilor virtuale"
  value       = azurerm_network_interface.example[*].ip_configuration[0].private_ip_address
} 

output "acr_login_server" {
  description = "Login server for the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  description = "Admin username for the Azure Container Registry"
  value       = azurerm_container_registry.acr.admin_username
  sensitive   = true
}

output "acr_admin_password" {
  description = "Admin password for the Azure Container Registry"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}