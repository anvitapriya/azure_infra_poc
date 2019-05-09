provider "azurerm"
- task: Terraform@2
  inputs:
    Arguments: 
    InstallTerraform: false
    UseAzureSub: false
- task: TerraformCLI@0
  inputs:
    command: 'validate'
    secureVarsFile: 'variables.tf'
{


}

resource "azurerm_network_interface" "TenantDockerNIC" {
  name                = "${var.nic_name}"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"

  ip_configuration {
    name                          = "TenantDockerNIC"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "static"
    private_ip_address = "10.0.0.5"
  }
}

resource "azurerm_virtual_machine" "TenantDocker" {
  name                  = "${var.vm_name}"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  network_interface_ids = ["${azurerm_network_interface.TenantDockerNIC.id}"]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true


  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
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
