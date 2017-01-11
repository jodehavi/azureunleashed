FROM composer:latest
COPY Fabrikam-Bookstore/ /var/www/html/Fabrikam-Bookstore/
WORKDIR /var/www/html/Fabrikam-Bookstore/
RUN composer install
RUN mv .env.example .env
RUN php artisan key:generate
EXPOSE 8000
CMD ["php","artisan", "serve"]