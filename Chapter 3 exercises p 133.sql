--exercise 1
SELECT *
 FROM Vendors
 Join Invoices
   ON Vendors.VendorID = Invoices.VendorID;

SELECT *
  FROM Vendors v
  JOIN Invoices i
	ON v.VendorID = i.VendorID;

SELECT v.VendorID, VendorName, InvoiceID, InvoiceNumber, InvoiceTotal
  FROM Vendors v
  JOIN Invoices i
	ON v.VendorID = i.VendorID;

--exercise 2
SELECT VendorName, InvoiceNumber, InvoiceDate,
		InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
	FROM Invoices
	JOIN Vendors
	  ON Invoices.VendorID = Vendors.VendorID
	WHERE InvoiceTotal - (PaymentTotal + CreditTotal) > 0
	ORDER BY Balance;

--exercise 3
SELECT VendorName, DefaultAccountNo, AccountDescription
	FROM GLAccounts
	JOIN Vendors
	  ON Vendors.DefaultAccountNO = GLAccounts.AccountNo
	ORDER BY AccountDescription, VendorName;

--exercise 4
SELECT VendorName, InvoiceNumber, InvoiceDate,
		InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
	FROM Invoices i, Vendors v
	WHERE i.VendorID = v.VendorID
	AND InvoiceTotal - (PaymentTotal + CreditTotal) > 0;

--excercise 5
SELECT VendorName AS Vendor
	, InvoiceDate AS Date
	, InvoiceNumber AS Number
	, InvoiceSequence AS #
	, InvoiceLineItemAmount AS LineItem
  FROM Vendors v
  JOIN Invoices i
	ON v.VendorID = i.VendorID
  JOIN InvoiceLineItems li
	ON i.InvoiceID = li.InvoiceID
  ORDER BY Vendor, Date, Number, #;

--exercise 6
SELECT DISTINCT v1.VendorID, v1.VendorName, v1.VendorContactFName + ' ' + v1.VendorContactLName AS Name
	FROM Vendors v1
		JOIN Vendors v2
			ON v1.VendorID = v2.VendorID AND
			   v1.VendorName = v2.VendorName AND
			   v1.VendorContactFName = v2.VendorContactFName AND
			   v1.VendorContactLName = v2.VendorContactLName
	ORDER BY Name;

-- exercise 7
SELECT g.AccountNo, AccountDescription
  FROM GLAccounts g
  LEFT JOIN InvoiceLineItems li
	ON g.AccountNo = li.AccountNO
  WHERE li.AccountNo IS NULL
  ORDER BY AccountNo;