
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
