data "azurerm_resource_group" "azure_adls_rs" {
  name = var.resource_group
}

resource "azurerm_storage_account" "storage_account" {
  name                              = var.storage_account_name
  resource_group_name               = data.azurerm_resource_group.azure_adls_rs.name
  location                          = data.azurerm_resource_group.azure_adls_rs.location
  account_kind                      = "StorageV2"
  account_tier                      = var.account_tier
  account_replication_type          = var.account_replication_type
  access_tier                       = var.access_tier
  is_hns_enabled                    = true
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  allow_nested_items_to_be_public   = var.allow_nested_items_to_be_public

  tags = {
    domain                = var.dp_domain
    dp_name_major_version = var.dp_name_major_version
    component_name        = var.component_name
  }
}

locals {
  containers_array       = compact(split(",", var.containers))
  owner_principals_array = split(",", var.ownerPrincipals)
  owners_roles = [
    for pair in setproduct(local.owner_principals_array, ["Storage Blob Data Owner", "Reader"]) : {
      owner = pair[0]
      role  = pair[1]
    }
  ]
}

resource "azurerm_storage_data_lake_gen2_filesystem" "filesystem" {
  for_each           = toset(local.containers_array)
  name               = each.key
  storage_account_id = azurerm_storage_account.storage_account.id
}

resource "azurerm_role_assignment" "role_assignments" {
  scope                = azurerm_storage_account.storage_account.id
  role_definition_name = each.value.role
  for_each = tomap({
    for entry in local.owners_roles : "${entry.owner}.${entry.role}" => entry
  })
  principal_id = each.value.owner
}
