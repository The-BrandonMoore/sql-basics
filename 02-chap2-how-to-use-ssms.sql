--Chapter 2 Basic Statements
SELECT * FROM Vendors;

-- Chapter 3 p. 65
SELECT *
  FROM Invoices;

 -- same query, but only show 3 columns and order by invoice total

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
  FROM Invoices
  ORDER BY InvoiceTotal;

  --two columns and a calculated value for a specific invoice (id 17)
SELECT InvoiceID, InvoiceTotal, CreditTotal + PaymentTotal AS TotalCredits
  FROM Invoices
  WHERE InvoiceID = 17;

  -- get all invoices between 2 dates
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
  FROM Invoices
  WHERE InvoiceDate BETWEEN '2023-01-01' and '2023-03-31'
  ORDER BY InvoiceDate;

  -- returns an empty result set
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
  FROM Invoices
  WHERE InvoiceTotal > 50000;

-- page 69 examples
-- naming columns in the result set:
SELECT InvoiceNumber AS [Invoice Number], InvoiceDate AS Date, InvoiceTotal AS Total
  FROM Invoices;

-- no name for calculated column
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceTotal - PaymentTotal - CreditTotal
  FROM Invoices;

-- p. 71 coding expressions
-- concatenating string data
SELECT VendorCity, VendorState, VendorCity + VendorState 
  FROM Vendors;

--concatenate using commas and spaces
SELECT VendorName, (VendorCity + ', ' + VendorState + ' ' + VendorZipCode) AS Address
  FROM Vendors;

--include apostrophes 
SELECT VendorName + '''s Address: ', VendorCity + ', ' +VendorState + ' ' + VendorZipCode
FROM Vendors;

-- atrithmetic operators p.73
SELECT InvoiceTotal, PaymentTotal, CreditTotal, 
  InvoiceTotal - PaymentTOtal - CreditTotal AS BalanceDue
  FROM Invoices;
  -- parentheses to control the sequence of operations

SELECT InvoiceID,
    InvoiceID + 7*3 AS OrderOfPrecedence,
	(InvoiceID +7) * 3 AS AddFirst
  FROM Invoices
  ORDER BY InvoiceID;

  --using the modulo operator
SELECT InvoiceID, 
    InvoiceID / 10 AS Quotient,
	InvoiceID % 10 AS Remainder
  FROM Invoices
  ORDER BY InvoiceID;

-- p. 75 functions - LEFT, Convert
SELECT VendorContactFName, VendorContactLName,
	LEFT(VendorContactFName,1) +
	LEFT(VendorContactLName, 1 AS Initials
  FROM Vendors;

-- CONVERT
SELECT 'Invoice: #' + InvoiceNumber
	+ ', dated ' + CONVERT(char(8), PaymentDate, 1)
	+ ' for $' + CONVERT(varchar(9), PaymentTotal, 1)
  FROM Invoices;

-- p75. Get Date and Datediff
SELECT InvoiceDate,
	GETDATE() AS 'Today''s Date',
	DATEDIFF(day, InvoiceDate, GETDATE()) AS Age
	FROM Invoices;

-- TOP CLAUSE p. 79

SELECT TOP 5 VendorID, InvoiceTotal
	FROM Invoices
	ORDER BY InvoiceTotal DESC;

-- TOP PERCENT
SELECT TOP 5 PERCENT VendorID, InvoiceTotal
	FROM Invoices
	ORDER BY InvoiceTotal DESC;

-- WITH TIES selects the TOP and includes any results that have matching values
SELECT TOP 5 WITH TIES VendorID, InvoiceDate
	FROM Invoices
	ORDER BY InvoiceTotal ASC;

-- using the WHERE clause.
 