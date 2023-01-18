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

// Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name = "webplan-foundryvtt"
  resource_group_name = azurerm_resource_group.resource_group.name
  location = azurerm_resource_group.resource_group.location
  os_type = "Linux"
  sku_name = "B1"
}

// Create the web app 
resource "azurerm_linux_web_app" "webapp" {
  name = "webapp-foundryvtt"
  resource_group_name = azurerm_resource_group.resource_group.name
  location = azurerm_resource_group.resource_group.location
  service_plan_id = azurerm_service_plan.appserviceplan.id
  https_only = false
  site_config {
    minimum_tls_version = "1.2"
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