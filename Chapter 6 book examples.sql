-- Subqueries

-- This is a join that does the same as the below subquery
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices i
JOIN Vendors v ON i.VendorID = v.VendorID
WHERE VendorState = 'CA'
ORDER BY InvoiceDate;

--subquery does the same as the above inner join
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal FROM Invoices WHERE VendorID IN   (SELECT VendorID 	FROM Vendors	WHERE VendorState = 'CA')ORDER BY InvoiceDate;