SELECT DISTINCT m.memberID, m.joinDate
From Members m, Reviews r, Books b, Authors a
Where r.bookID = b.bookID and 
		b.pubDate > DATE '2010-04-01' and
		b.authorID = a.authorID and 
		m.memberID = r.reviewerID and
		a.authorName = m.memberName;
		