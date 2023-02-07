// Create the Linux App Service Plan
resource "azurerm_service_plan" "foundryvtt-serviceplan" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  os_type = var.os_type
  sku_name = var.sku_name
}

// Create the web app 
resource "azurerm_linux_web_app" "webapp" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  service_plan_id = azurerm_service_plan.foundryvtt-serviceplan.id
  https_only = var.https_only
  zip_deploy_file = var.zip_deploy_file
  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = var.WEBSITE_RUN_FROM_PACKAGE
    WEBSITE_NODE_DEFAULT_VERSION = var.node_version
  }
  site_config {
    app_command_line = "cd $HOME \n mkdir foundryvtt \n mkdir foundrydata \n cd foundryvtt \n unzip FoundryVTT-10.291.zip \n node resources/app/main.js --dataPath=$HOME/foundrydata"
    minimum_tls_version = var.minimum_tls_version
    always_on = var.always_on
    application_stack {
      node_version = var.node_version
    }
  }
}