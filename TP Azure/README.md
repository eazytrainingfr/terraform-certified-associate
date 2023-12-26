#### Configure your environment

1. Prerequise:  
Azure Subscription  
Azure CLI  
2. Authenticate Terraform to Azure  
<h1>Authenticate to Azure via a Microsoft account:</h1>
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