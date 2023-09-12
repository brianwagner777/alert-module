# Create the Action Group
resource "azurerm_monitor_action_group" "action_group" {
  name                = var.action_group_name
  resource_group_name = data.azurerm_resource_group.main.name
  short_name          = var.action_group_short_name
  tags                = var.tags

  dynamic "email_receiver" {
    for_each = var.action_group_email_receivers
    content {
      name                    = email_receiver.value["name"]
      email_address           = email_receiver.value["email_address"]
      use_common_alert_schema = true
    }
  }
}

# Create the Scheduled Query Alert Rule (log alert)
resource "azurerm_monitor_scheduled_query_rules_alert_v2" "alert_rule" {
  name                = var.alert_name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  description         = var.alert_description
  enabled             = var.alert_enabled
  display_name        = var.alert_name
  tags                = var.tags

  evaluation_frequency = var.alert_evaluation_frequency
  window_duration      = var.alert_window_duration
  scopes               = [var.alert_scope_resource_id]
  severity             = var.alert_severity
  criteria {
    query                   = var.alert_criteria_query
    time_aggregation_method = var.alert_criteria_time_aggregation_method
    threshold               = var.alert_criteria_threshold
    operator                = var.alert_criteria_operator
    failing_periods {
      minimum_failing_periods_to_trigger_alert = 1
      number_of_evaluation_periods             = 1
    }
  }

  auto_mitigation_enabled          = false
  workspace_alerts_storage_enabled = false
  skip_query_validation            = true
  action {
    action_groups = [azurerm_monitor_action_group.action_group.id]
  }

  lifecycle {
    ignore_changes = [
      enabled
    ]
  }
}

