# Azure Unleashed
Artifacts for the Azure Unleashed Sessions - reference architecture and guidance of moving a real word application into Azure and modernizing it

1. Fabrikam Bookstore

    This is a bookstore application. Built in PHP using the Laravel Framework. Backend is a MySQL Database.

    Details on how to setup the initial bookstore app are [here](Fabrikam-Bookstore/readme.md)

## Deploy Lab VM
This template will deploy the lab vm with all required components pre-installed (git, docker, azure cli 2.0, etc)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjodehavi%2Fazureunleashed%2Fmaster%2FLabVMSetup%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>


   
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
The following steps will walk you through the process of building a container image using a Dockerfile, and then pushing that image to the private repository you created in the previous section.

1) Log into your Azure portal, go to your resource group, select your container registry and then select the 'Access Keys' pane. You should see all of the credential information needed for the following steps.
2) Change directories into the bookstore application directory
```
$cd /var/www/azureunleashed
```
3) Login to your private repository using the login server, user ID and password from the 'Access Keys' pane in your ACR portal
```
$docker login <registry login server>
```
4) Review the DockerFile file in the application folder. This is the file Docker will use to build the container image.
5) Execute the `docker build` command to build your container image. Note: The first part of the container image name MUST be your container registry fully qualified name (i.e. myregistry.azurecr.io)
```
$docker build -t <registry login server>/bookstore .
```
6) Push your newly created image to your private Azure Container Registry
```
$docker push <registry login server>/bookstore
```

## Deploy Bookstore to Kubernetes
The following steps will walk you through deployment of your container image into your kubernetes cluster. As we are using a private container registry, you will need to first tell kubernetes the credentials for that registry using the `kubectl create secret` command. You will then reference that secret in the yaml file used for the deployment.

1) Create the secret on your kuberentes cluster containing your container registry credentials
```
$kubectl create secret docker-registry regsecret --docker-server=<registry login server> --docker-username=<registry username> --docker-password=<registry password> --docker-email=<your-email>
```
2) In the application folder you shoudl see a file named `bookstore.yaml`. This is the file that describes to kubernetes what we want to deploy. Mofify (`sudo nano bookstore.yaml` or `sudo vi bookstore.yaml`) this file so that the `image` name matches your registry name (i.e. `<registry login server>/bookstore`)
3) Execute `kubectl create` to create the deployment
```
$kubectl create -f bookstore.yaml
```
4) Verify that the deployment completed.
```
$kubectl get pods
or
$watch 'kubectl get pods'
```
5) Use `kubectl expose` to expose your deployment through the kuberentes integrated Azure Load Balancer
```
$kubectl expose deployments bookstore --port=80 --type=LoadBalancer
```
6) Watch the deployment to see the public IP populate. This may take a few minutes
```
$watch 'kubectl get svc'
```
7) Go to a browser and navigate to the public IP address from step 6

## MySQL in a container
The following steps will walk you through the process of moving the MySQL DB into a container and deploying it to your kubernetes cluster

1) Create mysql password for root
```
kubectl create secret generic mysql --from-literal=password=YOUR_PASSWORD
```

2) Create an empty disk in an azure storage account for mysql mounting
```
docker pull docker.io/colemickens/azure-tools:latest
docker run -it docker.io/colemickens/azure-tools:latest bash
```
3) Execute the following commands inside the container
```
export AZURE_SUBSCRIPTION_ID=<your_subscription_id>
export AZURE_RESOURCE_GROUP=<resource_group_name>
export AZURE_STORAGE_ACCOUNT=<name_of_storage_account>
export AZURE_STORAGE_CONTAINER=<vhd_container_name>
export IMAGE_SIZE=10G
export AZURE_LOCATION=westus

./make-vhd.sh
# VHD_URL=https://colemickvhds2.blob.core.windows.net/colemickvhds2/data-disk-082916103645.vhd
# (end)
```
4) Update bookstore-mysql.yaml replacing storage account name and vhd url
5) Update .env under Fabrikam-Bookstore to the following:
6) Set servername to mysqlpod
7) Set user to root
8) Set password to the one you set earlier
9) Remove bookstore deployments
```
kubectl delete deployment bookstore
```
10) Repush updated app
```
docker build -t <registry login server>/bookstore .
docker push <registry login server>/bookstore
```
11) Deploy the bookstore with MySQL to your cluster
```
kubectl create -f bookstore-mysql.yaml
kubectl get pods
```

