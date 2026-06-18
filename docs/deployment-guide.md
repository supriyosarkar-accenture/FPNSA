# Deployment Guide

## Prerequisites

- Azure subscription
- Azure CLI
- Terraform 1.5+
- Azure Functions Core Tools
- Visual Studio Code
- Git

## Deployment Steps

1. Clone the repository:

```bash
git clone https://github.com/supriyosarkar-accenture/FPNSA.git
cd FPNSA
```

2. Change into the Terraform folder:

```bash
cd terraform
```

3. Initialize Terraform:

```bash
terraform init
```

4. Create a `terraform.tfvars` file with values for required variables:

```hcl
resource_group_name = "fpnsa-rg"
storage_account_name = "fpnsastorage001"
function_storage_account_name = "fpnsafuncstorage001"
servicebus_namespace_name = "fpnsasbns001"
function_app_name = "fpnsa-function-app"
logic_app_name = "fpnsa-logic-app"
key_vault_name = "fpnsa-keyvault"
app_insights_name = "fpnsa-ai"
log_analytics_name = "fpnsa-law"
```

5. Plan and apply:

```bash
terraform plan
terraform apply
```

6. After deployment, configure application settings in Azure Function App and update Logic App connections.

## Local Development

1. Copy `function-app/local.settings.json.example` to `function-app/local.settings.json`.
2. Populate `AzureWebJobsStorage` and `ServiceBusConnection`.
3. Start the function locally:

```bash
cd function-app
func start
```
