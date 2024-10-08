USE SALESDB;
GO

--SET IDENTITY_INSERT dbo.Sales_Denormalized OFF;
--GO

-- Insert the data into sales_denormalized
INSERT INTO dbo.Sales_Denormalized (SalesPersonId, SalesPersonFirstName, SalesPersonLastName, Region, SalesDate, SalesAmount, Customer)
VALUES
(4, 'Bob', 'Johnson', 'West', '2023-10-23', 1866, 'Beta Inc'),
(5, 'Eve', 'Davis', 'North', '2024-08-15', 3382, 'Acme Corp'),
(3, 'Alice', 'Brown', 'East', '2024-01-10', 4581, 'Omega Enterprises'),
(5, 'Eve', 'Davis', 'North', '2023-11-26', 2091, 'Delta Co'),
(2, 'Jane', 'Smith', 'South', '2024-01-21', 1246, 'Sigma Solutions'),
(3, 'Alice', 'Brown', 'East', '2024-04-16', 2899, 'Gamma LLC'),
(2, 'Jane', 'Smith', 'South', '2023-12-19', 1825, 'Acme Corp'),
(4, 'Bob', 'Johnson', 'West', '2023-09-10', 3005, 'Epsilon Ltd'),
(1, 'John', 'Doe', 'North', '2023-11-03', 1882, 'Zeta Partners'),
(5, 'Eve', 'Davis', 'North', '2024-07-05', 1444, 'Beta Inc'),
(3, 'Alice', 'Brown', 'East', '2023-12-12', 1323, 'Omega Enterprises'),
(1, 'John', 'Doe', 'North', '2024-02-18', 4870, 'Gamma LLC'),
(1, 'John', 'Doe', 'North', '2023-11-27', 1162, 'Delta Co'),
(4, 'Bob', 'Johnson', 'West', '2024-04-05', 3081, 'Acme Corp'),
(5, 'Eve', 'Davis', 'North', '2024-03-18', 2654, 'Sigma Solutions'),
(2, 'Jane', 'Smith', 'South', '2024-08-05', 3569, 'Epsilon Ltd'),
(3, 'Alice', 'Brown', 'East', '2024-06-26', 2124, 'Omega Enterprises'),
(4, 'Bob', 'Johnson', 'West', '2023-11-07', 1802, 'Beta Inc'),
(1, 'John', 'Doe', 'North', '2024-05-02', 3897, 'Zeta Partners'),
(2, 'Jane', 'Smith', 'South', '2024-02-25', 2336, 'Acme Corp');

GO

INSERT INTO dbo.Region(Name)
SELECT DISTINCT Region
  FROM Sales_Denormalized;

/*VALUES
('North'),
('South'),
('East'),
('West');
*/

INSERT INTO dbo.Customer(Name)
SELECT DISTINCT Customer
FROM Sales_Denormalized;
/*
VALUES
('Acme Corp'),
('Beta Inc'),
('Delta Co'),
('Epsilon Ltd'),
('Gamma LLC'),
('Omega Enterprises'),
('Sigma Solutions'),
('Zeta Partners');
*/
/*
INSERT INTO dbo.SalesPerson(FirstName, LastName, RegionId)
VALUES
('John', 'Doe', 1),
('Jane', 'Smith', 2),
('Alice', 'Brown', 3),
('Bob', 'Johnson', 4),
('Eve', 'Davis', 1);
*/
INSERT INTO SalesPerson (FirstName, LastName, RegionId)
SELECT DISTINCT sd.SalesPersonFirstName, sd.SalesPersonLastName, r.ID
	FROM Sales_Denormalized sd
		Join Region r ON r.Name = sd.Region; 

INSERT INTO dbo.Sales(SalesPersonId, SalesDate, SalesAmount, CustomerId)
SELECT DISTINCT sp.Id, SalesDate, SalesAmount, c.Id
	FROM Sales_Denormalized sd
	JOIN SalesPerson sp ON sd.SalesPersonFirstName = sp.FirstName AND sd.SalesPersonLastName = sp.LastName
	JOIN Customer c ON sd.Customer = c.Name;
	

/*INSERT INTO dbo.Sales(SalesPersonId, SalesDate, SalesAmount, CustomerId)
VALUES
(2, '2024-02-29', 1483, 1),
(5, '2024-02-04', 1601, 1),
(5, '2024-08-15', 3382, 1),
(1, '2023-12-08', 3090, 2),
(3, '2024-04-09', 1692, 2),
(3, '2024-05-12', 4040, 2),
(3, '2023-10-04', 4341, 2),
(4, '2023-10-23', 1866, 2),
(5, '2023-11-26', 2091, 3),
(2, '2023-12-24', 4833, 4),
(1, '2024-04-27', 1336, 5),
(5, '2023-09-23', 1546, 5),
(1, '2024-07-10', 4263, 6),
(2, '2024-04-06', 3722, 6),
(2, '2024-07-01', 4930, 6),
(3, '2024-04-28', 2757, 6),
(3, '2024-01-10', 4581, 6),
(2, '2024-01-21', 1246, 7),
(3, '2024-01-08', 3738, 7),
(3, '2024-04-22', 4809, 8),
(2, '2024-08-21', 9600, 8),
(3, '2024-08-20', 2300, 4),
(4, '2024-08-21', 5600, 5);

*/

--validate the inserts
-- 4 table join (Sales - Salesperson - Region - Customer)

SELECT 'Join', SP. FirstName, SP.LastName,R.Name AS RegionName, SalesDate, SalesAmount, C.Name
FROM Sales S
JOIN Salesperson SP ON SP.Id = S.SalesPersonId
JOIN Region R ON R.Id = SP.RegionId
JOIN Customer C ON C.Id = S.CustomerId
ORDER BY SalesAmount;

SELECT 'Raw Data',  SalesPersonFirstName, SalesPersonLastName, Region, SalesDate, SalesAmount, Customer
FROM Sales_Denormalized
ORDER BY SalesAmount;