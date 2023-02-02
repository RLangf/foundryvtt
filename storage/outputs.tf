output "url" {
   value = "http://${azurerm_storage_account.storage_account.name}.blob.core.windows.net/${azurerm_storage_container.foundryvtt_container.name}/FoundryVTT-10.291.zip"
}