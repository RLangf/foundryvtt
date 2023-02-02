# Generate a random string to be used when unique names are required
resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

# Create the resource group
resource "azurerm_resource_group" "resource_group" {
  name     = "foundryvtt-resources"
  location = "UK South"
}

# Create the Storage Account for foundryvtt and uploads data into blob
module "storage" {
  source = "./storage"

  name                     = "foundryvtt-storage${random_string.resource_code.result}"
  container_name           = "tfstate"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "standard"
  account_replication_type = "LRS"
  account_type             = "blob"
  access_tier              = "hot"
  type                     = "Block"
}

# Creates the Web App
module "web_app" {
  source = "./webapp"

  os_type             = "Linux"
  sku_name            = "F1"
  name                = "foundryvtt-webapp"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  https_only          = false
  zip_deploy_file     = module.storage.url
  minimum_tls_version = "1.2"
  linux_fx_version    = "NODE|18-lts"
  always_on           = false
}