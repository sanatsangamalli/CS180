/*4. don't reload data when running this(9 total unit tests)*/
/*violations/tests specific to lab3_data_loading.sql
\i create.sql
\i lab3_data_loading.sql
\i foreign.sql
\i general.sql*/
/*foreign key tests*/
DELETE FROM Authors WHERE authorID IN (SELECT authorID FROM Books);

DELETE FROM Books WHERE bookID IN (SELECT bookID FROM Orders);

DELETE FROM Members WHERE memberID IN (SELECT reviewerID FROM Reviews);
/*general constraint tests*/
	/*is within constraints*/
UPDATE Orders SET quantity = 5;
	
UPDATE Books SET lastOrderDate = pubDate;
	
UPDATE Members SET joinDate = NULL, isCurrentMember = NULL;
	
	/*violates constraints*/
UPDATE Orders SET quantity = 0;

UPDATE Books SET lastOrderDate = DATE '2010-05-04' WHERE publisherID = 31725;
	
UPDATE Members SET isCurrentMember = TRUE WHERE joinDate IS NULL;