variable "resource_group_name" {
  description = "Name of the resource group where the resources will be created."
  type        = string
}

variable "action_group_name" {
  description = "The name of the action group."
  type        = string
}

variable "action_group_short_name" {
  description = "The short name of the action group."
  type        = string
}

variable "action_group_email_receivers" {
  description = "List of email recipients for the alert."
  type        = list(object({ name = string, email_address = string }))
}

variable "alert_name" {
  description = "The name of the alert."
  type        = string
}
