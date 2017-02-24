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

cp .env.example .env
#Generate the app key requried to run the site
php artisan key:generate
