/*
 *	Used live SQL to run the following commands
 *	https://livesql.oracle.com/apex/f?p=590%3A1000%3A0
 *	Database: Oracle: Version 19.5.0.0.0
 */
/*
 * The DDL command CREATE is to create the table for storing the subject that each instructor teaches.
 * The DML INSERT commands help insert the relevant data into the table.
 * The query performs multiple joins to identify the common instructors who teach JavaScript, Python and Scratch.
 * The join between the tables is made on the INSTRUCTOR column.
 * A product operation is performed by the INSTRUCTOR_SUBJECT table on itself twice and the query pull out all the 
 * records where the table1.subject is Python and table2.subject is JavaScript and table3.subject is Scratch.
 * [In this query all the three tables refer to the same INSTRUCTOR_SUBJECT table]
 */
 
CREATE TABLE INSTRUCTOR_SUBJECT(
    INSTRUCTOR VARCHAR(15),
    SUBJECT VARCHAR(10)
);

INSERT INTO INSTRUCTOR_SUBJECT VALUES('Aleph','Scratch');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Aleph', 'Java');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Aleph', 'Processing');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Bit', 'Python');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Bit', 'JavaScript');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Bit', 'Java');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('CRC', 'Python');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('CRC', 'JavaScript');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Dat', 'Scratch');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Dat', 'Python');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Dat', 'JavaScript');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Emscr', 'Scratch');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Emscr', 'Processing');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Emscr', 'JavaScript');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Emscr', 'Python');

SELECT DISTINCT IS1.INSTRUCTOR FROM INSTRUCTOR_SUBJECT IS1
INNER JOIN 
INSTRUCTOR_SUBJECT IS2 ON IS1.INSTRUCTOR = IS2.INSTRUCTOR
INNER JOIN
INSTRUCTOR_SUBJECT IS3 ON IS2.INSTRUCTOR = IS3.INSTRUCTOR
WHERE IS1.SUBJECT = 'Python' AND IS2.SUBJECT = 'JavaScript' AND IS3.SUBJECT = 'Scratch';
