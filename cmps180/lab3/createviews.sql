/*published at least 2 reviewed books*/
/*every review of book published has at least 3 stars*/
/*2nd attribute # of reviewed books publisher published*/
/*2.6.1
\i create.sql
\i lab3_data_loading.sql*/
CREATE VIEW GreatPublishers AS
SELECT p.publisherID, COUNT (DISTINCT b.bookID) AS numReviewedPublished
FROM Publishers p, Reviews r, Books b
WHERE p.publisherID = b.publisherID AND
	b.bookID = r.bookID  
GROUP BY p.publisherID
HAVING COUNT(DISTINCT r.bookID) >= 2 AND MIN(r.reviewStars) >= 3;

CREATE VIEW BadBookTotals AS
SELECT o.bookID, b.totalOrdered, SUM(o.quantity) AS badQuantitySum
FROM Books b, Orders o
WHERE b.bookID = o.bookID 
GROUP BY o.bookID, b.totalOrdered
HAVING SUM(o.quantity) <> b.totalOrdered;


