# Azure Unleashed
Artifacts for the Azure Unleashed Sessions - reference architecture and guidance of moving a real word application into Azure and modernizing it

1. Fabrikam Bookstore

    This is a bookstore application. Built in PHP using the Laravel Framework. Backend is a MySQL Database.

    Details on how to setup the initial bookstore app are [here](Fabrikam-Bookstore/readme.md)
    
## Kubernetes Setup  
The following steps will run through the process of creating a Kubernetes cluster on Azure Container Service using the Azure CLI 2.0

1) SSH into your VM `ssh <username>@<PublicIP>`
2) Login to Azure via the CLI using `az login`
3) Define bash variables for your resource group, cluster DNS name and deployment location. (Note: If you with to place everything in the same resource group as your Lab VM, then set that resource group name here.)
```
$rg=<Resource Group Name>
$dnsprefix=<Some Unique Name>
$loc=<Location - ex. eastus2>
```
4) Create the resource group, if not reusing from your LabVM deployment
```    
az group create --name=$rg --location=$loc
```
5) Generate an ssh key, using all defaults
```
ssh-keygen
```
6) Create the cluster
```
az acs create --orchestrator-type=kubernetes --resource-group=$rg --name=$dnsprefix --dns-prefix=$dnsprefix
```
7) Install the kuberenetes command line (kubectl)
```
$sudo az acs kubernetes install-cli
```
8) Get your kubernetes cluster credentials from ACS
```
az acs kubernetes get-credentials --resource-group=$rg --name=$dnsprefix
```
9) Test that your cluster is working
```
kubectl get nodes
```

## Create an Azure Container Registry
The following steps will walk you through the setup of an Azure Container Registry. ACR is a private container registry which we will use to store (push) and retrieve (pull) the bookstore container image. For our purposes we will enable the admin password, which will be more straight forward for this lab, however in production you would likely leverage a service principal instead. 

Note: The following steps assume you're in the same termal session as the prior section. If you have exited you will need to set the variables noted in the kuberentes setup again.

 1) Set the variable used for the Azure Container Registry name
```
$registryname=<Registry Name>
```
2) Execute the CLI call to create the registry
```
$az acr create -n $registryname -g $rg -l $loc --sku Basic
```
3) Enable admin mode to allow the use of the admin password rather than using a service principal
```
$az acr update -n $registryname --admin-enabled true
```

## Build and Push Docker Image
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


