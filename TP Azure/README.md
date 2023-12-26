<h1>Configure your environment</h1>

1. Prerequise:  
Azure Subscription  
Azure CLI  

2. Authenticate Terraform to Azure  

<h3>Authenticate to Azure via a Microsoft account:</h3>


* Open a command line that has access to the Azure CLI

* Run az login without any parameters and follow the instructions to sign in to Azure.
```sh
az login
``` 

* To confirm the current Azure subscription, run az account show.
```sh
az account show
``` 

* To view all the Azure subscription names and IDs for a specific Microsoft account, run az account list.
```sh
az account list --query "[?user.name=='your_microsoft_account_email'].{Name:name, ID:id, Default:isDefault}" --output Table
``` 

* To use a specific Azure subscription, run az account set.
```sh
az account set --subscription "your_subscription_id_or_your_subscription_name"
``` 

<h3>Create a service principal</h3>

* If you're creating a service principal from Git Bash, set the MSYS_NO_PATHCONV environment variable.
```sh
export MSYS_NO_PATHCONV=1
``` 

* To create a service principal, run az ad sp create-for-rbac
```sh
az ad sp create-for-rbac --name your_service_principal_name --role Contributor --scopes /subscriptions/your_subscription_id
``` 
Upon successful completion, az ad sp create-for-rbac displays several values. The appId, password, and tenant values are used in the next step

* Once you create a service principal, you can specify its credentials to Terraform via environment variables.
```sh
export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
export ARM_TENANT_ID="<azure_subscription_tenant_id>"
export ARM_CLIENT_ID="<service_principal_appid>"
export ARM_CLIENT_SECRET="<service_principal_password>"
``` 

* To execute the ~/.bashrc script, run source ~/.bashrc (or its abbreviated equivalent . ~/.bashrc).
```sh
. ~/.bashrc
``` 

* Once the environment variables have been set, you can verify their values as follows:
```sh
printenv | grep ^ARM*
``` 
As with any environment variable, to access an Azure subscription value from within a Terraform script, use the following syntax: ${env.<environment_variable>}. For example, to access the ARM_SUBSCRIPTION_ID value, specify ${env.ARM_SUBSCRIPTION_ID}.

* Specify service principal credentials in a Terraform provider block
```sh
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = "<azure_subscription_id>"
  tenant_id         = "<azure_subscription_tenant_id>"
  client_id         = "<service_principal_appid>"
  client_secret     = "<service_principal_password>"
}

# Your code goes here
``` 
The ability to specify your Azure subscription credentials in a Terraform configuration file can be convenient - especially when testing. However, it isn't advisable to store credentials in a clear-text file that can be viewed by non-trusted individuals.