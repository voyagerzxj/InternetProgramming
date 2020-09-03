/* Create procedures: 1. Add Employee
	2. Change Employee Job
	3. New Patient
	4. Patient leave from hospital
	Views: 1.Availale Rooms
	2.Available Insurance Coverage left
	Function: 1.Total billing sum of one given visit
	2. Total billing sum paid by insurance company of a given patient
*/
USE master
GO


IF DB_ID('HealthcareCenter') IS NOT NULL
	DROP DATABASE HealthcareCenter;
GO

CREATE DATABASE HealthcareCenter;
GO 

USE HealthcareCenter;
GO

IF OBJECT_ID('VisitHistory') IS NOT NULL
	DROP TABLE VisitHistory
GO

IF OBJECT_ID('RoomDevices') IS NOT NULL
	DROP TABLE RoomDevices
GO

IF OBJECT_ID('Devices') IS NOT NULL
	DROP TABLE Devices
GO

IF OBJECT_ID('Vistors') IS NOT NULL
	DROP TABLE Vistors
GO

IF OBJECT_ID('Billings') IS NOT NULL
	DROP TABLE Billings
GO

IF OBJECT_ID('PatientHealthHistory') IS NOT NULL
	DROP TABLE PatientHealthHistory
GO

IF OBJECT_ID('Patients') IS NOT NULL
	DROP TABLE Patients
GO

IF OBJECT_ID('EmployeeCareers') IS NOT NULL
	DROP TABLE EmployeeCareers
GO

IF OBJECT_ID('EmployeePersonalInfo') IS NOT NULL
	DROP TABLE EmployeePersonalInfo
GO

IF OBJECT_ID('Insurances') IS NOT NULL
	DROP TABLE Insurances
GO

IF OBJECT_ID('Patients') IS NOT NULL
	DROP TABLE Patients
GO

IF OBJECT_ID('Jobs') IS NOT NULL
	DROP TABLE Jobs
GO

IF OBJECT_ID('Contracts') IS NOT NULL
	DROP TABLE Contracts
GO

IF OBJECT_ID('Offices') IS NOT NULL
	DROP TABLE Offices
GO

IF OBJECT_ID('Department') IS NOT NULL
   DROP TABLE Department
go

IF OBJECT_ID('MedicationCosts') IS NOT NULL
	DROP TABLE MedicationCosts
GO

IF OBJECT_ID('ProcedureCosts') IS NOT NULL
	DROP TABLE ProcedureCosts
GO

IF OBJECT_ID('Rooms') IS NOT NULL
	DROP TABLE Rooms
GO

CREATE TABLE Jobs (
  JobID    INT           PRIMARY KEY  IDENTITY,
  JobName  VARCHAR(200)  NOT NULL
);
 
CREATE TABLE Contracts (
  ContractID    INT           PRIMARY KEY  IDENTITY,
  ContractType  VARCHAR(200)  NOT NULL,
  ContractTerm  VARCHAR(500)  NOT NULL
);

CREATE TABLE Department(
DepartmentName   varchar(200)   not null PRIMARY KEY,
Description      varchar(500)   not null 
)



CREATE TABLE EmployeePersonalInfo(
  EmployeeID    INT       PRIMARY KEY  IDENTITY,
  FirstName			VARCHAR(200)  NOT NULL,
  LastName			VARCHAR(200)  NOT NULL,
  SSN			VARCHAR(50) NOT NULL CHECK(SSN LIKE '___-__-____'),
  PasswdHash    CHAR(64) not null,
  Address		VARCHAR(200) NOT NULL,
  Phone			VARCHAR(50) NOT NULL CHECK(Phone LIKE '___-___-____'),
  Email			VARCHAR(100) NOT NULL CHECK(Email LIKE '%@%'),
  Reviews		VARCHAR(500) NOT NULL DEFAULT 'NOT NULL'
);
 
