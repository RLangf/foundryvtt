// Create the Linux App Service Plan
resource "azurerm_service_plan" "foundryvtt-serviceplan" {
  name = "foundryvtt-webplan"
  resource_group_name = var.resource_group_name.name
  location = var.resource_group_name.location
  os_type = "Linux"
  sku {
    tier = "Free"
    size = "F1"
  }
}

// Create the web app 
resource "azurerm_linux_web_app" "webapp" {
  name = "foundryvtt-webapp"
  resource_group_name = var.resource_group_name.name
  location = var.resource_group_name.location
  service_plan_id = azurerm_service_plan.foundryvtt-serviceplan.id
  // Sets up app environment
  site_config {
    minimum_tls_version = "1.2"
    linux_fx_version = "NODE|18-lts"
  }
}