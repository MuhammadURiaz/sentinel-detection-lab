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

resource "azurerm_sentinel_alert_rule_scheduled" "role_assignment_sub" {
  name                       = "role-assignment-sub"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
  display_name               = "Role assignment created at subscription scope"
  description                = "Alerts when an RBAC role is assigned at subscription scope. MITRE ATT&CK: Privilege Escalation / Persistence (T1098 Account Manipulation)."
  severity                   = "High"
  query                      = file("${path.module}/rules/role_assignment_sub.kql")
  query_frequency            = "PT15M"
  query_period               = "PT30M"
  tactics                    = ["PrivilegeEscalation", "Persistence"]

  event_grouping {
    aggregation_method = "SingleAlert"
  }
}

resource "azurerm_sentinel_alert_rule_scheduled" "keyvault_permission_change" {
  name                       = "keyvault-permission-change"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
  display_name               = "Key Vault permission change"
  description                = "Alerts when Key Vault access is changed via access policy or an RBAC role assignment on a vault. MITRE ATT&CK: Credential Access / Persistence (T1098)."
  severity                   = "High"
  query                      = file("${path.module}/rules/keyvault_permission_change.kql")
  query_frequency            = "PT15M"
  query_period               = "PT30M"
  tactics                    = ["CredentialAccess", "Persistence"]

  event_grouping {
    aggregation_method = "SingleAlert"
  }
}
