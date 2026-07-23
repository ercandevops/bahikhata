terraform {
  required_providers {
    azurerm = {
        source  = "hashicorp/azurerm"
        version = "=4.76.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "463b3526-cc09-4609-97e3-dbe5a21dffce"
}



resource "azurerm_resource_group" "testrg" {
  name     = "testrg"
  location = "australiaeast"
}
 
resource "azurerm_virtual_network" "testvnet" {
    depends_on = [azurerm_resource_group.testrg]
  name                = "testvnet"
  address_space       = ["10.0.0.0/16"]
  location            = "australiaeast"
  resource_group_name = "testrg"
}
 
resource "azurerm_subnet" "testsubnet" {
     depends_on = [azurerm_virtual_network.testvnet]
  name                 = "testsubnet"
  resource_group_name  = "testrg"
  virtual_network_name = "testvnet"
  address_prefixes     = ["10.0.2.0/24"]
}
 
resource "azurerm_network_interface" "testnic" {
    depends_on = [azurerm_subnet.testsubnet]
  name                = "testnic"
  location            = "australiaeast"
  resource_group_name = "testrg"
 
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.testsubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
 
resource "azurerm_linux_virtual_machine" "tesvm" {
     depends_on = [azurerm_network_interface.testnic]
  name                = "tesvm"
  resource_group_name = "testrg"
  location            = "australiaeast"
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd1234!"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.testnic.id,
  ]
 
 
 
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
 
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}