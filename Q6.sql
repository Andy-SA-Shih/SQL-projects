-- Q6: Calculate the average order value --
SELECT ROUND(AVG(Total), 3) AS 'Average order value'
FROM invoices; -- $5.65

-- Q6-1: The average number of tracks per order (invoice) --
-- invoice_items: TrackId*Quantity (though it seems that for each row, the quantity is always 1), InvoiceId 
/* My logic is to first make a table having the number of tracks ordered in each order (invoice), and as it's already
1 to 1 relationship, I then calculate the average number of tracks ordered per invoice*/
WITH temp AS (
SELECT InvoiceID, SUM(Quantity) AS Number_of_tracks_ordered FROM invoice_items
GROUP BY InvoiceId
)

SELECT ROUND(AVG(Number_of_tracks_ordered), 3) AS 'The average number of tracks per order' 
FROM temp; -- 5.44
