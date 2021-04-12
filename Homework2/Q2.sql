/*
 *	Used live SQL to run the following commands
 *	https://livesql.oracle.com/apex/f?p=590%3A1000%3A0
 *	Database: Oracle: Version 19.5.0.0.0
 */

/*
 * The query groups all the records that have the same class name and 
 * then counts all the distinct sid (student ids) that belong to each grouped class.
 * This helps us retrieve the count of students who are part of each class.
 * The order by part of the query just sorts all the retrieved tuples in the descending order 
 * based on the count of students in each class.
 */
CREATE TABLE PROJECT_ENROLLMENT(
    SID INT,
    CLASSNAME VARCHAR2(10),
    GRADE CHAR(1)
);

INSERT INTO PROJECT_ENROLLMENT VALUES(123,  'Processing', 'A');
INSERT INTO PROJECT_ENROLLMENT VALUES(123,  'Python',     'B');
INSERT INTO PROJECT_ENROLLMENT VALUES(123,  'Scratch',    'B');
INSERT INTO PROJECT_ENROLLMENT VALUES(662,  'Java',       'B');
INSERT INTO PROJECT_ENROLLMENT VALUES(662,  'Python',     'A');
INSERT INTO PROJECT_ENROLLMENT VALUES(662,  'JavaScript', 'A');
INSERT INTO PROJECT_ENROLLMENT VALUES(662,  'Scratch',   'B');
INSERT INTO PROJECT_ENROLLMENT VALUES(345,  'Scratch',    'A');
INSERT INTO PROJECT_ENROLLMENT VALUES(345,  'JavaScript', 'B');
INSERT INTO PROJECT_ENROLLMENT VALUES(345,  'Python',     'A');
INSERT INTO PROJECT_ENROLLMENT VALUES(555,  'Python',     'B');
INSERT INTO PROJECT_ENROLLMENT VALUES(555,  'JavaScript', 'B');

SELECT CLASSNAME, COUNT(DISTINCT SID)
FROM PROJECT_ENROLLMENT
GROUP BY CLASSNAME
ORDER BY COUNT(SID) DESC;