#Pull the latest composer image
FROM composer:latest

#Copy over th application folder and set it as the working directory
COPY Fabrikam-Bookstore/ /var/www/html/Fabrikam-Bookstore/
WORKDIR /var/www/html/Fabrikam-Bookstore/

#Run the composer installation
RUN composer install

#Rename the .env.example file to server as the .env file
RUN mv .env.example .env

#Generate the app key requried to run the site
RUN php artisan key:generate

#Install the additional packages needed for the app to run
RUN apk update \
  && apk add libmcrypt-dev \
  && docker-php-ext-install mcrypt mysqli pdo_mysql \
  && rm /var/cache/apk/*

#Expose the application http server port
EXPOSE 8000

#Run the laravel server for the application
CMD ["php","artisan", "serve"]