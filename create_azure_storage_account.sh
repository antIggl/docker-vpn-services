# Change these four parameters as needed
ACI_PERS_RESOURCE_GROUP=EMBIO-monitoring-apps
ACI_PERS_STORAGE_ACCOUNT_NAME=embiomonstoreacc$RANDOM
ACI_PERS_LOCATION=westeurope
ACI_PERS_SHARE_NAME=embiomondatashare

# Create the storage account with the parameters
az storage account create \
    --resource-group $ACI_PERS_RESOURCE_GROUP \
    --name $ACI_PERS_STORAGE_ACCOUNT_NAME \
    --location $ACI_PERS_LOCATION \
    --sku Standard_LRS

# Create the file share
az storage share create \
  --name $ACI_PERS_SHARE_NAME \
  --account-name $ACI_PERS_STORAGE_ACCOUNT_NAME
