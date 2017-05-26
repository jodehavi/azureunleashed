# Fabrikam Bookstore

Simple php bookstore application that is built on top of the Laravel framework. This assumes you already have a MySQL instance running in Azure.

First clone this repository and then follow the guidance below.

Navigate into the Fabrikam-Bookstore folder. 

Run
```
setup.sh <dbservername> <dbusername> <dbpassword> 
```
This will install the required components and setup the application. It will install php and the necessary parts, pull down the Laravel Framework and set it up within the app.

You can run the app using the following command:

	php artisan serve --host=0.0.0.0

This will launch a webserver and run the app locally at http://0.0.0.0:8000 - you should be able to browse to the app.