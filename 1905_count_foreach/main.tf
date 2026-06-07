resource "azurerm_resource_group" "RG1" {
    count = length(var.rg_names)
  name     = var.rg_names[count.index]
  location = "West Europe"
}