CREATE TABLE EmployeeCareers (
   EmployeeID   INT  PRIMARY KEY REFERENCES EmployeePersonalInfo(EmployeeID),
   JobID INT  REFERENCES Jobs(JobID) NOT NULL,
   Salary		MONEY NOT NULL CHECK(Salary > 0),
   Benefit		MONEY NOT NULL CHECK(Benefit > 0),
   ContractID	INT NOT NULL REFERENCES Contracts(ContractID),
   OfficeID		VARCHAR(200)  NOT NULL,
   DepartementName  VARCHAR(200) NOT null REFERENCES Department(DepartmentName),
   Rating       FLOAT   NOT NULL DEFAULT 0 ,
   Count        INT   NOT NULL DEFAULT 0
);

CREATE TABLE Rooms (
  RoomID    INT PRIMARY KEY  IDENTITY,
  Location	VARCHAR(100) NOT NULL,
  BedNumber	INT NOT NULL DEFAULT 1 CHECK(BedNumber>=1),
  BedType	VARCHAR(100) NOT NULL DEFAULT 'Twin',
  BedInUse	INT NOT NULL DEFAULT 0 CHECK(BedInUse>=0),
  CHECK(BedInUse<=BedNumber)
);

CREATE TABLE Devices (
  DeviceID INT PRIMARY KEY  IDENTITY,
  DeviceName VARCHAR(100) NOT NULL
);

CREATE TABLE RoomDevices (
	RoomID INT REFERENCES Rooms(RoomID),
	DeviceID INT REFERENCES Devices(DeviceID),
	DeviceNumber INT NOT NULL DEFAULT 1,
	UNIQUE(RoomID, DeviceID)
);

CREATE TABLE Insurances (
  InsuranceID INT PRIMARY KEY  IDENTITY,
  InsuranceCompanyName VARCHAR(100) NOT NULL,
  InsuranceCoverage MONEY NOT NULL CHECK(InsuranceCoverage>0)
);

CREATE TABLE Patients (
  PatientID INT PRIMARY KEY  IDENTITY,
  FirstName			VARCHAR(200)  NOT NULL,
  LastName			VARCHAR(200)  NOT NULL,
  SSN			VARCHAR(50) NOT NULL CHECK(SSN LIKE '___-__-____'),
  PasswdHash    CHAR(64) not null,
  Address		VARCHAR(200) NOT NULL,
  Phone			VARCHAR(50) NOT NULL CHECK(Phone LIKE '___-___-____'),
  Email			VARCHAR(100) NOT NULL CHECK(Email LIKE '%@%'),
  SpouseName	VARCHAR(100),
  InsuranceID	INT NOT NULL REFERENCES Insurances(InsuranceID)
);

CREATE TABLE ProcedureCosts (
  ProcedureID INT PRIMARY KEY  IDENTITY,
  ProcedureDescription VARCHAR(100) NOT NULL,
  ProcedureCost MONEY NOT NULL DEFAULT 0 CHECK(ProcedureCost>=0)
);

CREATE TABLE MedicationCosts (
  MedicationID INT PRIMARY KEY  IDENTITY,
  MedicationDescription VARCHAR(100),
  MedicationCost MONEY NOT NULL DEFAULT 0 CHECK(MedicationCost>=0)
);

CREATE TABLE PatientHealthHistory (
  HistoryID INT PRIMARY KEY  IDENTITY,
  EmployeeID  INT REFERENCES EmployeePersonalInfo(EmployeeID),
  CreateTime Datetime NOT NULL,
  AppointmentDate  Date NOT NULL,
  AppointmentTime Time NOT NULL,
  PatientID INT NOT NULL REFERENCES Patients(PatientID),
  Symptoms VARCHAR(500)  DEFAULT 'NO Symptoms',
  Diagnostics VARCHAR(500)  DEFAULT 'Fine',
  ProcedureID INT  REFERENCES ProcedureCosts(ProcedureID) DEFAULT 0,
  MedicationID INT REFERENCES MedicationCosts(MedicationID),
  MedicationNumber INT  DEFAULT 1 CHECK(MedicationNumber>0),
  RoomID INT  REFERENCES Rooms(RoomID),
  Discharge	VARCHAR(500) DEFAULT 'Cured',
  Rating INT,
  HistoryState   VARCHAR(50) NOT NULL Default 'Pending'--pending/confirmed/canceled/finished
);
 

