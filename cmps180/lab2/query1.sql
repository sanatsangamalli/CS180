SELECT a.authorID, a.authorName
From Authors a
Where a.authorName NOT LIKE 'S%'
ORDER BY a.authorName desc;