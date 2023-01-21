// Generate a random string to be used when unique names are required
resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

// Create the resource group
resource "azurerm_resource_group" "resource_group" {
  name     = "foundryvtt-resources"
  location = "UK South"
}

// Create the Storage Account for foundry
module "storage" {
  source = "./storage"

  name                     = "foundryvtt-storage${random_string.resource_code.result}"
  container_name           = "tfstate"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "standard"
  allow_blob_public_access = true
  account_replication_type = "LRS"
  account_type             = "blob"
  access_tier              = "hot"
}

// Creates the Web App Service Plan
module "service_plan" {
  source = "./webapp"

  name = "webplan-${terraform.workspace}"
  resource_group_name = azurerm_resource_group.resource_group.name
  location = azurerm_resource_group.resource_group.location
  os_type = "Linux"
  sku_name = "F1"
}

// Creates the Web App
module "web_app" {
  name = "webapp-${terraform.workspace}"
  resource_group_name = azurerm_resource_group.resource_group.name
  location = azurerm_resource_group.resource_group.location
  service_plan_id = azurerm_service_plan.appserviceplan.id
  https_only = false
  // Sets up app environment
  site_config {
    minimum_tls_version = "1.2"
    linux_fx_version = "NODE|18-lts"
  }
}

// Deploy code from repo to run foundryvtt
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id = azurerm_linux_web_app.id
  repo_url = ""
  branch = "foundryvtt"
  use_manual_integration = true
  use_mercurial = false
}