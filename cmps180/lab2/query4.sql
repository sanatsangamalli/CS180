SELECT DISTINCT r.reviewerID, r.bookID
From Reviews r, Members m, Books b
WHERE r.reviewStars <> 4 and 
		b.bookName = 'Jane Eyre' and
		m.memberName = 'John Smith' and
		r.bookID = b.bookID and 
		m.memberID = r.reviewerID;