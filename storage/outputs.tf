output "foundryvtt-zip" {
    value = local.azurerm_storage_blob.source
    description = "The location of the foundryvtt zip after upload into the storage blob"
}