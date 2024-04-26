
---CREATE 

CREATE DATABASE LibDatabase;

CREATE SCHEMA person;


CREATE SCHEMA book;


CREATE TABLE book.Book 
	(
	Book_id INT PRIMARY KEY ,
	Book_name VARCHAR(100) NOT NULL,
	Author_id INT NOT NULL,
	Publisher_id INT NOT NULL
	);


CREATE TABLE Book.Author
	(
	Author_ID int,
	Author_FirstName nvarchar(50) Not NULL,
	Author_LastName nvarchar(50) Not NULL
	);




CREATE TABLE Book.Publisher
	(
	Publisher_ID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Publisher_Name nvarchar(100) NULL
	);



CREATE TABLE Person.Person
	(
	SSN bigint PRIMARY KEY NOT NULL,
	Person_FirstName nvarchar(50) NULL,
	Person_LastName nvarchar(50) NULL
	);




CREATE TABLE Person.Loan
	(
	SSN BIGINT NOT NULL ,
	Book_ID INT NOT NULL,
	PRIMARY KEY (SSN, Book_ID)
	);




CREATE TABLE Person.Person_Phone
	(
	Phone_Number bigint PRIMARY KEY NOT NULL,
	SSN bigint NOT NULL	
	);




CREATE TABLE Person.Person_Mail
	(
	Mail_ID INT PRIMARY KEY IDENTITY (1,1),
	Mail NVARCHAR(MAX) NOT NULL,
	SSN BIGINT UNIQUE NOT NULL	
	);

/*

CREATE TABLE Person.Person_Mail
	(
	Mail_ID INT PRIMARY KEY IDENTITY (1,1),
	Mail NVARCHAR(MAX) NOT NULL,
	SSN BIGINT UNIQUE NOT NULL	
	FOREIGN KEY (SSN) REFERENCES person.person (SSN)
	);

*/



-----------------------


--INSERT


INSERT INTO person.Person (SSN, Person_FirstName, Person_LastName)
VALUES		(65432165498, 'Zehra', 'Tekin')


INSERT  person.Person (Person_FirstName, SSN, Person_LastName)
VALUES		('Zeynep', 65953216549, 'Tekin')



INSERT  person.Person (Person_FirstName, Person_LastName) --hata
VALUES		('Zehra', 'Tekin')


INSERT  person.Person (SSN)
VALUES		(54632565896)



INSERT  person.Person
VALUES		(546325658478, 'Kerem', 'Tekin')



INSERT  person.Person
VALUES		(546325658879, 'Ali', NULL)



INSERT person.Person_Mail (Mail, SSN)
VALUES ('zehtek@gmail.com', 65432165498),
		('kertek@gmail.com', 546325658478),
		('zeytek@gmail.com', 65953216549)



INSERT book.Publisher
DEFAULT VALUES


SELECT *
FROM book.Publisher



-----

--SELECT INTO

SELECT *
INTO	person.person_2
FROM	person.Person
WHERE	Person_LastName IS NULL



---INSERT INTO

INSERT INTO person.person_2
SELECT	*
FROM	person.Person
WHERE	Person_FirstName = 'Kerem'




SELECT *
FROM person.person_2



-----


--UPDATE


UPDATE person.person_2
SET		Person_LastName = 'Kara' --tüm deðerler kara





UPDATE person.person_2
SET		Person_LastName = 'Tekin'
WHERE SSN = 546325658478




SELECT *
FROM person.person_2


-------delete


SELECT *
FROM	book.Publisher


DELETE FROM book.Publisher;


INSERT book.Publisher default values



DELETE FROM person.person_2
WHERE	Person_FirstName IS NULL



DELETE TOP (1) FROM person.person_2


SELECT *
FROM person.person_2


---------------------

--DROP

DROP TABLE person.person_2

DROP TABLE IF EXISTS person.person_2

--TRUNCATE

SELECT *
FROM person.person_mail

TRUNCATE TABLE person.person_mail


INSERT person.person_mail VALUES ('zehtek@gmail.com', 47589652365)


TRUNCATE TABLE person.person
TRUNCATE TABLE book.publisher
----


-----ALTER
ALTER TABLE book.Author
ALTER COLUMN Author_ID INT NOT NULL


ALTER TABLE book.Author
ADD CONSTRAINT pk_author1 PRIMARY KEY (Author_ID)



ALTER TABLE book.book
ADD CONSTRAINT fk_author1 FOREIGN KEY (Author_id) REFERENCES book.Author (Author_ID)



ALTER TABLE book.book
ADD CONSTRAINT fk_publisher1 FOREIGN KEY (Publisher_id) REFERENCES book.publisher (Publisher_ID)



---LOAN

ALTER TABLE person.loan
ADD CONSTRAINT fk_SSN1 FOREIGN KEY (SSN) REFERENCES person.person (SSN)



ALTER TABLE person.loan
ADD CONSTRAINT fk_book1 FOREIGN KEY (Book_ID) REFERENCES book.book (Book_id)


---mail


ALTER TABLE person.person_mail
ADD CONSTRAINT fk_SSN2 FOREIGN KEY (SSN) REFERENCES person.person (SSN)



---phone

ALTER TABLE person.person_phone
ADD CONSTRAINT fk_SSN3 FOREIGN KEY (SSN) REFERENCES person.person (SSN)
