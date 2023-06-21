# login to Azure
az login

## Check azureSubscription
az account list -o table

## Select defaultSubscription if you have multiple subscriptions
az account set --subscription mysubscription

## Create Resource Group for the deployment
az group create -l westus -n AzHourBicepDemo


## use whatIf to verify the deployment:
az deployment group what-if --resource-group AzHourBicepDemo --template-file az-hour-bicep-demo.bicep --parameters az-hour-bicep-demo.bicepparam

## Azure Bicep Deployment
az deployment group create --resource-group AzHourBicepDemo --template-file az-hour-bicep-demo.bicep --parameters az-hour-bicep-demo.bicepparam
