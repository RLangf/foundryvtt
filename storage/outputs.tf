output "url" {
   value = "https://${azurerm_storage_account.storage_account.name}.blob.core.windows.net/${azurerm_storage_container.foundryvtt_container.name}/FoundryVTT-10.291.zip"
}

# output "url" {
#    value = "https://fvttstr9ti57.blob.core.windows.net/tfstate/FoundryVTT-10.291.zip"
#  }