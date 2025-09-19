resource "azurerm_monitor_autoscale_setting" "autoscale" {
  name                = "${var.vmss_name}-autoscale"
  resource_group_name = var.rg_name
  location            = var.location
  target_resource_id  = data.azurerm_virtual_machine_scale_set.vmss.id

  profile {
    name = "default"

    capacity {
      minimum = "1"
      maximum = "5"
      default = "1"
    }

    # Scale out
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = data.azurerm_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 70
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }

    # Scale in
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = data.azurerm_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 30
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
  }
}