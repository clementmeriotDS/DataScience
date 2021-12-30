-- 1 Pull a list of customer ids with the customer's full name, and address,
-- along with combining their city and country together. Be sure to make a
-- space in between these two and make it UPPER CASE.

SELECT CustomerId,
       FirstName || " " || LastName AS FullName,
       Address,
       UPPER(City || " " || Country) AS CityCountry
FROM Customers

------------------------------------------------------------------------------------
-- 2 Create a new employee user id by combining the first 4 letter of the
-- employee's first name with the first 2 letters of the employee's last name. 
-- Make the new field lower case and pull each individual step to show your work.

SELECT FirstName,
       LastName,
       LOWER(SUBSTR(FirstName,1,4)) AS F,
       LOWER(SUBSTR(LastName,1,2)) AS L,
       LOWER(SUBSTR(FirstName,1,4)) || LOWER(SUBSTR(LastName,1,2)) AS userId
FROM Employees

------------------------------------------------------------------------------------
-- 3 Show a list of employees who have worked for the company for 15 or more 
-- years using the current date function. Sort by lastname ascending.

SELECT FirstName,
       LastName,
       HireDate,
       (STRFTIME('%Y', 'now') - STRFTIME('%Y', HireDate)) - (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', HireDate)) AS YearsOfWork
FROM Employees
WHERE YearsOfWork >= 15
ORDER BY LastName ASC

------------------------------------------------------------------------------------
-- 4 Profiling the Customers table, answer the following question: Are there any columns with null values?

SELECT COUNT(*)
FROM Customers
WHERE [col] IS NULL

-- col: FirstName, PostalCode, Company, Fax, Phone, Address
-- Answer: Postal Code, Company, Fax, Phone

------------------------------------------------------------------------------------
-- 5 Find the cities with the most customers and rank in descending order.

SELECT City,
       COUNT(*)
FROM Customers
GROUP BY City
ORDER BY COUNT(*) DESC

------------------------------------------------------------------------------------
-- 6 Create a new customer invoice id by combining a customer\u2019s invoice id with
-- their first and last name while ordering your query in the following order:
-- firstname, lastname, and invoiceID.

SELECT c.FirstName,
       c.LastName,
       i.InvoiceId,
       c.FirstName || c.LastName || i.InvoiceID AS New
FROM Customers c INNER JOIN Invoices i
ON c.CustomerId = i.CustomerID
WHERE New LIKE 'AstridGruber%'
