#!/bin/bash

logger  "setup.sh - Run apt update"
sudo apt update
#logger  "setup.sh - Run apt upgrade"
#sudo apt -y upgrade

logger  "setup.sh - Installing Git"
sudo apt -y install git

logger  "setup.sh - Installing Docker"
sudo apt -y install docker.io

logger "setup.sh - Installing curl"
sudo apt -y install curl

logger "setup.sh - Installing Azure CLI"
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
     sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli

git clone https://github.com/jodehavi/azureunleashed.git /var/www/azureunleashed

sh /var/www/azureunleashed/Fabrikam-Bookstore/setup.sh $1 $2 $3
