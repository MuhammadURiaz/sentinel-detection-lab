# New GUID per build, so a rebuild never collides with a recently deleted rule ID
resource "random_uuid" "rule_id" {}

resource "azurerm_sentinel_alert_rule_scheduled" "this" {
  name                       = random_uuid.rule_id.result
  log_analytics_workspace_id = var.workspace_id
  display_name               = var.display_name
  description                = var.description
  severity                   = var.severity
  query                      = var.query
  query_frequency            = var.query_frequency
  query_period               = var.query_period
  tactics                    = var.tactics

  event_grouping {
    aggregation_method = "SingleAlert"
  }
}

output "id" {
  value = azurerm_sentinel_alert_rule_scheduled.this.id
}
