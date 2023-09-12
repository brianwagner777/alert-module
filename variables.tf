variable "resource_group_name" {
  description = "Name of the resource group where the resources will be created."
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all created resources."
  default     = {}
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

variable "alert_description" {
  description = "The description of the alert rule."
  type        = string
}

variable "alert_enabled" {
  description = "Indicates whether the alert is enabled. Value should be true or false."
  type        = bool
  default     = true
}

variable "alert_evaluation_frequency" {
  description = "How often the alert rule is evaluated, represented in ISO 8601 duration format."
  type        = string
}

variable "alert_window_duration" {
  description = "The period of time in ISO 8601 duration format on which the alert rule will be executed."
  type        = string
}

variable "alert_severity" {
  description = "Severity of the alert, an integer between 0 and 4, with 0 being the most severe."
  type        = number
}

variable "alert_scope_resource_id" {
  description = "The resource ID that the alert rule is scoped to."
  type        = string
}

variable "alert_criteria_query" {
  description = "The query to run on logs."
  type        = string
}

variable "alert_criteria_time_aggregation_method" {
  description = "The type of aggregation to apply to the data points in aggregation granularity. Possible values are Average, Count, Maximum, Minimum, and Total."
  type        = string
}

variable "alert_criteria_threshold" {
  description = "The criteria threshold value that activates the alert."
  type        = number
}

variable "alert_criteria_operator" {
  description = "The criteria operator. Possible values are Equal, GreaterThan, GreaterThanOrEqual, LessThan, and LessThanOrEqual."
  type        = string
}
