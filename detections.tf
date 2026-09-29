locals {
  detection_rules = {
    rg_deleted = {
      display_name = "Resource group deleted"
      description  = "Alerts when any resource group is deleted in the subscription. MITRE ATT&CK: Impact (T1485 Data Destruction)."
      severity     = "Medium"
      tactics      = ["Impact"]
    }
    role_assignment_sub = {
      display_name = "Role assignment created at subscription scope"
      description  = "Alerts when an RBAC role is assigned at subscription scope. MITRE ATT&CK: Privilege Escalation / Persistence (T1098 Account Manipulation)."
      severity     = "High"
      tactics      = ["PrivilegeEscalation", "Persistence"]
    }
    keyvault_permission_change = {
      display_name = "Key Vault permission change"
      description  = "Alerts on Key Vault changes made outside Terraform (access policies log as VAULTS/WRITE) or RBAC grants on a vault. MITRE ATT&CK: Credential Access / Persistence (T1098)."
      severity     = "High"
      tactics      = ["CredentialAccess", "Persistence"]
    }
  }
}

module "detection_rule" {
  source   = "./modules/detection-rule"
  for_each = local.detection_rules

  workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
  name         = replace(each.key, "_", "-")
  display_name = each.value.display_name
  description  = each.value.description
  severity     = each.value.severity
  tactics      = each.value.tactics
  query        = file("${path.module}/rules/${each.key}.kql")
}