CREATE TABLE Billings(
  BillingID INT NOT NULL REFERENCES PatientHealthHistory(HistoryID),
  Payor		VARCHAR(100) NOT NULL DEFAULT 'Insurance Company' CHECK(Payor='Insurance Company' OR Payor='Self'),
  PaymentMethod VARCHAR(100) NOT NULL DEFAULT 'Credit Card'
);

CREATE TABLE Vistors (
  VistorID	INT PRIMARY KEY  IDENTITY,
  FirstName	VARCHAR(200)  NOT NULL,
  LastName	VARCHAR(200)  NOT NULL,
  VistorIDNumber VARCHAR(100) NOT NULL,
  Birthday	DATETIME,
  Picture	VARCHAR(100)
);

CREATE TABLE VisitHistory (
  VistorID	INT REFERENCES Vistors(VistorID) NOT NULL,
  HistoryID	INT NOT NULL REFERENCES PatientHealthHistory(HistoryID),
  EntryTime DATETIME NOT NULL,
  ExitTime DATETIME NOT NULL
);

IF OBJECT_ID('fn_BillingOfHistory') IS NOT NULL
	DROP FUNCTION fn_BillingOfHistory
GO

CREATE FUNCTION fn_BillingOfHistory(@VisitID INT) 
	RETURNS MONEY
BEGIN
	RETURN (SELECT MedicationCost*MedicationNumber+ProcedureCost
			FROM PatientHealthHistory JOIN ProcedureCosts
					ON PatientHealthHistory.ProcedureID = ProcedureCosts.ProcedureID
				JOIN MedicationCosts
					ON PatientHealthHistory.MedicationID = MedicationCosts.MedicationID
			WHERE HistoryID = @VisitID)
END
GO

IF OBJECT_ID('sp_AddEmployee') IS NOT NULL
	DROP PROCEDURE sp_AddEmployee
GO

CREATE PROCEDURE sp_AddEmployee
	@FName	VARCHAR(100), @LName	VARCHAR(100), @SSN	VARCHAR(100),@Passwdhash CHAR(64),
	@Address VARCHAR(100),@Phone	VARCHAR(100), @Email VARCHAR(100),
	@JobID	INT,		  @Salary	MONEY,		  @Benefit MONEY,
	@DepartmentName varchar(200),
	@ContractID INT,	  @Office	VARCHAR(200),		 
	@Review VARCHAR(500) = 'No Review',   @Rating float, 
	@Count   INT
AS
BEGIN
	INSERT INTO EmployeePersonalInfo
		VALUES (@FName,@LName,@SSN,@Passwdhash,@Address,@Phone,@Email,@Review);
	DECLARE @NewID INT;
	SELECT @NewID = MAX(EmployeeID)
	FROM EmployeePersonalInfo;
	INSERT INTO EmployeeCareers
		VALUES (@NewID,@JobID,@Salary,@Benefit,@ContractID,@Office,@DepartmentName,@Rating,@Count);
END
GO

IF OBJECT_ID('sp_AddMember') IS NOT NULL
	DROP PROCEDURE sp_AddMember
GO

CREATE PROCEDURE sp_AddMember
    @FirstName	VARCHAR(200), @LastName	VARCHAR(200),@SSN VARCHAR(50) ,
    @PasswdHash CHAR(64) , @Address	VARCHAR(200) ,@Phone VARCHAR(50) , @Email VARCHAR(100) ,
    @SpouseName	VARCHAR(100),@InsuranceID	INT
 AS
 BEGIN
     INSERT INTO Patients
	 VALUES (@FirstName,@LastName,@SSN,@PasswdHash,@Address,@Phone,@Email,@SpouseName,@InsuranceID)
 END
GO


