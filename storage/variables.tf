variable "name" {
    type = string
    description = "Name of the blob container."
}

variable "resource_group_name" {
    type = string
    description = "The resource group for the resource."
}

variable "location" {
    type = string
    description = "Azure region to use for deployment. To get the list of all locations with table format from Az CLI, run #az account list-locations -o table'."
}

variable "account_tier" {
    type = string
    description = "The SKU of the SA. Standard or Premium usually."
}

variable "allow_blob_public_access" {
    type = bool
    description = "Dictates if access to the Blob is public or private."
}

variable "account_replication_type" {
    type = string
    description = "LRS, ZRS, or GRS."
}

variable "account_type" {
    type = string
    description = "The type of Storage of the SA. Typically StorageV2 or Blob."
}

variable "access_tier" {
    type = string
    description = "Hot, Cool, or Archive."
}

variable "designer" {
    type = string
    description = "Who designed the deployment."
    default = "Rupert Langford"
}

variable "container_name" {
    type = string
    description = "The name of the storage container"
}

variable "source" {
    type = string
    description = "The location of the file to upload"
}

variable "container_access_type" {
    type = string
    description = "The container access type (blob, container, or private)"
}

variable "type" {
    type = string
    description = "The type of blob (Append, Block, or Page)"
}