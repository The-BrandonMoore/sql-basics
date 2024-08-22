--exercise 1
SELECT VendorContactFName, VendorContactLName, VendorName
  FROM Vendors
  ORDER BY VendorContactLName, VendorContactFName ASC;

-- exercise 2
SELECT InvoiceNumber AS Number, InvoiceTotal AS Total, 
		(PaymentTotal + CreditTotal) AS Credits, 
		(InvoiceTotal - (PaymentTotal + CreditTotal)) AS Balance 
  FROM Invoices;

-- exercise 3
SELECT (VendorContactLName + ', ' + VendorContactFName) AS [Full Name]
  FROM Vendors
  ORDER BY VendorContactLName, VendorContactFName;

-- excercise 4
SELECT InvoiceTotal,
	InvoiceTotal * .10,
	InvoiceTotal + InvoiceTotal * .10
FROM Invoices;

--exercise 5
SELECT InvoiceNumber AS Number, InvoiceTotal AS Total, 
		(PaymentTotal + CreditTotal) AS Credits, 
		(InvoiceTotal - (PaymentTotal + CreditTotal)) AS Balance 
  FROM Invoices
  WHERE InvoiceTotal > 499.99 AND InvoiceTotal < 10000.01;

--exercise 6
SELECT (VendorContactLName + ', ' + VendorContactFName) AS [Full Name]
  FROM Vendors
  WHERE VendorContactLName LIKE '[A-E]%' AND 
		VendorContactLName NOT LIKE 'D%'
  ORDER BY VendorContactLName, VendorContactFName;

--exercise 7
SELECT PaymentDate
	FROM Invoices
	WHERE PaymentDate IS NOT NULL AND NOT InvoiceTotal - (PaymentTotal + CreditTotal)  > 0; 

