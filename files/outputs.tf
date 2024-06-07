output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}

output "container_ids" {
  value = join(",", [for fs in azurerm_storage_data_lake_gen2_filesystem.filesystem : fs.id])
}

output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}
