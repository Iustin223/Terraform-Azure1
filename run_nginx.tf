resource "null_resource" "run_nginx" {
  count = var.vm_count

  connection {
    type     = "ssh"
    user     = "adminuser"
    password = random_password.vm_password.result
    host     = azurerm_public_ip.pip[count.index].ip_address
  }

  provisioner "remote-exec" {
    inline = [
      "sudo docker login ${azurerm_container_registry.acr.login_server} -u ${azurerm_container_registry.acr.admin_username} -p ${azurerm_container_registry.acr.admin_password}",
      "sudo docker pull ${azurerm_container_registry.acr.login_server}/nginx:latest",
      "sudo docker run -d -p 80:80 ${azurerm_container_registry.acr.login_server}/nginx:latest",
    ]
  }

  depends_on = [
    azurerm_linux_virtual_machine.vm,
    null_resource.install_docker,
    azurerm_container_registry.acr
  ]
}