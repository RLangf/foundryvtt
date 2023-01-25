# foundryvtt
Terraform Deployment for Azure App Service.

# Prerequisites
An Azure subscription
Terraform installed on your machine
A service principal for Terraform with the Contributor role on your subscription
# Usage
Clone this repository
Create a terraform.tfvars file and add the following variables:
subscription_id: your Azure subscription ID
client_id: the client ID of your service principal
client_secret: the client secret of your service principal
tenant_id: the tenant ID of your service principal
app_name: the name of your web app
resource_group_name: the name of the resource group to deploy the web app to
location: the Azure region to deploy the web app to
Run terraform init to initialize the Terraform working directory
Run terraform apply to deploy the web app
Once the deployment is complete, run terraform destroy to delete the web app and associated resources
# Note
Make sure to replace the values of the variables with your own values.
Please read the Azure documentation to know more about the Azure consumption app service plan
By default this will create a web app on Linux Consumption plan and can be modified as per your requirement.
Also, you can modify the plan type as per your requirement.
# References
Azure App Service on Linux - https://docs.microsoft.com/en-us/azure/app-service/containers/app-service-linux-intro
Azure App Service Plan - https://docs.microsoft.com/en-us/azure/app-service/overview-hosting-plans
Terraform Azure Provider - https://www.terraform.io/docs/providers/azurerm/index.html