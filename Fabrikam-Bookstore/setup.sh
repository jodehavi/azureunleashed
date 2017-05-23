#!/bin/bash
#Update and Upgrade Ubuntu
sudo apt-get update
sudo apt-get upgrade -y

#Install packages needed by the application
sudo apt-get install -y apache2 \
      php \
      libapache2-mod-php \
      php-mcrypt \
      php-mbstring \
      php-dom \
      zip \
      unzip \
      libmcrypt-dev \
      mcrypt \
      php-mysql \
      curl \
      composer

#Run the composer installation
composer install

#get public ip
ipaddr=$(curl ipinfo.io/ip)
echo "Your ip address is $ipaddr"

#setup mysql in azure
#read -p 'admin username: ' uservar
#read -p 'Resource Group Name: ' rgvar
#read -p 'Server Name: ' snvar
#read -sp 'Password: ' passvar
rgvar=$1
snvar=$2
uservar=$3
passvar=$4

az login
az group create --name $rgvar --location westus
az mysql server create --resource-group $rgvar --name $snvar --location westus --admin-user $uservar --admin-password $passvar --performance-tier Basic --compute-units 50 --ssl-enforcement Disabled
az mysql server firewall-rule create --resource-group $rgvar --server $snvar --name MyClientIp --start-ip-address $ipaddr --end-ip-address $ipaddr
az mysql server show --resource-group $rgvar --name $snvar
cat <<EOT > .env
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_LOG_LEVEL=debug
APP_URL=http://localhost

DB_CONNECTION=mysql
DB_HOST=$snvar.mysql.database.azure.com
DB_PORT=3306
DB_DATABASE=fabrikam_bookstore
DB_USERNAME=$uservar@$snvar
DB_PASSWORD=$passvar
EOT


echo "sleeping 1 minute to allow ip rules to process"
sleep 1m # Waits 1 minutes
#populate the db
mysql -h $snvar.mysql.database.azure.com -u $uservar@$snvar -p$passvar < dbscripts/master_setup.sql
mysql -h $snvar.mysql.database.azure.com -u $uservar@$snvar -p$passvar < dbscripts/dbload.sql

#Generate the app key requried to run the site
php artisan key:generate
