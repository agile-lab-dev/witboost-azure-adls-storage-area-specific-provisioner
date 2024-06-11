variable "resource_group" {
  type        = string
  description = "The name of the resource group in which to create the storage account"
}

variable "account_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium"
}

variable "account_replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
}

variable "access_tier" {
  type        = string
  description = "Defines the access tier. Valid options are Hot and Cool"
}

variable "infrastructure_encryption_enabled" {
  type        = bool
  description = "Determine if infrastructure encryption is enabled"
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "Allow or disallow nested items within this Account to opt into being public"
}

variable "containers" {
  type        = list(string)
  description = "The names of the Data Lake Gen2 File Systems which should be created within the Storage Account"
}

variable "ownerPrincipals" {
  type        = string
  description = "The identities that own the Data Product"
  default     = ""
}

variable "dp_domain" {
  type        = string
  description = "The domain to which the DP belongs"
}

variable "dp_name_major_version" {
  type        = string
  description = "The DP name and major version to which the component belongs"
}

variable "component_name" {
  type        = string
  description = "The Witboost component name"
}

variable "environment" {
  type        = string
  description = "The deployment environment"
}
