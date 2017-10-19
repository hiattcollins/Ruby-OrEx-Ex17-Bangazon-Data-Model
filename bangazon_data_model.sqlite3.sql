BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `Employee` (
  `Employee_Id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Employee_FirstName` varchar NOT NULL,
  `Employee_LastName` varchar NOT NULL,
  `Employee_Title` varchar NOT NULL,
  `Empl_Id_If_Supervisor` integer,
  `Dept_Id` integer NOT NULL,
  FOREIGN KEY(`Dept_Id`) REFERENCES `Department`(`Dept_Id`)
);
INSERT INTO `Employee` VALUES (1,'Rick','Grimes','Supervisor',1,1);
INSERT INTO `Employee` VALUES (2,'Carl','Grimes','Junior Developer',NULL,1);
INSERT INTO `Employee` VALUES (3,'Maggie','Greene','Senior Developer',NULL,1);
INSERT INTO `Employee` VALUES (4,'Daryl','Dixon','Supervisor',4,2);

CREATE TABLE IF NOT EXISTS `Department` (
  `Dept_Id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Dept_Name` varchar NOT NULL,
  `Budget` integer NOT NULL,
  `Supervisor` varchar NOT NULL,
  FOREIGN KEY(`Supervisor`) REFERENCES `Employee`(`Employee_Id`)
);
INSERT INTO `Department` VALUES (1,'Operations',1000000,1);
INSERT INTO `Department` VALUES (2,'Exploration',500000,4);

CREATE TABLE IF NOT EXISTS `Computer` (
  `Comp_Id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Purchase_Date` datetime NOT NULL,
  `Decomm_Date` datetime NOT NULL,
  `Employee_Id` integer,
  FOREIGN KEY(`Employee_Id`) REFERENCES `Employee`(`Employee_Id`)
);
INSERT INTO `Computer` VALUES (1,'2017-06-01','2018-12-01',1);
INSERT INTO `Computer` VALUES (2,'2017-04-17','2018-12-09',2);
INSERT INTO `Computer` VALUES (3,'2015-08-01","2017-12-01',3);
INSERT INTO `Computer` VALUES (4,'2017-08-12','2019-02-01',4);

CREATE TABLE IF NOT EXISTS `Training Program` (
  `Training_Id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime NOT NULL,
  `Max_Attendance` integer NOT NULL,
  `Employee_Id` integer NOT NULL,
  FOREIGN KEY(`Employee_Id`) REFERENCES `Employee`(`Employee_Id`)
);
INSERT INTO `Training Program` VALUES (1,'2018-02-01','2018-02-08',12,2);

CREATE TABLE IF NOT EXISTS `Product Types` (
  `Category` varchar NOT NULL PRIMARY KEY
);
INSERT INTO `Prouct Types` VALUES ('Hardware');
INSERT INTO `Prouct Types` VALUES ('Mobile Devices');

CREATE TABLE IF NOT EXISTS `Products` (
  `Product_Id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Product_Title` varchar NOT NULL,
  `Product_Price` integer NOT NULL,
  `Product_Desc` varchar NOT NULL,
  `Product_Type` varchar NOT NULL,
  `Product_Maker` integer NOT NULL,
  FOREIGN KEY(`Product_Type`) REFERENCES `Product Types`(`Category`),
  FOREIGN KEY(`Product_Maker`) REFERENCES `Customer`(`Customer_Id`)
);
INSERT INTO `Products` VALUES (1,'IS200',100,'Small tablet','Mobile Devices',2);
INSERT INTO `Products` VALUES (2,'IS400',200,'Medium tablet','Mobile Devices',2);
INSERT INTO `Products` VALUES (3,'KR400',250,'Stand-alone processor','Hardware',1);

CREATE TABLE IF NOT EXISTS `Orders` (
  `Order_Id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Product_Id` integer NOT NULL,
  `Payment_Id` integer,
  `Customer_Id` integer NOT NULL,
  FOREIGN KEY (`Payment_Id`) REFERENCES `Payment Type`(`Payment_Id`),
  FOREIGN KEY (`Customer_Id`) REFERENCES `Customer`(`Customer_Id`)
);
INSERT INTO `Orders` VALUES (1,2,1,2);
INSERT INTO `Orders` VALUES (2,2,NULL,1);

CREATE TABLE IF NOT EXISTS `Payment Type` (
  `Payment_Id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Payment_Source` varchar NOT NULL,
  `Account_Number` integer NOT NULL,
  `Customer_Id` integer NOT NULL,
  FOREIGN KEY (`Customer_Id`) REFERENCES `Customer`(`Customer_Id`)
);
INSERT INTO `Payment Type` VALUES (1,Visa,111111111,3);
INSERT INTO `Payment Type` VALUES (2,Mastercard,2323232323,1);

CREATE TABLE IF NOT EXISTS `Customer` (
  `Customer_Id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Customer_FirstName` varchar NOT NULL,
  `Customer_LastName` varchar NOT NULL,
  `Customer_AcctDate` datetime NOT NULL,
  `Customer_Active` integer NOT NULL
);
INSERT INTO `Customer` VALUES (1,'Jeffrey','Lebowski','2017-09-03',1);
INSERT INTO `Customer` VALUES (2,'Maude','Lebowski','2017-10-01',1);
INSERT INTO `Customer` VALUES (3,'Bunny','Lebowski','2015-02-01',0);
