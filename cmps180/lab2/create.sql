DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2;
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
	publisherID INT NOT NULL,
	pubDate date,
	price decimal(6,2),
	category char(1),
	lastOrderDate date,
	totalOrdered INT,
	UNIQUE(authorID, bookName)
);

CREATE TABLE Publishers (
	publisherID INT PRIMARY KEY,
	publisherName varchar(30) UNIQUE,
	address varchar(30)
);

CREATE TABLE Members (
	memberID INT PRIMARY KEY,
	memberName varchar(30),
	joinDate date,
	renewalDate date,
	isCurrentMember boolean,
	UNIQUE(memberName, joinDate)
);

CREATE TABLE Orders (
	memberID INT,
	bookID char(6),
	orderDate date,
	quantity INT NOT NULL,
	PRIMARY KEY(memberID, bookID, orderDate)
);

CREATE TABLE Reviews (
	reviewerID INT,
	bookID char(6),
	reviewDate date,
	reviewStars INT NOT NULL,
	PRIMARY KEY(reviewerID, bookID)
);

