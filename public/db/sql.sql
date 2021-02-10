-- Adminer 4.7.9 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `tb_brands`;
CREATE TABLE `tb_brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_brands` (`id`, `name`, `register`) VALUES
(4,	'Absolute',	'2021-02-10 01:07:54'),
(5,	'Savant',	'2021-02-10 01:08:05'),
(6,	'Home Manager',	'2021-02-10 01:08:12');

DROP TABLE IF EXISTS `tb_categories`;
CREATE TABLE `tb_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_categories` (`id`, `title`, `register`) VALUES
(4,	'Amplificador',	'2021-02-09 23:50:48'),
(5,	'Extensor',	'2021-02-09 23:51:03'),
(6,	'Splitter',	'2021-02-09 23:51:16');

DROP TABLE IF EXISTS `tb_contacts`;
CREATE TABLE `tb_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `message` text NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tb_emails`;
CREATE TABLE `tb_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tb_menus`;
CREATE TABLE `tb_menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(512) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `photo` varchar(256) NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_menus` (`id`, `title`, `description`, `price`, `photo`, `register`) VALUES
(1,	'Bife de Costela com molho',	'Vide electram sadipscing et per. Aenean aliquam molestie leo, vitae iaculis nisl.',	35.69,	'images/img_1.jpg',	'2018-09-12 19:48:58'),
(2,	'Hambúrguer com Fritas',	'Vide electram sadipscing et per. Aenean aliquam molestie leo, vitae iaculis nisl.',	29.80,	'images/img_2.jpg',	'2018-09-12 19:48:58'),
(3,	'Chilli com Carne',	'Vide electram sadipscing et per. Aenean aliquam molestie leo, vitae iaculis nisl.',	29.40,	'images/img_3.jpg',	'2018-09-12 19:48:58');

DROP TABLE IF EXISTS `tb_products`;
CREATE TABLE `tb_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `model` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productCode` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brand` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provider` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(512) NOT NULL,
  `profitMargin` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` varchar(128) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `subCategory` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `photo` varchar(256) NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_products` (`id`, `name`, `model`, `productCode`, `brand`, `provider`, `description`, `profitMargin`, `category`, `subCategory`, `price`, `photo`, `register`) VALUES
(4,	'Receiver 2 Zonas Slim',	'Receiver Slim 7.2 AVR1710S',	'REC72MAR1710S',	'Marants',	'Disac',	'Receiver 2 zonas, 2 subwoofers, 4 inputs analógicos, 6 inputs HDMI, 2 input optico',	'2.5',	'Amplificador',	'Receiver',	6750.00,	'images/upload_e246c898354ade87ffbcdd0b07983a5a.jpeg',	'2021-02-09 22:07:32'),
(5,	'HDBaseT TX',	'NDS-317 TX',	'HDBT371TX',	'Absolute',	'Audiogene',	'Extensor de vídeo e IR FULLHD, até 30 metros de distância;',	'2.5',	'Extensores',	'Vídeo',	900.00,	'images/upload_1cd017e671dae0f396d81c68a09a6e1b.jpg',	'2021-02-09 22:11:24');

DROP TABLE IF EXISTS `tb_providers`;
CREATE TABLE `tb_providers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_providers` (`id`, `name`, `register`) VALUES
(1,	'Audiogene',	'2021-02-10 01:24:04'),
(2,	'Central dos Cabos',	'2021-02-10 01:24:16');

DROP TABLE IF EXISTS `tb_reservations`;
CREATE TABLE `tb_reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `people` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_users` (`id`, `name`, `email`, `password`, `register`) VALUES
(1,	'João Rangel',	'joao@hcode.com.br',	'123456',	'2018-04-17 18:57:44'),
(2,	'Rogério Fabrício',	'rogerio@zafiro.com.br',	'zafiro327',	'2021-02-10 02:24:16');

-- 2021-02-10 02:25:44