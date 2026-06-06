 resource "azurerm_resource_group" "aa_rg" {
  name     = "aa_rg_test1"
  location = "australiaeast"
}

resource "azurerm_virtual_network" "vm_test" {
 depends_on = [azurerm_resource_group.aa_rg]
  name                = "vm_test1"
  location            = "australiaeast"
  resource_group_name = "aa_rg_test1"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "vm_test_subnet" {
  depends_on = [azurerm_virtual_network.vm_test]
  name                 = "vm_test_subnet1"
  resource_group_name  = "aa_rg_test1"
  virtual_network_name = "vm_test1"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic_test" {
  depends_on = [azurerm_subnet.vm_test_subnet]
  name                = "nic_test1"
  location            = "australiaeast"
  resource_group_name = "aa_rg_test1"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_test_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "vm_test" {
  depends_on = [azurerm_network_interface.nic_test]
  name                  = "vmtest1"
  location              = "australiaeast"
  resource_group_name   = "aa_rg_test1"
  network_interface_ids = [azurerm_network_interface.nic_test.id]
  size                  = "Standard_D2s_v3"
  admin_username        = "azureuser"
  admin_password        = "Password1234"
  disable_password_authentication = false


  # admin_ssh_key {
  #   username   = "azureuser"
  #   public_key = file("C:/Users/abdul/.ssh/id_rsa.pub")
  # }

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