resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "resource_group" {
  name     = "foundryvtt-resources"
  location = "UK South"
}


module "storage" {
  source = "./storage"

  name                     = "storage${random_string.resource_code.result}"
  container_name           = "tfstate"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "standard"
  allow_blob_public_access = false
  account_replication_type = "LRS"
  account_type             = "blob"
  access_tier              = "hot"
}