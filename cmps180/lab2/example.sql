DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2;
/*ALTER ROLE ssangama SET SEARCH_PATH to Lab1;*/

CREATE TABLE MovieStar (
	name char(30) primary key,
	address varchar(255), 
	gender char(1),
	birthDate date
);

CREATE TABLE Movies (
	title char(100),
	year INT,
	length INT,
	genre char(10),
	studioName char(30),
	producerC INT,
	primary key(title, year)
);

CREATE TABLE Studio (
	name char(30) primary KEY,
	address varchar(255),
	presC INT
);

CREATE TABLE MovieExec (
	name char(30),
	address varchar(255),
	cert INT primary key,
	netWorth INT
);

CREATE TABLE StarsIn (
	movieTitle char(100),
	movieYear INT,
	starName char(30),
	PRIMARY KEY(movieTitle, movieYear, starName)
);

