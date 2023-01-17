# Storage account
resource "azurerm_storage_account" "storage_account" {
    name = var.name
    resource_group_name = var.resource_group_name
    location = var.location
    account_tier = var.account_tier
    account_replication_type = var.account_replication_type
    allow_blob_public_access = var.allow_blob_public_access
    access_tier = var.access_tier
}

# Containers
resource "azurerm_storage_container" "storage_account" {
    name = var.container_name
    storage_account_name = azurerm_storage_account.storage_account.name
}
