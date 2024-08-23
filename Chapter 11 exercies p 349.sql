USE MASTER;
GO

DROP DATABASE IF EXISTS Membership;
GO

CREATE DATABASE Membership;
GO

USE Membership;
GO

CREATE TABLE Individuals (
	IndividualID int PRIMARY KEY IDENTITY(1,1),
	FirstName varchar(20) NOT NULL,
	LastName varchar(20) NOT NULL,
	Address varchar(50) NOT NULL,
	Phone varchar(12) NOT NULL
);

CREATE TABLE GroupMembership (
	GroupID int PRIMARY KEY IDENTITY(1,1),
	IndividualID int NOT NULL,
	FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID),
);

CREATE TABLE Groups (
	GroupID int NOT NULL,
	GroupName varchar(50) PRIMARY KEY NOT NULL,
	Dues money NOT NULL DEFAULT 0 CHECK (Dues >= 0),
	FOREIGN KEY (GroupID) REFERENCES GroupMembership(GroupID),
);