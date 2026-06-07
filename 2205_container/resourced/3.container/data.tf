data "azurerm_storage_account" "data_stg" {
    for_each = var.cont
  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name
}