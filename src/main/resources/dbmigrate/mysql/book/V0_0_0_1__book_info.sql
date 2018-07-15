

-------------------------------------------------------------------------------
--  BOOK INFO
-------------------------------------------------------------------------------
CREATE TABLE BOOK_INFO(
        ID BIGINT NOT NULL,
	COVER VARCHAR(64),
	NAME VARCHAR(200),
	CODE VARCHAR(200),
	AUTHOR VARCHAR(100),
	TRANSLATOR VARCHAR(100),
	ISBN VARCHAR(100),
	PRICE DOUBLE,
	PUBLISH_COMPANY VARCHAR(100),
	PUBLISH_DATE DATE,
	PAGE INT,
	ADD_TIME DATETIME,
	OPERATOR VARCHAR(64),
	STATUS VARCHAR(50),
	TYPE VARCHAR(50),
	SHELF VARCHAR(50),
	TOTOAL_COUNT INT,
	BORROW_COUNT INT,
	BORROW_TIMES INT,
	DESCRIPTION VARCHAR(200),
	CONSTRAINT PK_BOOK_INFO PRIMARY KEY(ID)
) ENGINE=INNODB CHARSET=UTF8;