IF OBJECT_ID('sp_ChangeJob') IS NOT NULL
	DROP PROCEDURE sp_ChangeJob
GO

CREATE PROCEDURE sp_ChangeJob
	@PID	INT, @NewJobID	INT,		@Salary	MONEY, @Benefit MONEY,
	@ContractID INT, @OfficeID	INT,	@Start TIME,
	@End TIME
AS
BEGIN
	UPDATE EmployeeCareers
	SET JobID=@NewJobID,Salary=@Salary,Benefit=@Benefit,ContractID=@ContractID,OfficeID=@OfficeID
	WHERE EmployeeID = @PID;
END
GO

IF OBJECT_ID('sp_NewAppointment') IS NOT NULL
	DROP PROCEDURE sp_NewAppointment 
GO

CREATE PROCEDURE sp_NewAppointment
	@PID	INT, @EID  INT, @AppointmentDate  DATE, @AppointmentTime time
AS
BEGIN
		INSERT INTO PatientHealthHistory(EmployeeID, CreateTime, AppointmentDate, AppointmentTime, PatientID, HistoryState)
			VALUES (@EID, GETDATE(),@AppointmentDate,@AppointmentTime,@PID, 'Pending');
END
GO

IF OBJECT_ID('sp_VisitEnd') IS NOT NULL
	DROP PROCEDURE sp_VisitEnd
GO

CREATE PROCEDURE sp_VisitEnd
	@VisitID INT,@DischargeInfo VARCHAR(500),@Payor VARCHAR(100),@PaymentMethod VARCHAR(100)
AS
BEGIN
	UPDATE PatientHealthHistory
	SET Discharge=@DischargeInfo
	WHERE HistoryID=@VisitID;

	INSERT INTO Billings
		VALUES(@VisitID,@Payor,@PaymentMethod);

	DECLARE @PName VARCHAR(100);
	SELECT @PName = FirstName+' '+LastName
	FROM PatientHealthHistory JOIN Patients
		ON PatientHealthHistory.PatientID = Patients.PatientID
	WHERE HistoryID = @VisitID;
	
	DECLARE @BillingSum MONEY;
	SET @BillingSum = dbo.fn_BillingOfVisit(@VisitID);
	PRINT @PName+' has been discharges. He/She is '+@DischargeInfo+'. He has paid $'+CAST(@BillingSum AS VARCHAR(100)); 
END
GO



--Predefine Rooms, Devices, Jobs, Contracts, Offices, Procedures, Medications, Insurances
INSERT INTO Rooms(Location,BedNumber)
	VALUES (101,2),(102,2),(103,2),(201,1),(202,1);

INSERT INTO Devices(DeviceName)
	VALUES ('Stethoscope'),('Microscope'),('CT instrument');

INSERT INTO RoomDevices
	VALUES (1,1,2),(2,1,2),(3,1,2),(4,1,1),(5,1,1),(1,2,2),(2,2,2),(3,2,2),(4,2,1),(5,2,1),(4,3,1),(5,3,1);

INSERT INTO Jobs
	VALUES ('General'),('Cold'),('Stomach'),('Vaccine'),('Head'),('Vital');

INSERT INTO Contracts
	VALUES ('Short','1 Week'),('Long','1 Year'),('Extra Long','5 Year');

INSERT INTO Insurances
	VALUES ('StateFarm',10000),('Geico',50000),('Progressive',100000);

INSERT INTO Department
    VALUES ('General', ''),('EverydayDisease','EverydayDisease'),('SevereDisease','SevereDisease');

INSERT INTO MedicationCosts
	VALUES ('No medicion',0),('For Cold',15),('For Stomach',20),('For Vaccine',100),('For Head',200),('For Vtial',1000);

INSERT INTO Vistors
	VALUES('Tom','Brown','13213','1992-12-14','/root/vistors/1.jpg'),
		('Jim','Brown','43243','1992-12-14','/root/vistors/2.jpg'),
		('Sam','Brown','56532','1992-12-14','/root/vistors/3.jpg');

