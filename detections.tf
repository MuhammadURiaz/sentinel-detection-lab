resource "azurerm_sentinel_alert_rule_scheduled" "rg_deleted" {
  name                       = "rg-deleted"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
  display_name               = "Resource group deleted"
  description                = "Alerts when any resource group is deleted in the subscription. MITRE ATT&CK: Impact (T1485 Data Destruction)."
  severity                   = "Medium"
  query                      = file("${path.module}/rules/rg_deleted.kql")
  query_frequency            = "PT15M"
  query_period               = "PT30M"
  tactics                    = ["Impact"]

  event_grouping {
    aggregation_method = "SingleAlert"
  }
}
