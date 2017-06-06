# Azure Unleashed
Artifacts for the Azure Unleashed Session - Containerize your application. Guidance of moving an application into Azure via containers.

The app is called Fabrikam Bookstore. This is a bookstore application that is relatively simple. It lists books and allows users to purchase them. Built in PHP using the Laravel Framework. Backend is a MySQL Database.

Details on how to setup the initial bookstore app locally are [here](Fabrikam-Bookstore/readme.md)

## Deploy Lab VM
This template will deploy the lab vm with all required components pre-installed (git, docker, azure cli 2.0, etc)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjodehavi%2Fazureunleashed%2Fmaster%2FLabVMSetup%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

When this is complete do the following steps:

1) SSH into your VM `ssh <username>@<PublicIP>`
2) `cd /var/www/azureunleashed/Fabrikam-Bookstore`
3) `sudo php artisan serve --host=0.0.0.0`
4) Browse to the site at <publicip>:8000
   
## Kubernetes Setup  
The following steps will run through the process of creating a Kubernetes cluster on Azure Container Service using the Azure CLI 2.0

1) SSH into your VM `ssh <username>@<PublicIP>`
2) Login to Azure via the CLI using `az login`
3) Define bash variables for your resource group, cluster DNS name and deployment location. (**Note**: If you wish to place everything in the same resource group as your Lab VM, then set that resource group name here.)
```
rg=<Resource Group Name>
dnsprefix=<Some Unique Name>
loc=<Location - ex. eastus2>
```
4) Create the resource group, if not reusing from your LabVM deployment. If reusing, then this step can be skipped.
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
7) Install the kuberenetes command line `kubectl` (**Note:** This will take around 5 minutes to complete)
```
sudo az acs kubernetes install-cli
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

**Note**: The following steps assume you're in the same termal session as the prior section. If you have exited you will need to set the variables noted in the kuberentes setup again.

 1) Set the variable used for the Azure Container Registry name
```
registryname=<Registry Name>
```
2) Execute the CLI call to create the registry
```
az acr create -n $registryname -g $rg -l $loc --sku Basic
```
3) Enable admin mode to allow the use of the admin password rather than using a service principal
```
az acr update -n $registryname --admin-enabled true
```

## Build and Push Docker Image
The following steps will walk you through the process of building a container image using a Dockerfile, and then pushing that image to the private repository you created in the previous section.

1) Log into your Azure portal, go to your resource group, select your container registry and then select the 'Access Keys' pane. You should see all of the credential information needed for the following steps.
2) Change directories into the bookstore application directory
```
cd /var/www/azureunleashed
```
3) Login to your private repository using the login server, user ID and password from the 'Access Keys' pane in your ACR portal
```
docker login <registryname>.azurecr.io
```
4) Review the DockerFile file in the application folder. This is the file Docker will use to build the container image.
5) Execute the `docker build` command to build your container image. **Note**: The first part of the container image name MUST be your container registry fully qualified name (i.e. myregistry.azurecr.io)
```
docker build -t <registryname>.azurecr.io/bookstore .
```
6) Push your newly created image to your private Azure Container Registry
```
docker push <registryname>.azurecr.io/bookstore
```

## Deploy Bookstore to Kubernetes
The following steps will walk you through deployment of your container image into your kubernetes cluster. As we are using a private container registry, you will need to first tell kubernetes the credentials for that registry using the `kubectl create secret` command. You will then reference that secret in the yaml file used for the deployment.

1) Create the secret on your kuberentes cluster containing your container registry credentials
```
kubectl create secret docker-registry regsecret --docker-server=<registryname>.azurecr.io --docker-username=<registry username> --docker-password=<registry password> --docker-email=<your-email>
```
2) In the application folder you should see a file named `bookstore.yaml`. This is the file that describes to kubernetes what we want to deploy. Modify (`sudo nano bookstore.yaml` or `sudo vi bookstore.yaml`) this file so that the `image` name matches your registry name (i.e. `<registryname>.azurecr.io/bookstore`). Save and exit.
3) Execute `kubectl create` to create the deployment
```
kubectl create -f bookstore.yaml
```
4) Verify that the deployment completed.
```
kubectl get pods
or
watch 'kubectl get pods'
```
5) Use `kubectl expose` to expose your deployment through the kuberentes integrated Azure Load Balancer
```
kubectl expose deployments bookstore --port=80 --type=LoadBalancer
```
6) Watch the deployment to see the public IP populate. This may take a few minutes
```
watch 'kubectl get svc'
```
7) Go to a browser and navigate to the public IP address from step 6

## MySQL in a container
The following steps will walk you through the process of moving the MySQL DB into a container and deploying it to your kubernetes cluster

1) Create a MySQL password for the _root_ user for use across the cluster
```
kubectl create secret generic mysql --from-literal=password=YOUR_PASSWORD
```

2) Run the following docker commands to pull the [azure-tools](https://github.com/colemickens/azure-tools) image and start it up. This is used to create a blank vhd for persistent storage for MySQL. When [managed disks are supported](https://github.com/Azure/acs-engine/pull/144) this will be much simpler.
```
docker pull docker.io/colemickens/azure-tools:latest
docker run -it docker.io/colemickens/azure-tools:latest
```
3) This will trigger the azure cli. Login into Azure using the code shown.

4) Execute the following commands inside the container to create the empty disk for mysql. **Note** that you need an existing storage account to use for this. 
```
export AZURE_SUBSCRIPTION_ID=<your_subscription_id>
export AZURE_RESOURCE_GROUP=<resource_group_name>
export AZURE_STORAGE_ACCOUNT=<name_of_storage_account>
export AZURE_STORAGE_CONTAINER=<vhd_container_name>
export IMAGE_SIZE=10G
export AZURE_LOCATION=westus

