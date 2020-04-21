DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;
/*ALTER ROLE ssangama SET SEARCH_PATH to Lab1;*/

CREATE TABLE Authors (
	authorID INT PRIMARY KEY,
	authorName varchar(30),
	address varchar(30), 
	numBooksWritten INT,
	mostRecentPubDate date
);

CREATE TABLE Books (
	bookID char(6) PRIMARY KEY,
	authorID INT,
	bookName varchar(30),
	publisherID INT,
	pubDate date,
	price decimal(6,2),
	category char(1),
	lastOrderDate date,
	totalOrdered INT
);

CREATE TABLE Publishers (
	publisherID INT PRIMARY KEY,
	publisherName varchar(30),
	address varchar(30)
);

CREATE TABLE Members (
	memberID INT PRIMARY KEY,
	memberName varchar(30),
	joinDate date,
	renewalDate date,
	isCurrentMember boolean
);

CREATE TABLE Orders (
	memberID INT,
	bookID char(6),
	orderDate date,
	quantity INT,
	PRIMARY KEY(memberID, bookID, orderDate)
);

CREATE TABLE Reviews (
	reviewerID INT,
	bookID char(6),
	reviewDate date,
	reviewStars INT,
	PRIMARY KEY(reviewerID, bookID)
);
