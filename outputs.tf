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
  value = azurerm_network_interface.example[*].private_ip_address
} 