./make-vhd.sh
# VHD_URL=https://mystorageaccount.blob.core.windows.net/mycontainer/mydatadisk.vhd
# (end)
```
5) Exit the container using `exit`

6) Using nano, update the _bookstore-mysql.yaml_ file replacing storage account name and vhd url under the _volumes_ section with the values outputted from step 4.

7) Deploy MySQL to the Kubernetes cluster
```
kubectl create -f bookstore-mysql.yaml
watch kubectl get pods
```
8) Expose MySQL service on the cluster via port 3306
```
kubectl expose deployments bookstore-mysql --port=3306
```
9) Create the database and seed it with initial data. Use `kubectl get pods` to get the pod name. The last command should show a list of databases of which one should be *fabrikam_bookstore*.
```
kubectl exec -i <mysql-pod-name> -- mysql -uroot -p<password> < Fabrikam-Bookstore/dbscripts/master_setup.sql
kubectl exec -i <mysql-pod-name> -- mysql -uroot -p<password> < Fabrikam-Bookstore/dbscripts/dbload.sql
kubectl exec -i <mysql-pod-name> -- mysql -uroot -p<password> -e"SHOW DATABASES;"
```

## Update app to point to MySQL in a container
1) Update the database section in the .env file under Fabrikam-Bookstore to the following - note that db_host is now _bookstore-mysql_:
```
DB_CONNECTION=mysql
DB_HOST=bookstore-mysql
DB_PORT=3306
DB_DATABASE=fabrikam_bookstore
DB_USERNAME=root
DB_PASSWORD=<password>
```
2) Execute the `docker build` command to build your container image. **Note**: The first part of the container image name MUST be your container registry fully qualified name (i.e. myregistry.azurecr.io)
```
docker build -t <registryname>.azurecr.io/bookstore .
```
3) Push your newly created image to your private Azure Container Registry
```
docker push <registryname>.azurecr.io/bookstore
```
4) Remove the _bookstore_ deployment from the kubernetes cluster as well as the service
```
kubectl delete deployment bookstore
kubectl delete service bookstore
```
5) Redeploy the bookstore app and expose it
```
kubectl create -f bookstore.yaml
kubectl expose deployments bookstore --port=80 --type=LoadBalancer
watch 'kubectl get svc'
```
6) Once the public ip is available you should be able to browse to the site.
