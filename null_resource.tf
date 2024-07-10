resource "null_resource" "ping" {
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "adminuser"
      password = random_password.vm_password.result
      host = azurerm_linux_virtual_machine.vm[0].public_ip_address
    }

    inline = [ 
        "ping -c 4 ${azurerm_linux_virtual_machine.vm[1].private_ip_address}"
     ]

  }
}