provider "azurerm"
{


}

resource "azurerm_virtual_machine" "TenantDocker" {
  name                  = "${var.vm_name}"
  location              = "${var.main.location}"
  resource_group_name   = "${var.resource_group_name}"
  vm_size               = "Standard B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true


  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "CentOS-based 7.5"
    sku       = "7.5.1804-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "TenantDocker"
    admin_username = "testadmin"
    admin_password = "Testadmin@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
