variable "account_id" {
  description = "New Relic account ID"
  type        = number
}
variable "api_key" {
  description = "user api_key"
  type        = string
}

variable "region" {
  description = "Newrelic region"
  type        = string
}
variable "webhook_urls" {
  description = "List of webhook URLs for notifications"
  type        = list(string)
}

variable "workflow_name" {
  description = "Name of the workflow"
  type        = string
  default     = "workflow-example"
}

variable "filter_name" {
  description = "Name of the filter"
  type        = string
  default     = "filter-name"
}

variable "filter_attribute" {
  description = "Attribute for filter predicate"
  type        = string
  default     = "accumulations.tag.team"
}

variable "filter_operator" {
  description = "Operator for filter predicate"
  type        = string
  default     = "EXACTLY_MATCHES"
}

variable "filter_values" {
  description = "Values for filter predicate"
  type        = list(string)
  default     = ["growth"]
}
