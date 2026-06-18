# Troubleshooting

## Function App

- `AzureWebJobsStorage` missing or invalid
  - Verify that the storage connection string is correct in `local.settings.json` or Azure Function App settings.

- `ServiceBusConnection` errors
  - Confirm the Service Bus namespace connection string uses a valid authorization rule with `Send` permissions.

- Event Grid trigger not firing
  - Ensure the Function App has an Event Grid trigger binding and that the Event Grid subscription points to the correct function.

## Logic App

- Logic App fails to receive messages
  - Confirm the Service Bus queue name and connection are correct.
  - Verify network access and service endpoint permissions.

- Teams/email notifications fail
  - Check connector configuration in Logic App.
  - Confirm OAuth tokens or service principal permissions are valid.

## Terraform

- `terraform init` fails
  - Confirm Terraform version is 1.5+.
  - Ensure access to the Azure provider registry.

- `terraform apply` fails with resource conflicts
  - Validate unique resource names for storage accounts and Service Bus namespace.

## Monitoring

- Check Application Insights for function exceptions.
- Review Azure Monitor alerts for queue depth and workflow failures.
