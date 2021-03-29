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
(1,	'Marantz',	'2021-02-16 20:22:30'),
(2,	'Savagem',	'2021-02-16 20:22:50'),
(3,	'Ubiquiti',	'2021-02-16 20:23:03'),
(4,	'Hikvision',	'2021-02-16 20:25:03'),
(5,	'Legrand',	'2021-02-16 20:25:13'),
(6,	'TP-Link',	'2021-02-16 20:25:25'),
(7,	'Home Manager',	'2021-02-16 20:25:39'),
(8,	'Absolute',	'2021-02-16 20:25:57'),
(9,	'Savant',	'2021-02-16 20:26:05'),
(10,	'Focal',	'2021-02-16 20:26:15');

DROP TABLE IF EXISTS `tb_categories`;
CREATE TABLE `tb_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_categories` (`id`, `title`, `register`) VALUES
(1,	'Amplificadores',	'2021-02-16 20:30:30'),
(2,	'Extensores',	'2021-02-16 20:33:55'),
(3,	'Vídeo',	'2021-02-16 20:35:57'),
(4,	'Audio Tools',	'2021-02-16 20:38:56'),
(5,	'Rede',	'2021-02-16 20:40:03'),
(6,	'Iluminação',	'2021-02-16 21:02:42'),
(7,	'Host',	'2021-02-16 21:04:03'),
(8,	'Caixas Acústica',	'2021-02-16 21:09:57');

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
  `productCode` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_brand` int NOT NULL,
  `id_provider` int NOT NULL,
  `description` varchar(512) NOT NULL,
  `profitMargin` decimal(10,2) NOT NULL,
  `id_category` int NOT NULL,
  `id_sub_category` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `photo` varchar(256) NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_products` (`id`, `name`, `model`, `productCode`, `id_brand`, `id_provider`, `description`, `profitMargin`, `id_category`, `id_sub_category`, `price`, `photo`, `register`) VALUES
(1,	'Receiver 7.2',	'Receiver Slim Multicanal 7.2 NR1710',	'REC72SLMAR',	1,	2,	'A / V de rede de 7.2 canais Marantz NR1710 . Ele fornece até 50W de energia por canal a 8 ohms e possui suporte embutido para Bluetooth, AirPlay 2 e HEOS, permitindo transmitir sem fio músicas de fontes compatíveis, como smartphones e tablets.',	2.50,	1,	2,	6875.00,	'images/upload_ffd9ae4fdda3097203a90c8ec03121f2.jpg',	'2021-02-16 20:50:50'),
(2,	'Switch Gigabit',	'Switch 24 portas Gigabit TL-SG1024D BR',	'SWT24PG',	6,	3,	'24 portas são RJ-45 Gigabit e podem oferecer transferências de grandes arquivos além de serem compatíveis com dispositivos Ethernet 10Mbps e 100Mbps. Oferece a estrutura de switch sem bloqueio, o TL-SG1024D envia e filtra pacotes em velocidade cabeada de transmissão máxima. Com frame Jumbo de10KB, o desempenho das transferências arquivos grandes é melhorado significativamente. O padrão de controle de fluxo IEEE 802.3x para Full Duplex e contrapressão para Half Duplex.',	2.50,	5,	11,	890.00,	'images/upload_2294126bf7ded83d60a24cccfaeebe64.jpg',	'2021-02-16 20:56:09'),
(3,	'Access Point',	'Unifi AC UAP-AC-LITE-BR ',	'APUBQIC',	3,	6,	'Antena Ubiquiti Ap Unifi Uap-Ac Lite BR Mimo 2.4/5.0GHZ 300/867MBPS Bivolt',	2.50,	5,	13,	640.00,	'images/upload_9d4d586b5336cccd63fe12df7ff0b18b.jpg',	'2021-02-16 21:01:01'),
(4,	'Smart Center',	'Smart Center ',	'SCHM',	7,	9,	'',	2.50,	7,	15,	1990.00,	'images/upload_ca3af922f58c7fb7875b70fffd22d02b.jpg',	'2021-02-16 21:05:33'),
(5,	'Módulo 12 On/Off - 4 Dimmers',	'Home One',	'HOHM16',	7,	9,	'Módulo de iluminação com 12 relés e 4 dimeres',	2.50,	6,	14,	1390.00,	'images/upload_0220cfbfc07a0306d7cb27f8aff090fa.jpg',	'2021-02-16 21:07:28'),
(6,	'SIPA1 + SMS',	'HTS-SIPA1SM - 1 IP Audio',	'SIPA1SMS',	9,	10,	'',	2.50,	7,	15,	2169.00,	'images/upload_4ca42fd0122058676c35a4e43d361350.jpg',	'2021-02-16 21:09:42'),
(7,	'Caixa Acústica SIG-R4',	'SIG-R4 90W',	'SIGR4',	8,	10,	'',	2.50,	8,	17,	283.00,	'images/upload_fc0b61836612cfeb2984ceba9ae83671.jpg',	'2021-02-16 21:12:31');

