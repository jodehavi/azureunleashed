# Fabrikam Bookstore

Simple php bookstore application that is built on top of the Laravel framework

First clone this repository and then follow the guidance for one of the approaches below.

# Setup basic application

Navigate into the Fabrikam-Bookstore folder. 

Run

	setup.sh 

This will install the required components and setup the application. It will install php and the necessary parts, pull down the Laravel Framework and set it up within the app.

When that is complete, open the .env file (at the root level under Fabrikam-Bookstore). This file needs to contain your database connection information and should look like this:

	DB_CONNECTION=mysql
	DB_HOST=127.0.0.1
	DB_PORT=3306
	DB_DATABASE=homestead
	DB_USERNAME=homestead
	DB_PASSWORD=secret

You will need to update the values to point to your MySQL instance.

When the .env file is updated you can run the app using the following command:

	php artisan serve --host=0.0.0.0

This will launch a webserver and run the app locally at http://0.0.0.0:8000 - you should be able to browse to the app.

# Setup as a Docker Container

To build and run the Docker application container, edit the .env.example file to update with your DB connection info and then run the following from the same directory as the Dockerfile:

	docker build -t bookstore .
	docker run -dp 80:80 bookstore

Note: If running locally, and your port 80 is already occupied, you can change the command as follows:

	docker run -dp <yourPort>:80 bookstore
