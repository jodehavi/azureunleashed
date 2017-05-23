CREATE DATABASE fabrikam_bookstore;
USE fabrikam_bookstore;

CREATE TABLE `books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `isbn` VARCHAR(100) NULL,
  `title` VARCHAR(200) NULL,
  `author` VARCHAR(200) NULL,
  `publisher` VARCHAR(200) NULL,
  `image` VARCHAR(45) NULL,
  `price` DECIMAL(10, 2) NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE `orders` (
  `orderid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `total` decimal(13, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  FOREIGN KEY (`user_id`) REFERENCES users(`id`)
);

CREATE TABLE `orderdetails` (
  `lineitemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `bookid` int(11) NOT NULL,
  `lineitemprice` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`lineitemid`),
  FOREIGN KEY (`order_id`) REFERENCES orders(`orderid`),
  FOREIGN KEY (`bookid`) REFERENCES books(`id`)
);

CREATE TABLE `creditcards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cardno` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `billingaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expdate` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES users(`id`),
  UNIQUE KEY `cardno_unique` (`cardno`)
);
