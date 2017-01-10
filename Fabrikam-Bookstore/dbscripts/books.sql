CREATE DATABASE fabrikam_bookstore

USE fabrikam_bookstore

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