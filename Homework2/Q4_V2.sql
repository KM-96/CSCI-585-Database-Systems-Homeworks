/*
 *	Used live SQL to run the following commands
 *	https://livesql.oracle.com/apex/f?p=590%3A1000%3A0
 *	Database: Oracle: Version 19.5.0.0.0
 */

CREATE TABLE JUNK_EMAIL (
    NAME VARCHAR2(10),
    ADDRESS VARCHAR2(20),
    ID INT,
    SAMEFAM INT
);

INSERT INTO JUNK_EMAIL VALUES('Alice',   'A',      10,  NULL);
INSERT INTO JUNK_EMAIL VALUES('Bob',     'B',      15,  NULL);
INSERT INTO JUNK_EMAIL VALUES('Carmen',  'C',      22,  NULL);
INSERT INTO JUNK_EMAIL VALUES('Diego',   'A',      9,  10);
INSERT INTO JUNK_EMAIL VALUES('Ella',    'B',      3,   15);
INSERT INTO JUNK_EMAIL VALUES('Farkhad', 'D',      11,  NULL);

DELETE FROM JUNK_EMAIL WHERE ID IN (
	SELECT JE1.ID FROM JUNK_EMAIL JE1 
	INNER JOIN
	JUNK_EMAIL JE2 ON JE1.ID = JE2.SAMEFAM
);