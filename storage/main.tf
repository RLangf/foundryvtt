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
resource "azurerm_storage_container" "foundryvtt_container" {
    name = var.container_name
    storage_account_name = azurerm_storage_account.storage_account.name
    container_access_type = var.container_access_type
}

# Blob upload (Foundryvtt upload)
resource "azurerm_storage_blob" "foundryvtt_blob" {
    name = var.name
    storage_account_name = azurerm_storage_account.storage_account.name
    storage_container_name = azurerm_storage_container.foundryvtt_container.name
    type = var.type
    source = "FoundryVTT-10.291.zip"
}