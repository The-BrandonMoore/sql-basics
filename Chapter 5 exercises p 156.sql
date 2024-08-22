-- exercise 1
SELECT VendorID, SUM(PaymentTotal) AS PaymentSum
  FROM Invoices
  GROUP BY VendorID;

-- exercise 2
SELECT TOP 10 VendorName, SUM(PaymentTotal) AS PaymentSum
  FROM Invoices i
   JOIN Vendors v ON i.VendorID = v.VendorID
  GROUP BY VendorName;

-- exercise 3
SELECT VendorName
    , COUNT(InvoiceNumber) AS InvoiceCount
	, SUM(InvoiceTotal) AS InvoiceSum
  FROM Vendors v
  JOIN Invoices i ON v.VendorID = i.VendorID 
  GROUP BY VendorName
  ORDER BY InvoiceCount;

-- exercise 4
SELECT gla.AccountDescription
     , COUNT(*) AS LineItemCount
	 , SUM(InvoiceLineItemAmount) AS LineItemSum
  FROM InvoiceLineItems ili
  JOIN GLAccounts gla ON gla.AccountNo = ili.AccountNo
  GROUP BY AccountDescription
  HAVING Count(*) > 1
  ORDER BY LineItemCount DESC; 

-- exercise 5
SELECT AccountDescription
     , COUNT(*) AS LineItemCount
	 , SUM(InvoiceLineItemAmount) AS LineItemSum
  FROM GLAccounts gla
  JOIN InvoiceLineItems ili ON gla.AccountNo = ili.AccountNo
  JOIN Invoices i ON i.InvoiceID = ili.InvoiceID
  WHERE InvoiceDate BETWEEN '2022-10-01' AND '2022-12-31'
  GROUP BY AccountDescription
  HAVING Count(*) > 1
  ORDER BY LineItemCount DESC; 

-- exercise 6
SELECT AccountNo, SUM(InvoiceLineItemAmount) AS AccountTotal
  FROM InvoiceLineItems
  GROUP BY Rollup(AccountNo);