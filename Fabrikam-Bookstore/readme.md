# Fabrikam Bookstore

Simple php bookstore application that is built on top of the Laravel framework

You need the following:

* PHP 5.6.4 or greater installed.

* MySQL database

* Composer

Clone this repository and navigate into the Fabrikam-Bookstore folder. This app uses composer to manage its packages so you will need to run:

	composer install

This will pull down the Laravel Framework and set it up within the app.

When that is complete, create a .env file at the root level (under Fabrikam-Bookstore). This file needs to contain your database connection information and should look like this:

	DB_CONNECTION=mysql
	DB_HOST=127.0.0.1
	DB_PORT=3306
	DB_DATABASE=homestead
	DB_USERNAME=homestead
	DB_PASSWORD=secret

The .env.example file can be used as a starting point.

When the .env file is created, you can run the app using the following command:

	php artisan serve

This will launch a webserver and run the app locally - you should be able to browse to the app.


To build and run the Docker application container run the following:

	docker build -t bookstore .
	docker run -dp 8000:8000 --net=host bookstore

Note: --net=host tells docker to run the container on your host network (i.e. Host Hode) rather than the docker bridged network, which is the default.