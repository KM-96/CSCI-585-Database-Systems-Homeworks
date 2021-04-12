/*
 *	Used live SQL to run the following commands
 *	https://livesql.oracle.com/apex/f?p=590%3A1000%3A0
 *	Database: Oracle: Version 19.5.0.0.0
 */
/*
 * The DDL command CREATE is to create the table for storing the subject that each instructor teaches.
 * The DML INSERT commands help insert the relevant data into the table.
 * The SQL query is trying to identify the instructors who can teach all the subjects i.e. JavaScript, Python and Scratch
 * This is done using by identifying the unique instructors who teach each subject individually and then finding the intersection 
 * of the three results. This will give us all the instructors who are teaching all the three subjects.
 *
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

SELECT DISTINCT INSTRUCTOR FROM INSTRUCTOR_SUBJECT WHERE SUBJECT = 'Scratch'
INTERSECT
SELECT DISTINCT INSTRUCTOR FROM INSTRUCTOR_SUBJECT WHERE SUBJECT = 'JavaScript'
INTERSECT
SELECT DISTINCT INSTRUCTOR FROM INSTRUCTOR_SUBJECT WHERE SUBJECT = 'Python';