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

variable "service_plan_id" {
    type = string
    description = "The service plan id"
}

variable "https_only" {
    type = string
    description = "Whether connections are HTTPS only"
}


variable "account_replication_type" {
    type = string
    description = "LRS, ZRS, or GRS."
}

variable "always_on" {
    type = boolean
    description = "Whether the web app should always be on or not"
}

variable "minimum_tls_version" {
    type = string
    description = "The minimum TLS version required"
}
variable "linux_fx_version" {
    type = string
    description = "The runtime version to run on the linux web app"
}

variable "tier" {
    type = string
    description = "The Tier of the subscription (Free, Shared, Basic etc)"
}

variable "size" {
    type = string
    description = "The size of the web app (F1, B1 etc)"
}

variable "zip_deploy_file" {
    type = string
    description = "The zip file used to deploy the web app"
}