resource "null_resource" "ping" {
  count = var.vm_count

  triggers = {
    always_run = timestamp()
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "adminuser"
      password    = random_password.vm_password.result
      host        = azurerm_linux_virtual_machine.vm[count.index].public_ip_address
      
    }

    inline = [
      "echo 'Pinging from VM${count.index} to VM${(count.index + 1) % var.vm_count}'",
      "ping -c 4 ${azurerm_linux_virtual_machine.vm[(count.index + 1) % var.vm_count].private_ip_address} || echo 'Ping failed but continuing'"
    ]
  }

  depends_on = [azurerm_linux_virtual_machine.vm]
}