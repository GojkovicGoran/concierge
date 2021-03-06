DROP SCHEMA IF EXISTS `concierge`;
CREATE SCHEMA `concierge` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

CREATE TABLE `concierge`.`country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247;

INSERT INTO `concierge`.`country` VALUES (1,'Andorra');
INSERT INTO `concierge`.`country` VALUES (2,'Albania');
INSERT INTO `concierge`.`country` VALUES (3,'Austria');
INSERT INTO `concierge`.`country` VALUES (4,'Ăland');
INSERT INTO `concierge`.`country` VALUES (5,'Bosnia and Herzegovina');
INSERT INTO `concierge`.`country` VALUES (6,'Belgium');
INSERT INTO `concierge`.`country` VALUES (7,'Bulgaria');
INSERT INTO `concierge`.`country` VALUES (8,'Belarus');
INSERT INTO `concierge`.`country` VALUES (9,'Switzerland');
INSERT INTO `concierge`.`country` VALUES (10,'Czech Republic');
INSERT INTO `concierge`.`country` VALUES (11,'Germany');
INSERT INTO `concierge`.`country` VALUES (12,'Denmark');
INSERT INTO `concierge`.`country` VALUES (13,'Estonia');
INSERT INTO `concierge`.`country` VALUES (14,'Spain');
INSERT INTO `concierge`.`country` VALUES (15,'Finland');
INSERT INTO `concierge`.`country` VALUES (16,'Faroe Islands');
INSERT INTO `concierge`.`country` VALUES (17,'France');
INSERT INTO `concierge`.`country` VALUES (18,'United Kingdom');
INSERT INTO `concierge`.`country` VALUES (19,'Guernsey');
INSERT INTO `concierge`.`country` VALUES (20,'Gibraltar');
INSERT INTO `concierge`.`country` VALUES (21,'Greece');
INSERT INTO `concierge`.`country` VALUES (22,'Croatia');
INSERT INTO `concierge`.`country` VALUES (23,'Hungary');
INSERT INTO `concierge`.`country` VALUES (24,'Ireland');
INSERT INTO `concierge`.`country` VALUES (25,'Isle of Man');
INSERT INTO `concierge`.`country` VALUES (26,'Iceland');
INSERT INTO `concierge`.`country` VALUES (27,'Italy');
INSERT INTO `concierge`.`country` VALUES (28,'Jersey');
INSERT INTO `concierge`.`country` VALUES (29,'Liechtenstein');
INSERT INTO `concierge`.`country` VALUES (30,'Lithuania');
INSERT INTO `concierge`.`country` VALUES (31,'Luxembourg');
INSERT INTO `concierge`.`country` VALUES (32,'Latvia');
INSERT INTO `concierge`.`country` VALUES (33,'Monaco');
INSERT INTO `concierge`.`country` VALUES (34,'Moldova');
INSERT INTO `concierge`.`country` VALUES (35,'Montenegro');
INSERT INTO `concierge`.`country` VALUES (36,'Macedonia');
INSERT INTO `concierge`.`country` VALUES (37,'Malta');
INSERT INTO `concierge`.`country` VALUES (38,'Netherlands');
INSERT INTO `concierge`.`country` VALUES (39,'Norway');
INSERT INTO `concierge`.`country` VALUES (40,'Poland');
INSERT INTO `concierge`.`country` VALUES (41,'Portugal');
INSERT INTO `concierge`.`country` VALUES (42,'Romania');
INSERT INTO `concierge`.`country` VALUES (43,'Serbia');
INSERT INTO `concierge`.`country` VALUES (44,'Russian Federation');
INSERT INTO `concierge`.`country` VALUES (45,'Sweden');
INSERT INTO `concierge`.`country` VALUES (46,'Slovenia');
INSERT INTO `concierge`.`country` VALUES (47,'Svalbard and Jan Mayen Islands');
INSERT INTO `concierge`.`country` VALUES (48,'Slovakia');
INSERT INTO `concierge`.`country` VALUES (49,'San Marino');
INSERT INTO `concierge`.`country` VALUES (50,'Ukraine');
INSERT INTO `concierge`.`country` VALUES (51,'Vatican City');

CREATE TABLE `concierge`.`hotel` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `rating` TINYINT(4) NOT NULL,
  `address` VARCHAR(128) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `zip` VARCHAR(5) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `city` VARCHAR(64) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `country_id` INT(11) NOT NULL,
  `phone` VARCHAR(45) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `fax` VARCHAR(45) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `email` VARCHAR(45) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `website` VARCHAR(45) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `description` VARCHAR(500) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `check_in` TIME(0) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `check_out` TIME(0) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_hotel_country` (`country_id` ASC),
  CONSTRAINT `fk_hotel_country` FOREIGN KEY (`country_id`) REFERENCES `concierge`.`country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `concierge`.`facility_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facility_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

INSERT INTO `concierge`.`facility_type` VALUES (1,'Restaurants');
INSERT INTO `concierge`.`facility_type` VALUES (2,'Bars');
INSERT INTO `concierge`.`facility_type` VALUES (3,'Recreations');
INSERT INTO `concierge`.`facility_type` VALUES (4,'Wellness');


CREATE TABLE `concierge`.`facility` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `facility_name` VARCHAR(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor` SMALLINT(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` VARCHAR(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` VARCHAR(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facility_type_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_facility_facility_type1_idx` (`facility_type_id` ASC),
  CONSTRAINT `fk_facility_facility_type1`
    FOREIGN KEY (`facility_type_id`)
    REFERENCES `concierge`.`facility_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `concierge`.`bed_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `concierge`.`bed_type` VALUES (1, 'One double bed');
INSERT INTO `concierge`.`bed_type` VALUES (2, 'One single bed');
INSERT INTO `concierge`.`bed_type` VALUES (3, 'Two single beds');
INSERT INTO `concierge`.`bed_type` VALUES (4, 'One queen bed');
INSERT INTO `concierge`.`bed_type` VALUES (5, 'One king bed');

 CREATE TABLE `concierge`.`feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `concierge`.`feature` VALUES (1,'Air Condition');
INSERT INTO `concierge`.`feature` VALUES (2,'Free WiFi');
INSERT INTO `concierge`.`feature` VALUES (3,'MiniBar');
INSERT INTO `concierge`.`feature` VALUES (4,'Phone');

CREATE TABLE `concierge`.`room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_people` tinyint(4) NOT NULL,
  `number_of_kids` tinyint(4) NOT NULL,
  `size` tinyint(4) NOT NULL,
  `image` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bed_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`bed_id`) REFERENCES `concierge`.`bed_type` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `concierge`.`room_type_feature` (
  `room_type_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  FOREIGN KEY (`room_type_id`) REFERENCES `concierge`.`room_type` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (`feature_id`) REFERENCES `concierge`.`feature` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `concierge`.`room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(4) NOT NULL,
  `floor_number` tinyint(4) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`room_type_id`) REFERENCES `concierge`.`room_type` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
