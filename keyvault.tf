# What am I logged in as
data "azurerm_client_config" "current" {}

# Resource group for Key Vault
resource "azurerm_resource_group" "key_vault_resource_group" {
  name     = "foundryvtt-resources-key-vault"
  location = "UK South"
}

resource "azurerm_key_vault" "key_vault" {
  name                        = "foundryvtt-key-vault"
  location                    = azurerm_resource_group.key_vault_resource_group.location
  resource_group_name         = azurerm_resource_group.key_vault_resource_group.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name                  = "standard"
  enable_rbac_authorization = true
}