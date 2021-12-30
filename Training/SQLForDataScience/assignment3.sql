--Q1 Using a subquery, find the names of all the tracks for the album "Californication". What is the title of the 8th track?

SELECT Name, AlbumID,TrackID
FROM Tracks
Where AlbumID in 
(SELECT AlbumID FROM Albums Where Title='Californication');

--Q2 Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT FirstName,LastName,City,Email,CustomerID,
(SELECT COUNT (*) AS Total
From Invoices
Where Invoices.CustomerID = Customers.CustomerID) AS TOTAL
FROM Customers
;

--Q3 Retrieve the track name, album, artistID, and trackID for all the albums. What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.
Select Tracks.Name,Tracks.TrackId,Albums.Title,Albums.ArtistId
from Tracks
left join Albums
on Tracks.AlbumId=Albums.AlbumId
where Albums.Title like "For Those About to Rock We Salute You" 
and Tracks.TrackId=12;

--Q4 Retrieve a list with the managers last name, and the last name of the employees who report to him or her. After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?
select a.LastName as EmployeeLast,a.ReportsTo,b.LastName as ManagerLast
from Employees as a
left join Employees as b
on a.ReportsTo=b.EmployeeId
where b.LastName like "Mitchell";

--Q5 ind the name and ID of the artists who do not have albums. After running the query described above, two of the records returned have the same last name. Enter that name below.
Select Artists.ArtistID, Artists.Name,Albums.AlbumID 
From Artists
left Join Albums
on Artists.ArtistID=Albums.ArtistID
Where Albums.AlbumID IS NULL
;

--Q6 Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descend
SELECT e.FirstName,e.LastName
From Employees as e
UNION SELECT c.FirstName, c.LastName
From Customers as c
ORDER BY e.LastName DESC
;

--Q7 See if there are any customers who have a different city listed in their billing city versus their customer city.

select Customers.FirstName,Customers.City,Invoices.BillingCity
from Customers
left join Invoices
on Customers.CustomerId=Invoices.CustomerId
where Customers.City<>Invoices.BillingCity ;
