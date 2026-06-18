# File Processing and Notification System on Azure

An event-driven, serverless solution built on Microsoft Azure that automatically processes uploaded files and triggers notifications across multiple channels.

This project demonstrates how to integrate Azure services such as Azure Functions, Logic Apps, Event Grid, and Service Bus using Infrastructure as Code and CI/CD practices.

---

## Architecture

![Architecture Diagram](./assets/architecture.png)

### Workflow

1. User uploads a file to Azure Blob Storage.
2. Blob Storage emits an event.
3. Event Grid routes the event to Azure Function App.
4. Function App processes the file metadata and publishes a message to Azure Service Bus.
5. Logic App consumes the message from Service Bus.
6. Logic App sends notifications and optionally persists processing details.

```text
User
  │
  ▼
Blob Storage
  │
  ▼
Event Grid
  │
  ▼
Azure Function App
  │
  ▼
Service Bus Queue
  │
  ▼
Logic App
  ├──► Microsoft Teams
  ├──► Email
  ├──► Webhook
  └──► Cosmos DB / SQL Database (Optional)
```

---

## Use Cases

* Document ingestion and processing
* Automated business workflows
* Event-driven notifications
* System-to-system integrations
* IT operations and alerting
* Approval workflows

---

## Azure Services Used

| Service                 | Purpose                                  |
| ----------------------- | ---------------------------------------- |
| Azure Storage Account   | Stores uploaded files                    |
| Azure Event Grid        | Routes storage events                    |
| Azure Function App      | Processes file metadata                  |
| Azure Service Bus       | Provides reliable asynchronous messaging |
| Azure Logic Apps        | Orchestrates workflows and notifications |
| Azure Key Vault         | Stores secrets and connection strings    |
| Application Insights    | Captures telemetry and traces            |
| Log Analytics Workspace | Centralized logging and analytics        |
| Azure Monitor           | Dashboards and alerting                  |
| Microsoft Entra ID      | Authentication and managed identities    |

---

## Repository Structure

```text
.
├── assets/
│   └── architecture.png
│
├── docs/
│   ├── deployment-guide.md
│   └── troubleshooting.md
│
├── function-app/
│   ├── src/
│   ├── tests/
│   ├── host.json
│   └── requirements.txt
│
├── logic-app/
│   └── workflow.json
│
├── pipelines/
│   ├── azure-pipelines.yml
│   └── github-actions.yml
│
├── terraform/
│   ├── environments/
│   │   └── dev/
│   │       ├── backend.tf
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       ├── terraform.tfvars
│   │       └── variables.tf
│   └── modules/
│       ├── app_insights/
│       ├── event_grid/
│       ├── function_app/
│       ├── key_vault/
│       ├── logic_app/
│       ├── monitor/
│       ├── resource_group/
│       ├── service_bus/
│       └── storage_account/
│
└── README.md
```

---

## Prerequisites

* Azure subscription
* Azure CLI
* Terraform 1.5+
* Azure Functions Core Tools
* Visual Studio Code
* Git

---

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/supriyosarkar-accenture/FPNSA.git

cd FPNSA
```

### Authenticate with Azure

```bash
az login
```

### Deploy Infrastructure

```bash
cd terraform

terraform init

terraform plan

terraform apply
```

The Terraform deployment provisions:

* Resource Group
* Storage Account
* Event Grid Subscription
* Function App
* Service Bus Namespace and Queue
* Logic App
* Key Vault
* Application Insights
* Log Analytics Workspace

---

## Local Development

Create a `local.settings.json` file inside the `function-app` directory.

```json
{
  "IsEncrypted": false,
  "Values": {
    "AzureWebJobsStorage": "<storage-connection-string>",
    "ServiceBusConnection": "<service-bus-connection-string>"
  }
}
```

Start the Function App locally:

```bash
func start
```

---

## CI/CD

This project supports automated deployments using:

* Azure DevOps Pipelines
* GitHub Actions

Typical pipeline stages:

1. Validate Terraform
2. Run linting and security checks
3. Deploy infrastructure
4. Build Function App
5. Deploy application code
6. Deploy Logic App workflow
7. Run smoke tests

---

## Monitoring and Observability

The solution uses:

* Application Insights
* Log Analytics Workspace
* Azure Monitor Alerts

Key metrics:

* Function execution duration
* Queue depth
* Failed workflow runs
* Dead-letter queue count
* End-to-end processing latency

---

## Security Best Practices

* Managed identities instead of secrets
* Secrets stored in Azure Key Vault
* Role-based access control (RBAC)
* Least-privilege access model
* Environment-specific configurations

---

## Future Enhancements

* Virus scanning for uploaded files
* AI-powered document classification
* API Management integration
* Durable Functions orchestration
* Multi-environment deployments
* Private endpoints
* Dead-letter queue handling

