-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 1972_Mustang_Restoration
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `1972_Mustang_Restoration` ;

-- -----------------------------------------------------
-- Schema 1972_Mustang_Restoration
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `1972_Mustang_Restoration` DEFAULT CHARACTER SET utf8 ;
USE `1972_Mustang_Restoration` ;

-- -----------------------------------------------------
-- Table `restoration_parts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restoration_parts` ;

CREATE TABLE IF NOT EXISTS `restoration_parts` (
  `id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier for each part.',
  `part_name` VARCHAR(255) NOT NULL COMMENT 'The common name of the part.\nex. \"Alternator\", \"Rear Bumper\", \"Seat Cover\"',
  `category` VARCHAR(100) NULL COMMENT 'The general category that the part belongs to. Use data validation to create a dropdown list.\n\"Engine\", \"Bodywork\", \"Interior\"',
  `condition` VARCHAR(100) NULL COMMENT 'The condition of the part when purchased.\n\"New\", \"Used\", \"Refurbished\"',
  `date_purchased` DATETIME NULL COMMENT 'The date the part was purchased',
  `purchase_price` DECIMAL(10,2) NULL COMMENT 'The cost of the part. ',
  `supplier_name` VARCHAR(255) NULL COMMENT 'The name of the store or individual from whom the part was purchased.',
  `date_installed` DATETIME NULL COMMENT 'The date when the part was installed. ',
  `installation_notes` VARCHAR(1000) NULL COMMENT 'Any relevant notes about the installation process.\n\"Took 2 hours, needed extra bolts.\"',
  `status` VARCHAR(100) NOT NULL COMMENT 'The current status of the part in the restoration process.\nSuitable for status values like \"Installed\", \"Pending Installation\", \"To Buy\"; A part should always have a status (e.g., \"To Buy\", \"Pending Installation\").',
  `warranty_info` VARCHAR(255) NULL COMMENT 'Information about the part\'s warranty.\n\"2 years\", \"No warranty\", \"90 days\"',
  `photo_url` VARCHAR(2083) NULL COMMENT '2083 is the maximum length for a URL in web browsers;\nA link to a photo of the part or the part installed in the car.\n\"http://example.com/photo.jpg\"',
  `vehicle_section` VARCHAR(100) NULL COMMENT 'The section of the vehicle where the part is used.\nTo denote areas of the vehicle like \"Front\", \"Rear\", \"Under hood\", etc.',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS student;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'student' IDENTIFIED BY 'student';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'student';
SET SQL_MODE = '';
DROP USER IF EXISTS ashlmasc;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'ashlmasc' IDENTIFIED BY 'password';

GRANT ALL ON * TO 'ashlmasc';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'ashlmasc';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `restoration_parts`
-- -----------------------------------------------------
START TRANSACTION;
USE `1972_Mustang_Restoration`;
INSERT INTO `restoration_parts` (`id`, `part_name`, `category`, `condition`, `date_purchased`, `purchase_price`, `supplier_name`, `date_installed`, `installation_notes`, `status`, `warranty_info`, `photo_url`, `vehicle_section`) VALUES (1, 'Alternator', 'Engine', 'New', '2024-02-15', 150.00, 'Auto Parts Co.', NULL, NULL, 'To be Installed', '2 years', 'http://example.com/alternator.jpg', 'Engine Bay');
INSERT INTO `restoration_parts` (`id`, `part_name`, `category`, `condition`, `date_purchased`, `purchase_price`, `supplier_name`, `date_installed`, `installation_notes`, `status`, `warranty_info`, `photo_url`, `vehicle_section`) VALUES (2, 'Rear Bumper', 'Bodywork', 'Refurbished', '2024-03-01', 200.00, 'Classic Car Parts Ltd.', NULL, 'Paint to match car color before installation.', 'Pending Installation', NULL, 'http://example.com/rearbumper.jpg', 'Rear');
INSERT INTO `restoration_parts` (`id`, `part_name`, `category`, `condition`, `date_purchased`, `purchase_price`, `supplier_name`, `date_installed`, `installation_notes`, `status`, `warranty_info`, `photo_url`, `vehicle_section`) VALUES (3, 'Seat Cover', 'Interior', 'New', '2024-01-20', 300.00, 'Luxury Interiors Inc.', '2024-02-10', 'Custom fit required for front seats.', 'Installed', '1 year', 'http://example.com/seatcovers.jpg', 'Interior');
INSERT INTO `restoration_parts` (`id`, `part_name`, `category`, `condition`, `date_purchased`, `purchase_price`, `supplier_name`, `date_installed`, `installation_notes`, `status`, `warranty_info`, `photo_url`, `vehicle_section`) VALUES (4, 'Front Grill', 'Bodywork', 'Used', NULL, NULL, NULL, NULL, NULL, 'To Buy', NULL, NULL, 'Front');
INSERT INTO `restoration_parts` (`id`, `part_name`, `category`, `condition`, `date_purchased`, `purchase_price`, `supplier_name`, `date_installed`, `installation_notes`, `status`, `warranty_info`, `photo_url`, `vehicle_section`) VALUES (5, 'Headlights', 'Electrical', 'New', '2024-03-05', 120.00, 'Bright Lights Shop', NULL, NULL, 'Pending Installation', '6 months', NULL, 'Front');

COMMIT;

