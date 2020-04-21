/*2.6.2
\i create.sql
\i lab3_data_loading.sql
\i createviews.sql*/
SELECT g.publisherID, g.numReviewedPublished, COUNT(DISTINCT b.bookName) AS numBad
FROM GreatPublishers g, BadBookTotals t, Publishers p, Books b, Orders o, Reviews r 
WHERE g.publisherID = p.publisherID AND
		p.publisherID = b.publisherID AND
		t.bookID = r.bookID AND
		b.bookID = o.bookID
GROUP BY g.publisherID, g.numReviewedPublished;
		
DELETE FROM Orders 
WHERE ((memberID = 8844 AND bookID = 'jgzhwq') OR 
		(memberID = 2161 AND bookID = 'rrrrrr'));
		
SELECT g.publisherID, g.numReviewedPublished, COUNT(DISTINCT b.bookName) AS numBad
FROM GreatPublishers g, BadBookTotals t, Publishers p, Books b, Orders o, Reviews r 
WHERE g.publisherID = p.publisherID AND
		p.publisherID = b.publisherID AND
		t.bookID = r.bookID AND
		b.bookID = o.bookID
GROUP BY g.publisherID, g.numReviewedPublished;

/*
2.6.2
queryviews run 1(before deletions)
 publisherid | numreviewedpublished | numbad
-------------+----------------------+--------
       31725 |                    2 |      1
(2 rows)

queryviews run 2(after deletions)
 publisherid | numreviewedpublished | numbad
-------------+----------------------+--------
(0 rows)
*/