resource "azurerm_key_vault_secret" "kvs1" {
  name         = var.key_vault_secret_name
  value        = var.key_vault_value
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "kvs2" {
  name         = var.key_vault_secret_name
  value        = var.key_vault_value
  key_vault_id = data.azurerm_key_vault.kv.id
}




