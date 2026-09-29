output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "workspace_name" {
  value = azurerm_log_analytics_workspace.law.name
}
