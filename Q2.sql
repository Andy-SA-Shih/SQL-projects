-- Q2: Calculate total sales for a specific period (for instance, 2009 April-July) --
-- Q2-1: For total sales, I define it to be the number of invoices generated --
-- invoices: InvoiceId(for #invoices), InvoiceDate (to learn how to select a time frame)
SELECT COUNT(InvoiceId) AS 'Number of invoices' FROM invoices
-- Again, SELECT is to really extract something out of the table, so here, I wanna extract the total count of invoices from the invoices table
WHERE InvoiceDate BETWEEN '2009-04-01' AND '2009-07-31';
-- Remember to cover the date string in '' to make it work

-- Q2-2: For total sales, I define it to be the total revenue I made in this period --
SELECT SUM(Total) FROM invoices
-- SUM() returns the sum of all the values in that column.
WHERE InvoiceDate BETWEEN '2009-04-01' AND '2009-07-31';