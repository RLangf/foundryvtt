// Create the Linux App Service Plan
resource "azurerm_service_plan" "foundryvtt-serviceplan" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  os_type = var.os_type
  sku_name = "F1"
}

// Create the web app 
resource "azurerm_linux_web_app" "webapp" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  service_plan_id = azurerm_service_plan.foundryvtt-serviceplan.id
  https_only = var.https_only
  zip_deploy_file = var.zip_deploy_file
  site_config {
    minimum_tls_version = var.minimum_tls_version
    linux_fx_version = var.linux_fx_version
    always_on = var.always_on
  }
}