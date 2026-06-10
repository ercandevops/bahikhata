resource "azurerm_network_interface" "nics" {
  for_each = var.nics
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
      public_ip_address_id          = data.azurerm_public_ip.datapublicip[each.key].id
  }
}


resource "azurerm_linux_virtual_machine" "virtualmachine" {
  for_each = var.nics

  name                = each.value.virtual_machine_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size_vm_size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nics[each.key].id,
  ]

  

  os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_publisher
    offer     = each.value.source_image_offer
    sku       = each.value.source_image_sku
    version   = each.value.source_image_version
  }
}


