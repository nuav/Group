DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS house;
DROP TABLE IF EXISTS basicUser;
DROP TABLE IF EXISTS item;

CREATE TABLE basicUser
(bUserid		varchar(15)		NOT NULL UNIQUE,
 fname			varchar(50)		NOT NULL,
 lname			varchar(50)		NOT NULL,
 username		varchar(50)		NOT NULL,
 password		varchar(15)		NOT NULL,
 dept			varchar(50)		NOT NULL,
 email			varchar(30)		NOT NULL,
 phone			varchar(10)		NOT NULL,
 dateofRegistry	date			NOT NULL,
 personalinfo	varchar(50),
 uimage			blob,
 PRIMARY KEY(bUserid));
 
INSERT INTO basicUser VALUES ('1', 'Tara', 'Brown', 'Tbee', 'resah', 'computer science', 'tarabrown@hotmail.com', '5557788', '2012/05/02', 'i am a girl', '' );
 

CREATE TABLE item
(itemid			int				NOT NULL AUTO_INCREMENT,
 category		varchar(15)		NOT NULL,
 uploadTime		timestamp		NOT NULL,
 saleType		varchar(15)		NOT NULL,
 keyword		varchar(20)		NOT NULL,
 image			blob,
 PRIMARY KEY(itemid));
 


CREATE TABLE book
(itemid			int				NOT NULL AUTO_INCREMENT,
 bUserid		varchar(15)		NOT NULL,
 title			varchar(50)		NOT NULL,
 author			varchar(50)		NOT NULL,
 publisher		varchar(20),
 pubDate		date,
 edition		varchar(20)		NOT NULL,
 subarea		varchar(15)		NOT NULL,
 cond			varchar(15)		NOT NULL,
 price			decimal(10,2)	NOT NULL,
 description	varchar(30)		NOT NULL,
 PRIMARY KEY (itemid, bUserid),
 FOREIGN KEY (itemid) references item(itemid) ON UPDATE CASCADE ON DELETE CASCADE,
 FOREIGN KEY (bUserid) references basicUser(bUserid) ON UPDATE CASCADE ON DELETE CASCADE);
 

 

CREATE TABLE house
(itemid			int				NOT NULL AUTO_INCREMENT,
 bUserid		varchar(15)		NOT NULL,
 bedrooms		int,
 bathrooms		int,
 facilities 	varchar(15)		NOT NULL,
 price			decimal(10,2)	NOT NULL,
 locatedNear	varchar(20)		NOT NULL,
description		varchar(30)		NOT NULL, 
 PRIMARY KEY (itemid, bUserid),
 FOREIGN KEY (itemid) references item(itemid) ON UPDATE CASCADE ON DELETE CASCADE,
 FOREIGN KEY (bUSerid) references basicUser(bUserid) ON UPDATE CASCADE ON DELETE CASCADE);
 

 
 CREATE TABLE bids
 (itemid		int				NOT NULL AUTO_INCREMENT,
  bUserid		varchar(15)		NOT NULL,
  numOfBids		int,
  PRIMARY KEY(itemid, bUserid),
  FOREIGN KEY (itemid) references item(itemid) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (bUserid) references basicUser(bUserid) ON UPDATE CASCADE ON DELETE CASCADE);

 
