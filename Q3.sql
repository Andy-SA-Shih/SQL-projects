-- Q3: Find out which customers have placed the most orders (from invoices table)(top 10) --

-- Q3-1: Cutomer Id with their first and last name and how many invoices --
-- invoices: InvoiceId, CustomerId
-- customers: CustomerId, FirstName, LastName
-- ** Not successful ** 
SELECT invoices.CustomerId, customers.FirstName || " " || customers.LastName AS Full_name, COUNT(invoices.InvoiceId) AS 'Number of invoices'
-- || is to concatenate strings in SQL, at least SQLite studio, but not + or CONCAT()
FROM invoices
JOIN customers
ON invoices.CustomerId == customers.CustomerId
GROUP BY invoices.CustomerId;
-- It turns out the database is designed purposedly to let most people have 7 invoices

-- Q3-2: What countries have placed the most orders --
SELECT BillingCountry, COUNT(InvoiceId) AS 'Number of invoices' FROM invoices
GROUP BY BillingCountry
ORDER BY COUNT(InvoiceId) DESC
LIMIT 10;
-- When there is not JOIN function involved, there is no need to specify from which table this column is



