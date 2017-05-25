#Pull the latest ubuntu image
FROM ubuntu

#Copy over th application folder and set it as the working directory
COPY Fabrikam-Bookstore/ /var/www/html/Fabrikam-Bookstore/
WORKDIR /var/www/html/Fabrikam-Bookstore/

#Update and Upgrade Ubuntu
RUN apt-get update
RUN apt-get upgrade -y

#Install packages needed by the application
RUN apt-get install -y apache2 \
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
      curl
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

#Run the composer installation
RUN composer install

#Generate the app key requried to run the site
RUN php artisan key:generate

#Expose the application http server port
EXPOSE 80

#Run the laravel server for the application
CMD php artisan serve --host 0.0.0.0 --port=80
