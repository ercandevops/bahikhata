data "azurerm_storage_account" "data_stgs" {
    for_each = var.ccnt
  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name
}