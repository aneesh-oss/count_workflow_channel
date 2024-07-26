resource "newrelic_notification_destination" "webhook_destination" {
  count = length(var.webhook_urls)

  name = "Webhook Destination ${count.index + 1}"
  type = "WEBHOOK"

  property {
    key   = "url"
    value = var.webhook_urls[count.index]
  }
}
resource "newrelic_notification_channel" "webhook_channel" {
  count = length(var.webhook_urls)

  name           = "Webhook Channel ${count.index + 1}"
  type           = "WEBHOOK"
  product        = "IINT"
  destination_id = newrelic_notification_destination.webhook_destination[count.index].id

  property {
    key   = "payload"
    value = "{}"
    label = "Payload Template"
  }

}

resource "newrelic_workflow" "example_workflow" {
  name                  = var.workflow_name
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = var.filter_name
    type = "FILTER"

    predicate {
      attribute = var.filter_attribute
      operator  = var.filter_operator
      values    = var.filter_values
    }
  }

  dynamic "destination" {
    for_each = newrelic_notification_channel.webhook_channel
    content {
      channel_id = destination.value.id
    }
  }
}