IF OBJECT_ID('sp_UpdateMember') IS NOT NULL
	DROP PROCEDURE sp_UpdateMember
GO

CREATE PROCEDURE sp_UpdateMember
    @MemberID INT, @FirstName	VARCHAR(200), @LastName	VARCHAR(200),@SSN VARCHAR(50) ,
    @PasswdHash CHAR(64) , @Address	VARCHAR(200) ,@Phone VARCHAR(50) , @Email VARCHAR(100) ,
    @SpouseName	VARCHAR(100),@InsuranceID	INT
 AS
 BEGIN
     UPDATE Patients
	 SET FirstName=@FirstName, LastName=@LastName,SSN=@SSN,PasswdHash=@PasswdHash,Address=@Address,Phone=@Phone,Email
	 =@Email,SpouseName=@SpouseName,InsuranceID=@InsuranceID
	 WHERE PatientID=@MemberID
 END
GO

IF OBJECT_ID('sp_UpdateEmployee') is not null
    Drop Procedure sp_UpdateEmployee
go

CREATE PROCEDURE SP_UpdateEmployee
    @employeeId int, @FName	VARCHAR(100), @LName	VARCHAR(100), @SSN	VARCHAR(100),@Passwdhash char(64),
	@Address VARCHAR(100),@Phone	VARCHAR(100), @Email VARCHAR(100),
	@Review VARCHAR(500) = 'No Review'
AS
BEGIN 
    UPDATE  EmployeePersonalInfo
	set FirstName =@FName , LastName = @LName, SSN = @SSN , PasswdHash = @Passwdhash,
	EmployeePersonalInfo.Address = @Address , Phone = @Phone, Email = @Email, Reviews = @Review 
		where EmployeeID = @employeeId;
end 	
go

IF OBJECT_ID('sp_getDeptEmployees') IS NOT NULL
	DROP PROCEDURE sp_getDeptEmployees
GO

CREATE PROCEDURE sp_getDeptEmployees
    @DeptName VARCHAR(200)
 AS
 BEGIN
     SELECT FirstName,LastName,DepartementName,Rating,Reviews
	 FROM EmployeeCareers JOIN EmployeePersonalInfo
		ON EmployeeCareers.EmployeeID = EmployeePersonalInfo.EmployeeID
	 WHERE DepartementName = @DeptName
 END
GO

IF OBJECT_ID('sp_getEmployeeHistory') IS NOT NULL
	DROP PROCEDURE sp_getEmployeeHistory
GO

CREATE PROCEDURE sp_getEmployeeHistory
    @EmployeeID INT, @ApDate DATE
 AS
 BEGIN
     SELECT *
	 FROM PatientHealthHistory
	 WHERE EmployeeID=@EmployeeID AND 
		(HistoryState='finished'  OR HistoryState='confirmed')
 END
GO

IF OBJECT_id('sp_ApConfirm') is not null 
   drop procedure sp_ApConfirm
go 

CREATE PROCEDURE sp_ApConfirm 
       @HistotyId Int 
AS
Begin  
      Update PatientHealthHistory
	  set HistoryState = 'Confirmed'
	  where HistoryID = @HistotyId
End
go


IF OBJECT_id('sp_ApCancel') is not null 
   drop procedure sp_ApCancel
go 

CREATE PROCEDURE sp_ApCancel 
       @HistotyId Int 
AS
Begin  
      Update PatientHealthHistory
	  set HistoryState = 'Cancelled'
	  where HistoryID = @HistotyId
End
go

IF OBJECT_ID('sp_Rating') is not null
   drop procedure sp_Rating
go

CREATE PROCEDURE sp_Rating
       @rating int , @historyid int , @employeeId int
As 
begin 
       update PatientHealthHistory
	   set    Rating =  @rating
	   where  HistoryID = @historyid

	   update EmployeeCareers
	   set  Rating = (Rating*count+@rating)/(count + 1), count = count +1
	   where  EmployeeID = @employeeId
end
go