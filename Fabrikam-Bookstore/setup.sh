#!/bin/bash
#Update and Upgrade Ubuntu
#sudo apt-get update
#sudo apt-get upgrade -y

logger "Starting app install script"
cd /var/www/azureunleashed/Fabrikam-Bookstore/
pwd

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
      composer \
      mysql-client-core-5.7

logger "running composer"
#Run the composer installation
sudo composer install

snvar=$1
uservar=$2
passvar=$3

logger "creating env file"

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

logger "creating database"
#populate the db
mysql -h $snvar.mysql.database.azure.com -u $uservar@$snvar -p$passvar < dbscripts/master_setup.sql
mysql -h $snvar.mysql.database.azure.com -u $uservar@$snvar -p$passvar < dbscripts/dbload.sql

logger "generating app key"
#Generate the app key required to run the site
sudo php artisan key:generate

logger "done"
