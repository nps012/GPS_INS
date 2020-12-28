-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: `rdfJourney` ;


--
-- Table structure for table `agentJourney`
--
use rdfJourney;

DROP TABLE IF EXISTS `agentJourney`;
CREATE TABLE `agentJourney` (
  `agentJourneyId` varchar(255) NOT NULL,
  `agentId` varchar(255) NOT NULL,
  `leadId` varchar(100) NOT NULL,
  `genratedLink` text,
  `expiaryTime` datetime DEFAULT NULL,
  `isExpired` tinyint(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `isConsumed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`agentJourneyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cityStateMapping`
--

DROP TABLE IF EXISTS `cityStateMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cityStateMapping` (
  `id` int(11) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `stateCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `customer`
--


--
-- Table structure for table `journey`
--

DROP TABLE IF EXISTS `journey`;
CREATE TABLE `journey` (
  `journeyId` varchar(255) NOT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `lastPage` varchar(45) DEFAULT NULL,
  `defaultLanguage` varchar(10) DEFAULT NULL,
  `urnNumber` varchar(45) DEFAULT NULL,
  `leadCustomerId` varchar(45) DEFAULT NULL,
  `leadId` varchar(100) DEFAULT NULL,
  `isNDNC` tinyint(1) DEFAULT NULL,
  `isMITC` tinyint(1) DEFAULT NULL,
  `isFATCA` tinyint(1) DEFAULT NULL,
  `isOtpVerified` tinyint(1) DEFAULT NULL,
  `isCKYC` tinyint(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `isNDNCTimestamp` datetime DEFAULT NULL,
  `isMITCTimeStamp` datetime DEFAULT NULL,
  `isFATCATimeStamp` datetime DEFAULT NULL,
  `isCKYCTimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`journeyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customerId` varchar(255) NOT NULL,
  `journeyId` varchar(255) NOT NULL,
  `customerDetails` text,
  `deliveryAddress` text,
  `officeAddress` text,
  `permanentAddress` text,
  `residenceAddress` text,
  `ckycInfo` text,
  `appointmentInfo` text,
  `bankDetails` text,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `scheduleDetails` text,
  PRIMARY KEY (`customerId`),
  KEY `fk_customer_journey_idx` (`journeyId`),
  CONSTRAINT `fk_customer_journey` FOREIGN KEY (`journeyId`) REFERENCES `journey` (`journeyId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `callBackRequest`;

CREATE TABLE IF NOT EXISTS `callBackRequest` (
  `callBackRequestId` VARCHAR(255) NOT NULL,
  `urnNumber` VARCHAR(45) NOT NULL,
  `requestedTime` datetime DEFAULT NULL,
  `ipAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`callBackRequestId`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `roiConvUpdate`;

CREATE TABLE IF NOT EXISTS `roiConvUpdate` (
  `roiConvUpdateId` VARCHAR(255) NOT NULL,
  `ipAddress` VARCHAR(100) NULL,
  `agentId` VARCHAR(255) NULL,
  `leadId` VARCHAR(100) NULL,
  `rateOfInterest` VARCHAR(10) NULL,
  `convenienceFee` VARCHAR(10) NULL,
  `requestedTime` DATETIME DEFAULT NULL,
  PRIMARY KEY (`roiConvUpdateId`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `rdfJourney`.`roiConvUpdate` 
CHANGE COLUMN `leadId` `urnNumber` VARCHAR(100) NULL DEFAULT NULL ;

ALTER TABLE `rdfJourney`.`journey` 
ADD COLUMN `isThirdPartyConsent` TINYINT(1) NULL AFTER `isCKYCTimeStamp`,
ADD COLUMN `isThirdPartyConsentTimeStamp` DATETIME NULL AFTER `isThirdPartyConsent`;


ALTER TABLE `rdfJourney`.`customer` 
ADD COLUMN `feedBack` TEXT NULL AFTER `scheduleDetails`;

ALTER TABLE `rdfJourney`.`journey` 
ADD COLUMN `SIEmandateCompleted` VARCHAR(45) NULL AFTER `isThirdPartyConsentTimeStamp`,
ADD COLUMN `SIEmandateFlag` VARCHAR(45) NULL AFTER `SIEmandateCompleted`,
ADD COLUMN `accountNumber` VARCHAR(45) NULL AFTER `SIEmandateFlag`,
ADD COLUMN `clickWrapEligible` VARCHAR(45) NULL AFTER `accountNumber`,
ADD COLUMN `clickWrapCompleted` VARCHAR(45) NULL AFTER `clickWrapEligible`;


ALTER TABLE `rdfJourney`.`journey` 
ADD COLUMN `razorPayResponse` VARCHAR(255) NULL AFTER `clickWrapCompleted`;
