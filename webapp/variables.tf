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
    description "The plan tier"
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