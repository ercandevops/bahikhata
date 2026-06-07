resource "azurerm_resource_group" "rgs" {
    for_each = var.resource_names
  name     = each.value.rg_name
  location = each.value.rg_location
}


