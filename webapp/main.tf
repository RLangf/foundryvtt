// Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name = "webplan-${terraform.workspace}"
  resource_group_name = azurerm_resource_group.resource_group.name
  location = azurerm_resource_group.resource_group.location
  os_type = "Linux"
  sku_name = "F1"
}

// Create the web app 
resource "azurerm_linux_web_app" "webapp" {
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