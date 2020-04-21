SELECT DISTINCT a.authorName, p.publisherName
From Books b, Publishers p, Authors a
Where b.category = 'N' AND
		b.price >= 19.99 AND
		a.authorID = b.authorID AND
		p.publisherID = b.publisherID;