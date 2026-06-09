resource "azurerm_storage_container" "cnt" {

    for_each = var.ccnt
  name                  = each.value.name
  storage_account_id    = data.azurerm_storage_account.data_stgs[each.key].id
  container_access_type = each.value.container_access_type
}



