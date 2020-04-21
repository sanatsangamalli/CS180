/*\i lab4_create.sql
\i lab4_data_loading.sql*/

Update Books
	Set totalOrdered = t.badQuantitySum
	From BadBookTotals t
	Where Books.publisherID = 94519 and
			t.bookID = Books.bookID;
	
Select * From Books Where publisherID = 94519;
	
/*Update BadBookTotals
	Set totalOrdered = BadBookTotals.badQuantitySum
	From BadBookTotals t, Books b
	Where t.bookID = b.bookID and 
			b.publisherID = 94519;
			98035*/