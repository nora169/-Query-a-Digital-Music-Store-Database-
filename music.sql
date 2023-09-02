-- Who are the top artists have albums?
SELECT Artist.Name, COUNT(Album.AlbumId)AS Albums
FROM Artist
JOIN Album
ON Album.ArtistId=Artist.ArtistId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

--Who are artist write the most ‘’ROCK’’ songs ?
SELECT art.ArtistId,art.Name,COUNT(*) AS songs
FROM Artist art
JOIN Album alb 
ON art.ArtistId=alb.ArtistId
JOIN Track t
ON t.AlbumId=alb.AlbumId
JOIN Genre g
ON g.GenreId=t.GenreId
where g.Name ='Rock'
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 10;
--  Who is The artist who has earned the most acc to invoicelines? 
SELECT art.Name,SUM(invline.UnitPrice*invline.Quantity )AS Earnings
FROM Artist art
JOIN Album alb 
ON art.ArtistId=alb.ArtistId
JOIN Track t
ON t.AlbumId=alb.AlbumId
JOIN InvoiceLine invline
ON invline.TrackId=t.TrackId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
--  What are the top countries purchased songs ?
SELECT SUM(invline.Quantity) AS Purchases,custom.Country
FROM Customer custom
JOIN invoice inv
ON custom.CustomerId=inv.CustomerId
JOIN InvoiceLine invline
ON invline.InvoiceId=inv.InvoiceId
GROUP BY 2
ORDER BY 1 DESC
LIMIT 10
