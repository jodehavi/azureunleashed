CREATE TABLE `fabrikam-bookstore`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `isbn` VARCHAR(100) NULL,
  `title` VARCHAR(200) NULL,
  `author` VARCHAR(200) NULL,
  `publisher` VARCHAR(200) NULL,
  `image` VARCHAR(45) NULL,
  `updated_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`));
