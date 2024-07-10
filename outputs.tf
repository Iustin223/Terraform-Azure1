output "vm_password" {
  description = "Parola generată aleatoriu pentru VM"
  value       = random_password.vm_password.result
  sensitive   = true
}

 