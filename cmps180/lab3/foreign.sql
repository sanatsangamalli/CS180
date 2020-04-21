/*2. check if data exists in other table(reference primary key of another table)
	alter table table_name add foreign key() references table2(col)*/
ALTER TABLE Books
ADD FOREIGN KEY (authorID)
REFERENCES Authors (authorID);

ALTER TABLE Orders
ADD FOREIGN KEY (bookID)
REFERENCES Books (bookID);

ALTER TABLE Reviews
ADD FOREIGN KEY (reviewerID)
REFERENCES Members (memberID);