DROP TABLE IF EXISTS `tb_providers`;
CREATE TABLE `tb_providers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_providers` (`id`, `name`, `register`) VALUES
(1,	'Disac Comercial LTDA',	'2021-02-16 15:14:55'),
(2,	'Discabos Com Imp Exp Acess Eletr LTDA',	'2021-02-16 15:15:28'),
(3,	'Central dos Cabos Com de Mat Eletr e Teleinformatica LTDA',	'2021-02-16 15:16:07'),
(4,	'G R Savage Sistemas Eletronicos LTDA - EPP',	'2021-02-16 15:16:31'),
(5,	'Torre Telecomunicações e Sistemas LTDA',	'2021-02-16 15:16:58'),
(6,	'Dicomp Distribuidora de Eletronicos LTDA',	'2021-02-16 15:17:27'),
(7,	'Discom Tecnologia em Sistemas de Segurança LTDA',	'2021-02-16 15:17:49'),
(8,	'Legrand - GL Eletro-Eletronicos LTDA',	'2021-02-16 15:18:12'),
(9,	'Home Manager - Pianta & Eschner Automação LDTA - ME',	'2021-02-16 15:18:48'),
(10,	'Audiogene Com Imp Exp de Produtos Eletronicos LTDA',	'2021-02-16 15:19:19');

DROP TABLE IF EXISTS `tb_pulsador`;
CREATE TABLE `tb_pulsador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `qtButtons` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `colorButtons` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `button1` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `button2` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `button3` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `button4` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `button5` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `button6` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `urlPhoto` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_pulsador` (`id`, `name`, `qtButtons`, `colorButtons`, `button1`, `button2`, `button3`, `button4`, `button5`, `button6`, `urlPhoto`) VALUES
(59,	'SUÍTE MASTER',	'l3',	'wh',	'LED Cama',	'Cortineiro',	'Dicroicas',	'',	'',	'',	'aql-l3-wh'),
(60,	'HOME',	'l6',	'blk',	'Cena',	'Cena',	'OFF',	'Dicroicas',	'Pendente',	'Master OFF',	'aql-l6-blk');

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


DROP TABLE IF EXISTS `tb_subcategories`;
CREATE TABLE `tb_subcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `id_category` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_subcategories` (`id`, `title`, `id_category`, `register`) VALUES
(1,	'Multi-room',	'1',	'2021-02-16 20:31:29'),
(2,	'Receiver',	'1',	'2021-02-16 20:31:40'),
(3,	'Pré-Amplificador',	'1',	'2021-02-16 20:32:22'),
(4,	'Extensor HDMI',	'2',	'2021-02-16 20:34:31'),
(5,	'Extensor HDBaseT',	'2',	'2021-02-16 20:34:47'),
(6,	'Matrix de Vídeo',	'3',	'2021-02-16 20:36:33'),
(7,	'Switcher',	'3',	'2021-02-16 20:36:48'),
(8,	'Extrator de Áudio',	'4',	'2021-02-16 20:39:12'),
(9,	'Extensor de Áudio',	'2',	'2021-02-16 20:39:34'),
(10,	'DAC',	'4',	'2021-02-16 20:39:52'),
(11,	'Switch',	'5',	'2021-02-16 20:40:15'),
(12,	'Routeador',	'5',	'2021-02-16 20:40:27'),
(13,	'Access Point',	'5',	'2021-02-16 20:40:42'),
(14,	'Módulo Relé',	'6',	'2021-02-16 21:03:20'),
(15,	'Host',	'7',	'2021-02-16 21:04:15'),
(16,	'Outdoor',	'8',	'2021-02-16 21:10:07'),
(17,	'In-Celling',	'8',	'2021-02-16 21:10:17'),
(18,	'In-Wall',	'8',	'2021-02-16 21:10:26');

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
(2,	'Rogério Fabrício',	'rogerio@zafiro.com.br',	'123456',	'2021-02-16 15:14:18');

-- 2021-03-29 16:31:21