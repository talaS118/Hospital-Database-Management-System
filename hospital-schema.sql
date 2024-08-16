DROP DATABASE IF EXISTS hospital;

CREATE DATABASE hospital;

USE hospital;

CREATE TABLE Room (
    roomID INT NOT NULL,
    capacity INT,
    feePerNight DECIMAL(9, 2),
    PRIMARY KEY (roomID)
);


CREATE TABLE Employee (
    employeeID INT NOT NULL,
    name VARCHAR(100),
    certificationNumber VARCHAR(50),
    street VARCHAR(50),
    city VARCHAR(25),
    state VARCHAR(25),
    phoneNumber CHAR(15),
	PRIMARY KEY (employeeID)
);


CREATE TABLE Patient (
    patientID INT NOT NULL,
    name VARCHAR(100),
    address VARCHAR(200),
    phoneNumber CHAR(15),
    PRIMARY KEY (patientID)
);


CREATE TABLE Physician (
    employeeID INT NOT NULL,
    fieldOfExpertise VARCHAR(50),
	PRIMARY KEY (employeeID),
    FOREIGN KEY (employeeID) REFERENCES Employee(employeeID)
);


CREATE TABLE Nurse (
    employeeID INT NOT NULL,
    PRIMARY KEY (employeeID),
    FOREIGN KEY (employeeID) REFERENCES Employee(employeeID)
);


CREATE TABLE HealthRecord (
    healthRecordID INT NOT NULL,
    disease VARCHAR(100),
    date DATE,
    status VARCHAR(50),
    description VARCHAR(1000),
    patientID INT,
    PRIMARY KEY (healthRecordID),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID)
);


CREATE TABLE Instruction (
    instructionID INT NOT NULL,
    description VARCHAR(1000),
    fee DECIMAL(9, 2), 
    PRIMARY KEY (instructionID)
);


CREATE TABLE Payable (
    payableID INT NOT NULL,
    amount DECIMAL(9, 2),
    description VARCHAR(1000),
    date DATE, 
    PRIMARY KEY (payableID)
);


CREATE TABLE Payment (
    paymentID INT NOT NULL,
    date DATE,
    amount DECIMAL(9, 2),
    PRIMARY KEY (paymentID)
);


CREATE TABLE Medication (
    medID INT NOT NULL,
    medType VARCHAR(50),
    amount DECIMAL(9, 2),
    PRIMARY KEY (medID)
);

CREATE TABLE Invoice (
    accountNumber INT NOT NULL,
    issueDate DATE,
    startDate DATE,
    endDate DATE, 
    PRIMARY KEY (accountNumber)
);


CREATE TABLE providesService (
    employeeID INT,
    patientID INT,
    PRIMARY KEY (employeeID, patientID),
    FOREIGN KEY (employeeID) REFERENCES Employee(employeeID),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID)
);


CREATE TABLE assigned (
    roomID INT,
    patientID INT,
    checkInDate DATE,
    checkOutDate DATE,
    PRIMARY KEY (roomID, patientID, checkInDate),
    FOREIGN KEY (roomID) REFERENCES Room(roomID),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID)
);


CREATE TABLE monitors (
    employeeID INT,
    patientID INT,
    startDate DATE,
    endDate DATE,
    PRIMARY KEY (employeeID, patientID, startDate),
    FOREIGN KEY (employeeID) REFERENCES Physician(employeeID),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID)
);


CREATE TABLE executes (
    employeeID INT,
    instructionID INT,
    status VARCHAR(100),
    execution VARCHAR(100),
    PRIMARY KEY (employeeID, instructionID),
    FOREIGN KEY (employeeID) REFERENCES Nurse(employeeID),
    FOREIGN KEY (instructionID) REFERENCES Instruction(instructionID)
);


CREATE TABLE administers (
    employeeID INT,
    medID INT,
    patientID INT,
    dateOfAdminister DATE,
    PRIMARY KEY (employeeID, medID, patientID, dateOfAdminister),
    FOREIGN KEY (employeeID) REFERENCES Nurse(employeeID),
    FOREIGN KEY (medID) REFERENCES Medication(medID),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID)
);


CREATE TABLE orders (
    employeeID INT,
    instructionID INT,
    patientID INT,
    PRIMARY KEY (employeeID, instructionID),
    FOREIGN KEY (employeeID) REFERENCES Physician(employeeID),
    FOREIGN KEY (instructionID) REFERENCES Instruction(instructionID),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID)
);
