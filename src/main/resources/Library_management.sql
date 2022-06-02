create database libmgt;


CREATE TABLE libmgt.user (
                             ID INT NOT NULL AUTO_INCREMENT,
                             NAME VARCHAR(255) NOT NULL,
                             username VARCHAR(255) NOT NULL,
                             PASSWORD VARCHAR(255) NOT NULL,
                             email VARCHAR(255),
                             PRIMARY KEY (ID)
);

INSERT INTO libmgt.user(id, NAME, username, PASSWORD, email) VALUES(1, 'Anand', 'Pulivarthi', 'anandp', 'test@gmail.com');
commit ;
SELECT * FROM libmgt.user;


CREATE TABLE libmgt.Periodical (
                                   ID INT NOT NULL,
                                   title VARCHAR(255),
                                   YEAR INT,
                                   volume INT,
                                   isbn VARCHAR(255),
                                   PRIMARY KEY (ID),
                                   UserID INT,
                                   FOREIGN KEY (UserID) REFERENCES libmgt.user(ID)
);

INSERT INTO libmgt.Periodical (ID, title, YEAR, volume, isbn,UserID) VALUES(51,'Periodical title',2022, 2, 'test',1);
INSERT INTO libmgt.Periodical (ID, title, YEAR, volume, isbn,UserID) VALUES(52,'Periodical title1',2022, 2, 'test',1);
INSERT INTO libmgt.Periodical (ID, title, YEAR, volume, isbn,UserID) VALUES(53,'Periodical title2',2022, 2, 'test',1);
INSERT INTO libmgt.Periodical (ID, title, YEAR, volume, isbn,UserID) VALUES(54,'Periodical title3',2022, 2, 'test',1);
commit;
SELECT * FROM libmgt.Periodical;


CREATE TABLE libmgt.BOOK (
                             ID INT NOT NULL,
                             title VARCHAR(255),
                             YEAR INT,
                             PAGES INT,
                             isbn VARCHAR(255),
                             PRIMARY KEY (ID),
                             UserID INT,
                             FOREIGN KEY (UserID) REFERENCES libmgt.user(ID)
);

INSERT INTO libmgt.BOOK (ID, title, YEAR, PAGES, isbn,UserID) VALUES(51,'Periodical title',2022, 2, 'test',1);
INSERT INTO libmgt.BOOK (ID, title, YEAR, PAGES, isbn,UserID) VALUES(52,'Periodical title1',2022, 2, 'test',1);
INSERT INTO libmgt.BOOK (ID, title, YEAR, PAGES, isbn,UserID) VALUES(53,'Periodical title2',2022, 2, 'test',1);
INSERT INTO libmgt.BOOK (ID, title, YEAR, PAGES, isbn,UserID) VALUES(54,'Periodical title3',2022, 2, 'test',1);
commit;
SELECT * FROM libmgt.BOOK;


CREATE TABLE libmgt.TAG (
                            ID INT NOT NULL,
                            VALUE VARCHAR(255),
                            PRIMARY KEY (ID)
);

INSERT INTO libmgt.TAG (ID, VALUE) VALUES(71,'value1');
INSERT INTO libmgt.TAG (ID, VALUE) VALUES(72,'value2');
INSERT INTO libmgt.TAG (ID, VALUE) VALUES(73,'value3');
INSERT INTO libmgt.TAG (ID, VALUE) VALUES(74,'value4');
commit;
SELECT * FROM libmgt.TAG;

CREATE TABLE libmgt.BOOK_TAG (
                                 bookID INT NOT NULL,
                                 tagID INT NOT NULL,
                                 FOREIGN KEY (bookID) REFERENCES libmgt.BOOK (id) ON DELETE RESTRICT ON UPDATE CASCADE,
                                 FOREIGN KEY (tagID) REFERENCES libmgt.TAG (id) ON DELETE RESTRICT ON UPDATE CASCADE,
                                 PRIMARY KEY (bookID, tagID)
);

INSERT INTO libmgt.BOOK_TAG VALUES (51, 71);
INSERT INTO libmgt.BOOK_TAG VALUES (51, 72);
INSERT INTO libmgt.BOOK_TAG VALUES (52, 72);
commit;
-- SELECT * FROM libmgt.BOOK_TAG;
-- many to many
SELECT BOOK.id, BOOK.title, BOOK.PAGES, TAG.ID, TAG.VALUE
FROM libmgt.BOOK BOOK
         JOIN libmgt.BOOK_TAG BOOK_TAG ON (BOOK.ID=BOOK_TAG.bookID)
         JOIN libmgt.TAG TAG ON (TAG.ID=BOOK_TAG.tagID);


CREATE TABLE libmgt.PAPER (
                              ID INT NOT NULL,
                              NAME VARCHAR(255) NOT NULL,
                              PRIMARY KEY (ID),
                              PeriodicalId INT,
                              FOREIGN KEY (PeriodicalId) REFERENCES libmgt.Periodical(ID)

);


INSERT INTO libmgt.PAPER (id, NAME, PeriodicalId) VALUES(100,'maths',51);
INSERT INTO libmgt.PAPER (id, NAME, PeriodicalId) VALUES(101,'maths1',51);
INSERT INTO libmgt.PAPER (id, NAME, PeriodicalId) VALUES(102,'maths2',52);
INSERT INTO libmgt.PAPER (id, NAME, PeriodicalId) VALUES(103,'maths3',52);
commit ;

SELECT * FROM libmgt.PAPER;


CREATE TABLE libmgt.AUTHOR (
                               ID INT NOT NULL,
                               NAME VARCHAR(255) NOT NULL,
                               PAPERID INT,
                               PRIMARY KEY (ID),
                               FOREIGN KEY (PAPERID) REFERENCES libmgt.PAPER(ID)
);

INSERT INTO libmgt.AUTHOR (ID, NAME, PAPERID) VALUES(200,'PRASAD',100);
INSERT INTO libmgt.AUTHOR (ID, NAME, PAPERID) VALUES(201,'PRASAD1',100);
INSERT INTO libmgt.AUTHOR (ID, NAME, PAPERID) VALUES(202,'PRASAD2',102);
INSERT INTO libmgt.AUTHOR (ID, NAME, PAPERID) VALUES(203,'PRASAD3',103);
commit ;
SELECT * FROM libmgt.AUTHOR;