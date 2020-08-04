#AdventureWorks INIT
#0.1.
#Show the CompanyName for James D. Kramer
SELECT CompanyName
  FROM Customer
 WHERE FirstName='James'
   AND MiddleName='D.'
   AND LastName='Kramer'

#0.2.
#Show all the addresses listed for 'Modular Cycle Systems'
SELECT CompanyName,AddressType,AddressLine1
  FROM Customer JOIN CustomerAddress
    ON (Customer.CustomerID=CustomerAddress.CustomerID)
                  JOIN Address
    ON (CustomerAddress.AddressID=Address.AddressID)
 WHERE CompanyName='Modular Cycle Systems'

#0.3.
#Show OrdeQty, the Name and the ListPrice of the order made by CustomerID 635
SELECT OrderQty, Name, ListPrice
FROM Customer c
JOIN SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID
JOIN SalesOrderDetail sod
ON soh.SalesOrderID = sod.SalesOrderID
JOIN Product p
ON sod.ProductID = p.ProductID 
WHERE c.CustomerID = 635
ORDER BY ListPrice DESC

#1.
#Show the first name and the email address of customer with CompanyName 'Bike World'
SELECT FirstName, EmailAddress
FROM Customer
WHERE CompanyName = 'Bike World'

#2.
#Show the CompanyName for all customers with an address in City 'Dallas'.
SELECT CompanyName
FROM Customer
NATURAL JOIN CustomerAddress
NATURAL JOIN Address
WHERE City = 'Dallas'

#3
#How many items with ListPrice more than $1000 have been sold?
SELECT SUM(OrderQty)
FROM SalesOrderHeader soh
JOIN SalesOrderDetail sod
  ON soh.SalesOrderID = sod.SalesOrderID
JOIN Product p
  ON sod.productID = p.ProductID
WHERE listprice > 1000;

#4.
#Give the CompanyName of those customers with orders over $100000. Include the subtotal plus tax plus freight.
SELECT c.CompanyName
FROM Customer c
JOIN SalesOrderHeader h
  ON c.CustomerID = h.CustomerID
WHERE subtotal+taxamt+freight> 10000;

SELECT companyname, COUNT(d.name)
FROM SalesOrderHeader a
JOIN Customer b
  ON a.CustomerID = b.CustomerID
JOIN SalesOrderDetail c
  ON a.SalesOrderID = c.SalesOrderID
JOIN Product d
  ON c.ProductID = d.ProductID
JOIN ProductModel e
  ON d.ProductModelID = e.ProductModelID 
WHERE e.name= 'Racing Socks'
AND CompanyName = 'Riding Cycles'
GROUP BY CompanyName;

#5
#Find the number of left racing socks ('Racing Socks, L') ordered by CompanyName 'Riding Cycles'
SELECT d.name, companyname
FROM SalesOrderHeader a
JOIN Customer b
  ON a.CustomerID = b.CustomerID
JOIN SalesOrderDetail c
  ON a.SalesOrderID = c.SalesOrderID
JOIN Product d
  ON c.ProductID = d.ProductID
JOIN ProductModel e
  ON d.ProductModelID = e.ProductModelID 
WHERE e.name= 'Racing Socks';