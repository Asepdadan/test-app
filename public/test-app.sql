-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `products` (`id`, `barcode`, `product_name`, `price`, `status`) VALUES
(1,	1111,	'APPLE',	10.00,	'READY'),
(2,	1111,	'APPLE',	20.00,	'DELIVERED'),
(3,	1111,	'APPLE',	30.00,	'SENT'),
(4,	1111,	'APPLE',	10.00,	'ONHOLD'),
(5,	1111,	'APPLE',	20.00,	'PACKING'),
(6,	1111,	'APPLE',	40.00,	'SENT'),
(7,	1111,	'APPLE',	50.00,	'SENT'),
(8,	1122,	'PINAPPLE',	10.00,	'READY'),
(9,	1122,	'PINAPPLE',	10.00,	'DELIVERED'),
(10,	1122,	'PINAPPLE',	10.00,	'PACKING'),
(11,	1122,	'PINAPPLE',	10.00,	'DELIVERED');

DROP VIEW IF EXISTS `v_products`;
CREATE TABLE `v_products` (`barcode` int(11), `jumlah` bigint(21), `total_harga` decimal(42,2), `ready` bigint(21), `onhold` bigint(21), `delivered` bigint(21), `packing` bigint(21), `sent` bigint(21));


DROP TABLE IF EXISTS `v_products`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_products` AS select `products`.`barcode` AS `barcode`,count(0) AS `jumlah`,sum(`products`.`price`) AS `total_harga`,(select count(0) from `products` `a` where ((`a`.`status` = 'READY') and (`products`.`barcode` = `a`.`barcode`))) AS `ready`,(select count(0) from `products` `a` where ((`a`.`status` = 'ONHOLD') and (`products`.`barcode` = `a`.`barcode`))) AS `onhold`,(select count(0) from `products` `a` where ((`a`.`status` = 'DELIVERED') and (`products`.`barcode` = `a`.`barcode`))) AS `delivered`,(select count(0) from `products` `a` where ((`a`.`status` = 'PACKING') and (`products`.`barcode` = `a`.`barcode`))) AS `packing`,(select count(0) from `products` `a` where ((`a`.`status` = 'SENT') and (`products`.`barcode` = `a`.`barcode`))) AS `sent` from `products` group by `products`.`barcode`;

-- 2021-05-03 14:18:54
