-- --------------------------------------------------------
-- Хост:                         localhost
-- Версия сервера:               5.6.37 - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных cms.stud
CREATE DATABASE IF NOT EXISTS `cms.stud` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cms.stud`;

-- Дамп структуры для таблица cms.stud.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `admin_level` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы cms.stud.admin: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`admin_id`, `user_id`, `admin_level`) VALUES
	(1, 1, 2),
	(2, 2, 1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Дамп структуры для таблица cms.stud.admin_level_description
CREATE TABLE IF NOT EXISTS `admin_level_description` (
  `admin_level` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `level_title` varchar(50) DEFAULT NULL,
  `level_description` text,
  PRIMARY KEY (`admin_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы cms.stud.admin_level_description: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `admin_level_description` DISABLE KEYS */;
INSERT INTO `admin_level_description` (`admin_level`, `level_title`, `level_description`) VALUES
	(1, 'Менеджер', 'Изменить тур на горящий'),
	(2, 'Администратор', 'Добавить/Изменить/Удалить тур/пользователя');
/*!40000 ALTER TABLE `admin_level_description` ENABLE KEYS */;

-- Дамп структуры для таблица cms.stud.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) DEFAULT NULL,
  `brand_country` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы cms.stud.brands: ~9 rows (приблизительно)
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` (`brand_id`, `brand_name`, `brand_country`) VALUES
	(1, 'Semsung', 'Корея'),
	(2, 'MUtorola', 'Корея'),
	(3, 'PineApple', 'США'),
	(4, 'DEIL', 'США'),
	(5, 'OSUS', 'Китай'),
	(6, 'Siaomi', 'Китай'),
	(7, 'Xrenovo', 'Китай'),
	(8, 'S-TELL', 'Украина'),
	(9, 'Impression', 'Украина');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;

-- Дамп структуры для таблица cms.stud.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_name` varchar(150) NOT NULL,
  `category_text_small` text,
  `category_seo_title` varchar(250) DEFAULT '',
  `category_seo_description` varchar(250) DEFAULT '',
  `category_seo_keywords` varchar(250) DEFAULT '',
  `category_image` varchar(250) DEFAULT '',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы cms.stud.categories: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`category_id`, `parent_id`, `category_name`, `category_text_small`, `category_seo_title`, `category_seo_description`, `category_seo_keywords`, `category_image`, `status`, `sort_order`) VALUES
	(1, 0, 'Смартфоны', 'Широкий выбор смартфонов в нашем магазине позволит удовлетворить любые потребности наших покупателей', 'Страница смартфоны', 'Телефоны -  Keywords:', 'Телефоны -  Keywords:', '1bf5ec2c2b0760e9457092d4949fbe08.png', 1, 2),
	(2, 0, 'Планшеты', 'Широкий выбор планшетов в нашем магазине позволит удовлетворить любые потребности наших покупателей', 'Планшеты - title', 'Планшеты - Description', 'Планшеты -  Keywords:', 'tablet.png', 1, 0),
	(3, 0, 'Ноутбуки', 'Широкий выбор ноутбуков в нашем магазине позволит удовлетворить любые потребности наших покупателей', 'Ноутбуки - title', 'Ноутбуки - Description', 'Ноутбуки -  Keywords:', 'laptop.png', 1, 0),
	(4, 0, 'Телевизоры', 'Широкий выбор телевизоров в нашем магазине позволит удовлетворить любые потребности наших покупателей', 'Телевизоры - title', 'Телевизоры - Description', 'Телевизоры -  Keywords:', 'tv.png', 1, 0),
	(5, 0, 'Наушники', 'Широкий выбор наушников в нашем магазине позволит удовлетворить любые потребности наших покупателей', 'Наушники - title', 'Наушники - Description', 'Наушники -  Keywords:', 'headset.png', 1, 0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Дамп структуры для таблица cms.stud.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `product_image` varchar(50) NOT NULL DEFAULT 'no_image.png',
  `product_brand_id` varchar(50) NOT NULL,
  `product_text_small` text NOT NULL,
  `product_text` text,
  `product_price` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `product_seo_title` varchar(50) NOT NULL,
  `product_seo_description` varchar(50) NOT NULL,
  `product_seo_keywords` varchar(50) NOT NULL,
  `status` smallint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы cms.stud.products: ~43 rows (приблизительно)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`product_id`, `product_name`, `product_image`, `product_brand_id`, `product_text_small`, `product_text`, `product_price`, `product_quantity`, `product_seo_title`, `product_seo_description`, `product_seo_keywords`, `status`) VALUES
	(1, 'uPhone S1', 'smartphone.png', '1', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 100, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(2, 'uPhone S2', 'smartphone.png', '1', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 200, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(3, 'uPhone S3', 'smartphone.png', '1', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 400, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(4, 'uPhone S4', 'smartphone.png', '1', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 400, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(5, 'Motor M1', 'smartphone.png', '2', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 99, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(6, 'Motor M2', 'smartphone.png', '2', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 199, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(7, 'myPhone 6', 'smartphone.png', '3', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 600, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(8, 'myPhone 7', 'smartphone.png', '3', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 700, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(9, 'myPhone 8', 'smartphone.png', '3', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 800, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(10, 'myPhone 9', 'smartphone.png', '3', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 900, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(11, 'Mi200', 'smartphone.png', '6', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 200, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(12, 'Mi220', 'smartphone.png', '6', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 220, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(13, 'Mi299', 'smartphone.png', '6', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 299, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(14, 'Mi500', 'smartphone.png', '6', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 500, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(15, 'ST Pro 3', 'smartphone.png', '8', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 299, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(16, 'ST Pro 5', 'smartphone.png', '6', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 499, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(17, 'ST Pro 7', 'smartphone.png', '6', 'Супер классный смартфон', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 699, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(18, 'uTab S1', 'tablet.png', '1', 'Супер классный планшет', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 100, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(19, 'uTab S2', 'tablet.png', '1', 'Супер классный планшет', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 200, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(20, 'uTab S3', 'tablet.png', '1', 'Супер классный планшет', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 400, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(21, 'uTab S4', 'tablet.png', '1', 'Супер классный планшет', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 400, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(22, 'myTab 4', 'tablet.png', '3', 'Супер классный планшет', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 400, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(23, 'myTab 6', 'tablet.png', '3', 'Супер классный планшет', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 600, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(24, 'myTab 8', 'tablet.png', '3', 'Супер классный планшет', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 800, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(25, 'myTab 10', 'tablet.png', '3', 'Супер классный планшет', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 1000, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(26, 'iMpres 5', 'laptop.png', '9', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 300, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(27, 'iMpres 6', 'laptop.png', '9', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 400, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(28, 'iMpres 7', 'laptop.png', '9', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 500, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(29, 'Ideal K8', 'laptop.png', '7', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 250, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(30, 'Ideal S8', 'laptop.png', '7', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 350, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(31, 'Ideal G8', 'laptop.png', '7', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 490, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(32, 'Inspiration 55', 'laptop.png', '4', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 1000, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(33, 'Inspiration 56', 'laptop.png', '4', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 1330, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(34, 'Inspiration 62', 'laptop.png', '4', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 2100, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(35, 'Genuis A-5', 'laptop.png', '5', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 850, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(36, 'Genuis A-8', 'laptop.png', '5', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 1250, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(37, 'Genuis A-12', 'laptop.png', '5', 'Супер классный ноутбук', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 1990, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(38, 'SuperLED Ma', 'tv.png', '6', 'Супер классный телевизор', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 350, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(39, 'SuperLED Fu', 'tv.png', '6', 'Супер классный телевизор', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 400, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(40, 'SuperLED Tutur', 'tv.png', '6', 'Супер классный телевизор', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 449, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(41, 'CuteVision S', 'tv.png', '1', 'Супер классный телевизор', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 500, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(42, 'CuteVision X', 'tv.png', '1', 'Супер классный телевизор', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 700, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(43, 'CuteVision Pro', 'tv.png', '1', 'Супер классный телевизор', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ex sollicitudin, malesuada ante vel, lobortis diam. Cras sit amet erat leo. Pellentesque non vestibulum ligula. Curabitur sed augue pulvinar elit eleifend accumsan eu et eros. Ut vestibulum aliquet turpis a hendrerit. Curabitur vel turpis tellus. Nam pharetra eu urna a mattis.\r\n\r\nVivamus feugiat dictum ligula, eget convallis enim pharetra sit amet. Mauris lacinia sapien eu eros lobortis, ut tincidunt est vehicula. Nam tortor turpis, bibendum in eleifend eget, consequat eu libero. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi cursus, lectus vitae tincidunt vestibulum, orci eros iaculis enim, vel interdum mi eros euismod sapien. Etiam nec justo diam. In convallis sagittis interdum. Phasellus blandit erat ac nibh bibendum tempus.', 1000, 245, ' - title', ' - Description', ' - Keywords:', 1),
	(46, 'HeadSUper', '1d5297f724b164c272c88944e9bdea4b.png', '8', 'Текст короткий', 'Текст длинный', 500, 222, 'SEO Title', 'SEO Description', 'SEO Keywords', 1),
	(48, 'Названиеrete', 'smartphone.png', '4', 'Текст короткий', 'Текст длинный', 500, 222, 'SEO Title', 'SEO Description', 'SEO Keywords', 0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Дамп структуры для таблица cms.stud.product_to_category
CREATE TABLE IF NOT EXISTS `product_to_category` (
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы cms.stud.product_to_category: ~43 rows (приблизительно)
/*!40000 ALTER TABLE `product_to_category` DISABLE KEYS */;
INSERT INTO `product_to_category` (`category_id`, `product_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(2, 18),
	(2, 19),
	(2, 20),
	(2, 21),
	(2, 22),
	(2, 23),
	(2, 24),
	(2, 25),
	(3, 26),
	(3, 27),
	(3, 28),
	(3, 29),
	(3, 30),
	(3, 31),
	(3, 32),
	(3, 33),
	(3, 34),
	(3, 35),
	(3, 36),
	(3, 37),
	(4, 38),
	(4, 39),
	(4, 40),
	(4, 41),
	(4, 42),
	(4, 43),
	(5, 45),
	(5, 46),
	(1, 48);
/*!40000 ALTER TABLE `product_to_category` ENABLE KEYS */;

-- Дамп структуры для таблица cms.stud.url_alias
CREATE TABLE IF NOT EXISTS `url_alias` (
  `id_url_alias` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) NOT NULL,
  `alias` varchar(250) NOT NULL,
  PRIMARY KEY (`id_url_alias`),
  UNIQUE KEY `Индекс 2` (`url`),
  UNIQUE KEY `Индекс 3` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы cms.stud.url_alias: ~61 rows (приблизительно)
/*!40000 ALTER TABLE `url_alias` DISABLE KEYS */;
INSERT INTO `url_alias` (`id_url_alias`, `url`, `alias`) VALUES
	(1, 'controller=admin', 'admin'),
	(2, 'controller=product', 'product'),
	(3, 'controller=categories', 'categories'),
	(4, 'controller=recategories', 'recategories'),
	(5, 'controller=reproducts', 'reproducts'),
	(6, 'controller=register', 'register'),
	(7, 'controller=login', 'login'),
	(8, 'controller=user', 'user'),
	(9, 'category_id=1', 'phone'),
	(10, 'category_id=2', 'tablets'),
	(11, 'category_id=3', 'laptops'),
	(12, 'category_id=4', 'tvs'),
	(13, 'category_id=5', 'headsets'),
	(14, 'product_id=1', 'uphone_s1'),
	(15, 'product_id=2', 'uphone_s2'),
	(16, 'product_id=3', 'uphone_s3'),
	(17, 'product_id=4', 'uphone_s4'),
	(18, 'product_id=5', 'motor_m1'),
	(19, 'product_id=6', 'motor_m2'),
	(20, 'product_id=7', 'myphone_6'),
	(21, 'product_id=8', 'myphone_7'),
	(22, 'product_id=9', 'myphone_8'),
	(23, 'product_id=10', 'myphone_9'),
	(24, 'product_id=11', 'mi200'),
	(25, 'product_id=12', 'mi220'),
	(26, 'product_id=13', 'mi299'),
	(27, 'product_id=14', 'mi500'),
	(28, 'product_id=15', 'st_pro_3'),
	(29, 'product_id=16', 'st_pro_5'),
	(30, 'product_id=17', 'st_pro_7'),
	(31, 'product_id=18', 'utab_s1'),
	(32, 'product_id=19', 'utab_s2'),
	(33, 'product_id=20', 'utab_s3'),
	(34, 'product_id=21', 'utab_s4'),
	(35, 'product_id=22', 'mytab_4'),
	(36, 'product_id=23', 'mytab_6'),
	(37, 'product_id=24', 'mytab_8'),
	(38, 'product_id=25', 'mytab_10'),
	(39, 'product_id=26', 'impres_5'),
	(40, 'product_id=27', 'impres_6'),
	(41, 'product_id=28', 'impres_7'),
	(42, 'product_id=29', 'ideal_k8'),
	(43, 'product_id=30', 'ideal_s8'),
	(44, 'product_id=31', 'ideal_g8'),
	(45, 'product_id=32', 'inspiration_55'),
	(46, 'product_id=33', 'inspiration_56'),
	(47, 'product_id=34', 'inspiration_62'),
	(48, 'product_id=35', 'genuis_a-5'),
	(49, 'product_id=36', 'genuis_a-8'),
	(50, 'product_id=37', 'genuis_a-12'),
	(51, 'product_id=38', 'superled_ma'),
	(52, 'product_id=39', 'superled_fu'),
	(53, 'product_id=40', 'superled_tutur'),
	(54, 'product_id=41', 'cutevision_s'),
	(55, 'product_id=42', 'cutevision_x'),
	(56, 'product_id=43', 'cutevision_pro'),
	(57, 'edit_id=1/type=0', 're_category'),
	(59, 'edit_id=2/type=0', 're_product'),
	(60, 'edit_id=3/type=0', 're_user'),
	(61, 'edit_id=1/type=1', 'add_category'),
	(63, 'edit_id=2/type=1', 'add_product'),
	(64, 'edit_id=3/type=1', 'add_user'),
	(65, 'product_id=46', 'headsuper'),
	(67, 'category_id=11', 'a_b_c_d'),
	(68, 'category_id=6', 'Название'),
	(70, 'product_id=48', 'Названиеrete');
/*!40000 ALTER TABLE `url_alias` ENABLE KEYS */;

-- Дамп структуры для таблица cms.stud.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_email` varchar(30) NOT NULL,
  `user_first_name` varchar(30) NOT NULL,
  `user_last_name` varchar(30) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_image` varchar(70) NOT NULL DEFAULT 'default.png',
  `user_reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_status` tinyint(1) NOT NULL DEFAULT '0',
  `user_lastseen_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы cms.stud.user: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `user_email`, `user_first_name`, `user_last_name`, `user_password`, `user_image`, `user_reg_date`, `user_status`, `user_lastseen_date`) VALUES
	(1, 'boorex21997@gmail.com', 'Олег', 'Бритвин', '202cb962ac59075b964b07152d234b70', '000bab6f990163927f68a9847963e9a4.png', '2018-03-04 15:19:08', 0, '2018-03-04 15:47:40'),
	(2, 'sergey.jmih@gmail.com', 'Сергей', 'Жмышенко', '202cb962ac59075b964b07152d234b70', 'default.png', '2018-03-04 15:38:16', 0, '2018-03-04 15:47:22'),
	(3, 'boorex@gmail.com', 'oleg', 'britvin', '202cb962ac59075b964b07152d234b70', 'default.png', '2018-03-10 15:44:18', 0, NULL),
	(4, 'vasilisa@gmail.com', 'vasya', 'pupkin', '202cb962ac59075b964b07152d234b70', 'default.png', '2018-03-10 19:38:39', 0, NULL),
	(5, 'sveta.ukrain@gmail.com', 'Светлана', 'Украина', '202cb962ac59075b964b07152d234b70', 'default.png', '2018-03-13 12:07:39', 0, NULL),
	(6, 'pugalo@oma.de', 'Пугало', 'Петровно', '202cb962ac59075b964b07152d234b70', 'default.png', '2018-03-17 18:50:41', 0, NULL),
	(7, 'boo@ggg.ru', 'das', 'asd', '81dc9bdb52d04dc20036dbd8313ed055', 'b984d3b5f10deacd1a7f2ef6f80cf315.jpg', '2018-03-22 15:15:25', 0, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
