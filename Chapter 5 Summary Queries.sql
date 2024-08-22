--Chap 5 Summary Queries
-- pg 137.


--total due = invoice total - (payment total + credit total)
SELECT count(*) AS NumberOfInvoices,
    SUM(InvoiceTotal - (PaymentTotal + CreditTotal)) AS TotalDue
  FROM Invoices
  WHERE InvoiceTotal - (PaymentTotal + CreditTotal) > 0
  ORDER BY TotalDue;

--p. 139 count(*), AVG and SUM
-- after 7/1/22 # of invoices, avg inv amnt, total invoice amount

SELECT 'After 7/1/2022' AS SelectionDate, 
    COUNT(*) AS NumberOfInvoices,
    AVG(InvoiceTotal) AS AverageInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount
  FROM Invoices
  WHERE InvoiceDate > '2022-07-01';

-- p 139 using the distinct keyword
-- want the number of vendors, the total invoices, the average amount, total amount, since 7-1-22
SELECT COUNT(DISTINCT VendorID) AS NumberOfVendors, 
    COUNT(VendorID) AS NumberofInvoices,
	AVG(InvoiceTotal) AS AverageInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount
  FROM Invoices
  WHERE InvoiceDate > '2022-07-01';

-- p 141 Groub By and Having clauses
-- avg income amount by vendor

SELECT VendorID, AVG(InvoiceTotal) AS AvgInvoiceTotal
  FROM Invoices
  GROUP BY VendorID
  HAVING AVG(InvoiceTotal) > 2000
  ORDER BY AvgInvoiceTotal DESC;

-- p. 143
-- summary query counting the number of invoices by vendor

SELECT VendorID, COUNT(*) AS InvoiceQty
  FROM Invoices
  GROUP BY VendorID
  HAVING COUNT(*) > 1
  ORDER BY InvoiceQty;


--p143 a join w/ a groupby/order by

SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQty,
	AVG(InvoiceTotal) AS InvoiceAvg
  FROM Invoices i
    JOIN Vendors v ON v.VendorID = i.VendorID
  GROUP BY VendorState, VendorCity
  ORDER BY VendorState, VendorCity;


-- p 145
--Summary query with search condition in the HAVING clause
SELECT VendorName, COUNT(*) AS InvoiceQTY,
      AVG(InvoiceTotal) AS InvoiceAVG
  FROM Vendors JOIN Invoices
    ON Vendors.VendorID = Invoices.VendorID
  GROUP BY VendorName
  HAVING AVG(InvoiceTotal) > 500
  ORDER BY InvoiceQty DESC;


-- p 147 compound condition in a HAVING clause
SELECT InvoiceDate, COUNT(*) AS InvoiceQty, SUM(InvoiceTotal) AS InvoiceSum   FROM Invoices   GROUP BY InvoiceDate  HAVING InvoiceDate BETWEEN '2023-01-01' AND '2023-01-31'     AND COUNT(*) > 1    AND SUM(InvoiceTotal) > 100   ORDER BY InvoiceDate DESC;  -- same thing but using a WHERE ClauseSELECT InvoiceDate, COUNT(*) AS InvoiceQty, SUM(InvoiceTotal) AS InvoiceSum   FROM Invoices  WHERE InvoiceDate BETWEEN '2023-01-01' AND '2023-01-31'   GROUP BY InvoiceDate   HAVING COUNT(*) > 1   AND SUM(InvoiceTotal) > 100   ORDER BY InvoiceDate DESCSELECT VendorState, VendorCity, COUNT(*) AS QtyVendors   FROM Vendors WHERE VendorState IN ('IA', 'NJ')  GROUP BY CUBE (VendorState, VendorCity)  ORDER BY VendorState DESC, VendorCity DESC;