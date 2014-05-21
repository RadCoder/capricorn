SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE DATABASE IF NOT EXISTS `capricorn` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `capricorn`;

CREATE TABLE IF NOT EXISTS `attendingiddefinition` (
  `AttendingID` int(11) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  PRIMARY KEY (`AttendingID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `examcodedefinition` (
  `InternalCode` varchar(18) NOT NULL DEFAULT '',
  `ORG` varchar(7) DEFAULT NULL,
  `ExamCode` varchar(10) DEFAULT NULL,
  `Description` varchar(73) DEFAULT NULL,
  `Department` varchar(10) DEFAULT NULL,
  `Modality` varchar(8) DEFAULT NULL,
  `BodySite` varchar(10) DEFAULT NULL,
  `SubSpecialty` varchar(9) DEFAULT NULL,
  `Rotation` varchar(9) DEFAULT NULL,
  `Section` varchar(6) DEFAULT NULL,
  `Type` varchar(6) DEFAULT NULL,
  `Notes` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`InternalCode`),
  KEY `ExamCode` (`ExamCode`,`ORG`),
  KEY `Rotation` (`ExamCode`,`Notes`,`Section`,`Type`,`ORG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `exammeta` (
  `InternalID` varchar(30) NOT NULL,
  `AccessionNumber` varchar(8) DEFAULT NULL,
  `LastName` varchar(25) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `PatientID` tinyint(11) NOT NULL,
  `ExamCode` varchar(16) DEFAULT NULL,
  `TraineeID` int(11) DEFAULT NULL,
  `AttendingID` int(11) DEFAULT NULL,
  `OrganizationID` int(11) DEFAULT NULL,
  `Organization` varchar(8) NOT NULL,
  `CompletedDTTM` datetime DEFAULT NULL,
  `InquiryDTTM` datetime DEFAULT NULL,
  `DraftDTTM` datetime DEFAULT NULL,
  `PrelimDTTM` datetime DEFAULT NULL,
  `ResidentYear` int(11) DEFAULT NULL,
  PRIMARY KEY (`InternalID`),
  KEY `CompletedDTTM` (`CompletedDTTM`,`ExamCode`,`Organization`),
  KEY `TraineeID` (`TraineeID`,`CompletedDTTM`,`ExamCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `loginmember` (
  `TraineeID` int(11) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `PasswordHash` text NOT NULL,
  PRIMARY KEY (`TraineeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `residentcounts` (
  `UniqueID` varchar(40) NOT NULL,
  `TraineeID` int(11) NOT NULL,
  `ResidentYear` int(2) NOT NULL,
  `CountDT` date NOT NULL,
  `Section` varchar(6) NOT NULL,
  `Type` varchar(6) NOT NULL,
  `Notes` varchar(16) NOT NULL,
  `Count` int(7) NOT NULL,
  PRIMARY KEY (`UniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `residentiddefinition` (
  `TraineeID` int(11) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `MiddleName` varchar(25) NOT NULL DEFAULT '',
  `LastName` varchar(25) NOT NULL,
  `IsCurrentTrainee` varchar(5) NOT NULL DEFAULT 'N',
  `StartDate` date NOT NULL,
  `QGendaName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`TraineeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `residentrotation` (
  `TraineeID` int(11) NOT NULL,
  `Rotation` varchar(25) NOT NULL,
  `RotationStartDate` date NOT NULL,
  `RotationEndDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `residentrotationraw` (
  `UniqueID` varchar(40) NOT NULL,
  `TraineeID` int(11) NOT NULL,
  `Rotation` varchar(25) NOT NULL,
  `RotationStartDate` date NOT NULL,
  `RotationEndDate` date NOT NULL,
  PRIMARY KEY (`UniqueID`),
  KEY `RotationStartDate` (`RotationStartDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;