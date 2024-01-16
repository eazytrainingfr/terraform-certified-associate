<h1>Config</h1>

## env
```sh
$RESOURCE_GROUP_NAME='tfstateRG01'
$STORAGE_ACCOUNT_NAME="tfstate01$(get-random)"
$CONTAINER_NAME='tfstate'
```

## Create resource group
```sh
az group create --name $RESOURCE_GROUP_NAME --location francecentral
``` 

## Create storage account
```sh
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --sku Standard_LRS --encryption-services blob
``` 

## Create blob container
```sh
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
``` 

## Get th storage access key and store it as an environment variable
```sh
$ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME  --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
$env:ARM_ACCESS_KEY=$ACCOUNT_KEY
```