# Azure Unleashed
Artifacts for the Azure Unleashed Sessions - reference architecture and guidance of moving a real word application into Azure and modernizing it

1. Fabrikam Bookstore

    This is a bookstore application. Built in PHP using the Laravel Framework. Backend is a MySQL Database.

    Details on how to setup the initial bookstore app are [here](Fabrikam-Bookstore/readme.md)
    
## Kubernetes Setup  
The following steps will run through the process of creating a Kubernetes cluster on Azure Container Service using the Azure CLI 2.0

1) SSH into your VM `ssh <username>@<PublicIP>`
2) Login to Azure via the CLI using `az login`
3) Define bash variables for your resource group and deployment location. (Note: If you with to place everything in the same resource group as your Lab VM, then set that resource group name here.)
    rg=<Resource Group Name>
    loc=<Location - ex. eastus2>
4) Create the resource group, if not reusing from your LabVM deployment
    az group create --name=$rg --location=$loc
5) Generate an ssh key, using all defaults
    ssh-keygen

##########################################
# Create Kubernetes Cluster
##########################################

dnsprefix=<Some Unique Name>

az acs create --orchestrator-type=kubernetes --resource-group=$rg --name=$dnsprefix --dns-prefix=$dnsprefix

sudo az acs kubernetes install-cli

az acs kubernetes get-credentials --resource-group=$rg --name=$dnsprefix

kubectl get nodes

##########################################
# Create Azure Container Registry
##########################################
registryname=<Registry Name>
az acr create -n $registryname -g $rg -l $loc --sku Basic

# Setting admin mode for authentication. (Not recommended for production) 
az acr update -n $registryname --admin-enabled true

##########################################
# Build and Push Docker Image
#
# First retrieve registry credentials from 
# Azure portal under 'Access Keys' in your
# registry.
##########################################
cd /var/www/azureunleashed

docker login <registry login server>

docker build -t <registry login server>/bookstore .
docker push <registry login server>/bookstore

##########################################
# Deploy Bookstore to Kubernetes
##########################################

kubectl create secret docker-registry regsecret --docker-server=<registry login server> --docker-username=<registry username> --docker-password=<registry password> --docker-email=<your-email>

#Edit the bookstore.yaml file updating with your container name <registry login server>/bookstore

kubectl create -f bookstore.yaml
kubectl get pods

kubectl expose deployments bookstore --port=80 --type=LoadBalancer
watch 'kubectl get svc'


##########################################
# MySQL in a container
##########################################

#create mysql password for root
kubectl create secret generic mysql --from-literal=password=YOUR_PASSWORD

#create an empty disk in an azure storage account for mysql mounting
docker pull docker.io/colemickens/azure-tools:latest
docker run -it docker.io/colemickens/azure-tools:latest

# (inside the container)

export AZURE_SUBSCRIPTION_ID=<your_subscription_id>
export AZURE_RESOURCE_GROUP=<resource_group_name>
export AZURE_STORAGE_ACCOUNT=<name_of_storage_account>
export AZURE_STORAGE_CONTAINER=<vhd_container_name>
export IMAGE_SIZE=10G
export AZURE_LOCATION=westus

./make-vhd.sh
# VHD_URL=https://colemickvhds2.blob.core.windows.net/colemickvhds2/data-disk-082916103645.vhd
# (end)


#update bookstore-mysql.yaml replacing storage account name and vhd url
#update .env under Fabrikam-Bookstore to the following:
#set servername to mysqlpod
#set user to root
#set password to the one you set earlier


#remove bookstore deployments
kubectl delete deployment bookstore

#repush updated app

docker build -t <registry login server>/bookstore .
docker push <registry login server>/bookstore

kubectl create -f bookstore-mysql.yaml
kubectl get pods


