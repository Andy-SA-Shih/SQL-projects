-- Q1: Retrieve a list of top-selling tracks (top 10) --
-- tracks: TrackID, Name
-- invoice_items: invoiceID, TrackID
-- To comment (multiple) lines, just select the line(s) and cmd+/
-- Search from the topmost bar for open SQL editor so that I can save a new .sql file for a new question

SELECT tracks.TrackId, tracks.Name, count(invoice_items.InvoiceId) AS num_invoices
FROM tracks
JOIN invoice_items
ON tracks.TrackId == invoice_items.TrackId
GROUP BY tracks.TrackId
ORDER BY num_invoices DESC
-- Assign an aggregation to either a string like '' or like what I do here a variable name with no space
LIMIT 10;

-- The database is special that there is really no track that was sold more than in 2 invoices