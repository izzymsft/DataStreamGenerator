IF OBJECT_ID('dbo.Patients', 'U') IS NOT NULL 
  DROP TABLE dbo.Patients; 

CREATE TABLE dbo.Patients --- Stores information about the Patients
(
    TransactionId int IDENTITY (1,1) NOT NULL,   --- Primary Key for the Score
    PatientId VARCHAR(40) NOT NULL,              --- Id Uniquely Identifies the Patient
    FirstName VARCHAR(32) NOT NULL,              --- Id Uniquely Identifies the Patient
    LastName VARCHAR(32) NOT NULL,               --- Id Uniquely Identifies the Patient
    Gender CHAR(1) NOT NULL,                     --- Gender of Patient 
    BodyWeight DECIMAL(5,2) NOT NULL,            --- The Patient Body Weight
    DateOfBirth date NOT NULL,                   --- The Patient DOB
    StreetAddress VARCHAR(64) NOT NULL,          --- Street Address
    StreetAddress2 VARCHAR(64) NOT NULL,         --- Additional information about the Street Address
    City VARCHAR(32) NOT NULL,                   --- Name of City 
    StateProvince VARCHAR(32) NOT NULL,          --- State or Province
    Zipcode VARCHAR(5) NOT NULL,                 --- Postal Code or Zipcode
    PCP VARCHAR(255) NOT NULL,                   --- Primary Care Physician for the Patient
    EmergencyContactName VARCHAR(64) NOT NULL,   --- Full Name of Emergency Contact
    EmergencyRelationship VARCHAR(16) NOT NULL,  --- Relationship to Emergency Contact
    EmergencyContactPhone VARCHAR(64) NOT NULL,  --- Phone Number of Emergency Contact
    DateCreated datetime2 NOT NULL               --- The timestamp for when this record was created
);

IF OBJECT_ID('dbo.Hospitals', 'U') IS NOT NULL 
  DROP TABLE dbo.Hospitals; 

CREATE TABLE dbo.Hospitals --- Stores information about the Hospitals
(
    HospitalId int IDENTITY (1,1) NOT NULL,  --- Primary Key for the Score
    HospitalName VARCHAR(64) NOT NULL,       --- Name of the Hospital
    StreetAddress VARCHAR(64) NOT NULL,      --- Street Address
    StreetAddress2 VARCHAR(64) NOT NULL,     --- Additional information about the Street Address
    City VARCHAR(32) NOT NULL,               --- Name of City 
    StateProvince VARCHAR(32) NOT NULL,      --- State or Province
    Zipcode VARCHAR(5) NOT NULL,             --- Postal Code or Zipcode
    AnnualBudget DECIMAL(15,2) NOT NULL,     --- Annual Budget for the Hospital
    BedCount int NOT NULL,                   --- Number of Beds in the Facility
    DateCreated datetime2 NOT NULL           --- The timestamp for when this record was created
);