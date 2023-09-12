output "result" {
  description = "Schedule query alert rule with all attributes."
  value       = azurerm_monitor_scheduled_query_rules_alert_v2.alert_rule
}
