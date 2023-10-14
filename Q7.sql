-- Q7: Find out the top-selling genre (top 10) --
-- genres: GenreId, Name
-- invoice_items: TrackId (with Quantity)
-- tracks: TrackId, GenreId
-- In the end, the table should be genre id, genre name, and selling quantity in descending order
/* The logic is I first linked each track with its unique genre, and I linked it to invoice_items table
to have selling quantity of that track, and I grouped the data by genre ID, and sum up the selling quantity within that genre*/
SELECT genres.GenreId, genres.Name, SUM(invoice_items.Quantity) AS Number_of_invoices
FROM genres
JOIN tracks
ON genres.GenreId == tracks.GenreId
JOIN invoice_items
ON tracks.TrackId == invoice_items.TrackId
GROUP BY genres.GenreId
ORDER BY Number_of_invoices DESC
LIMIT 10;

/*SELECT * -- to see what the big table looks like before aggregation
FROM genres
JOIN tracks
ON genres.GenreId == tracks.GenreId
JOIN invoice_items
ON tracks.TrackId == invoice_items.TrackId;*/


-- Q7-1: Find out the top-selling genre where the total number of invoices exceeds 100 and when the genre is not Latin -- 
-- FINDING is the WHERE command with aggregation functions
-- IS NOT is also a valid keyword
SELECT genres.GenreId, genres.Name, SUM(invoice_items.Quantity) AS Number_of_invoices
FROM genres
JOIN tracks
ON genres.GenreId == tracks.GenreId
JOIN invoice_items
ON tracks.TrackId == invoice_items.TrackId
GROUP BY genres.GenreId
HAVING Number_of_invoices > 100 AND genres.Name IS NOT 'Latin'
ORDER BY Number_of_invoices DESC;