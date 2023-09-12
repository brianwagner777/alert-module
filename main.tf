# Create the action group
resource "azurerm_monitor_action_group" "action_group" {
  name                = var.action_group.name
  resource_group_name = azurerm_resource_group.dh_integration_sfl.name
  short_name          = "DHSFLLogFail"
  tags                = local.tags

  dynamic "email_receiver" {
    for_each = var.log_fail_alert.receivers
    content {
      name                    = email_receiver.value["name"]
      email_address           = email_receiver.value["email_address"]
      use_common_alert_schema = true
    }
  }
}
