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
