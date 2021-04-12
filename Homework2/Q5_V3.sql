/*
 *	Used live SQL to run the following commands
 *	https://livesql.oracle.com/apex/f?p=590%3A1000%3A0
 *	Database: Oracle: Version 19.5.0.0.0
 */
 
 /*
 * The DDL command CREATE is to create the table for storing the subject that each instructor teaches.
 * The DML INSERT commands help insert the relevant data into the table.
 * The query consists of nested subqueries which help identify the common instructors who teach JavaScript, Python and Scratch.
 * The innermost nested subquery retrieves all the instructors who teach Scratch.
 * Then the next outer subquery selects all the instructors who teach JavaScript and intersects it with the innermost subquery that returns all the 
 * instructors who teach Scratch.
 * The last step is when the outermost subquery selects all the instructors who teach Python and finds all the common records that are retrieved by
 * the inner subquery. Thus the result will be the tuples of instructor names who teach all the three subjects.
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
WHERE IS1.SUBJECT = 'Python' AND IS1.INSTRUCTOR IN (
    SELECT IS2.INSTRUCTOR FROM INSTRUCTOR_SUBJECT IS2
    WHERE IS2.SUBJECT = 'JavaScript' AND IS2.INSTRUCTOR IN (
        SELECT IS3.INSTRUCTOR FROM INSTRUCTOR_SUBJECT IS3
        WHERE IS3.SUBJECT = 'Scratch'
    )
);