#!/bin/bash
#Update and Upgrade Ubuntu
apt-get update
apt-get upgrade -y

#Install packages needed by the application
apt-get install -y apache2 \
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

#setup mysql in azure
read -p 'admin username: ' uservar
read -p 'Resource Group Name: ' rgvar
read -p 'Server Name: ' snvar
read -sp 'Password: ' passvar
az login
az group create --name $rgvar --location westus
az mysql server create --resource-group $rgvar --name $snvar --location westus --admin-user $uservar --admin-password $passvar --performance-tier Basic --compute-units 50 --ssl-enforcement Disabled
#az mysql server firewall-rule create --resource-group $rgvar --server $snvar --name MyClientIp --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255
az mysql server show --resource-group $rgvar --name $snvar
echo "DB_CONNECTION=mysql" > .env
echo "DB_HOST="$snvar".mysql.database.azure.com" >> .env
echo "DB_PORT=3306" >> .env
echo "DB_DATABASE=fabrikam_bookstore" >> .env
echo "DB_USERNAME="$uservar"@"$snvar >> .env
echo "DB_PASSWORD="$passvar >> .env

#Generate the app key requried to run the site
php artisan key:generate
