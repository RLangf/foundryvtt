variable "name" {
    type = string
    description = "Name of the webapp or service plan."
}

variable "resource_group_name" {
    type = string
    description = "The resource group for the resource."
}

variable "location" {
    type = string
    description = "Azure region to use for deployment. To get the list of all locations with table format from Az CLI, run #az account list-locations -o table'."
}

variable "os_type" {
    type = string
    description = "Linux or Windows"
}

variable "sku_name" {
    type = string
    description = "The plan tier"
}

# variable "service_plan_id" {
#     type = string
#     description = "The service plan id"
# }

variable "https_only" {
    type = string
    description = "Whether connections are HTTPS only"
}

variable "always_on" {
    type = bool
    description = "Whether the web app should always be on or not"
}

variable "minimum_tls_version" {
    type = string
    description = "The minimum TLS version required"
}
variable "node_version" {
    type = string
    description = "The runtime version of nodejs to run on the linux web app"
}

variable "zip_deploy_file" {
    type = string
    description = "The zip file used to deploy the web app"
}