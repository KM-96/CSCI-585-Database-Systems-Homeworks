/*
 *	Used live SQL to run the following commands
 *	https://livesql.oracle.com/apex/f?p=590%3A1000%3A0
 *	Database: Oracle: Version 19.5.0.0.0
 */
 
/*
 * The query is a correlated sub query where the subquery checks for all the PIDs where the status is waiting and step number 
 * is greater than 0 and the outer query checks for all the PID's in the inner subquery such that the status is completed
 * for step number 0.
 */
CREATE TABLE PROJECT_STEPS ( 
PID VARCHAR(255),  
STEP INT, 
STATUS VARCHAR(1) 
);

INSERT INTO PROJECT_STEPS VALUES ('P100',0,'C');
INSERT INTO PROJECT_STEPS VALUES ('P100',1,'W');
INSERT INTO PROJECT_STEPS VALUES ('P100',2,'W');
INSERT INTO PROJECT_STEPS VALUES ('P201',0,'C');
INSERT INTO PROJECT_STEPS VALUES ('P201',1,'C');
INSERT INTO PROJECT_STEPS VALUES ('P333',0,'W');
INSERT INTO PROJECT_STEPS VALUES ('P333',1,'W');
INSERT INTO PROJECT_STEPS VALUES ('P333',2,'W');
INSERT INTO PROJECT_STEPS VALUES ('P333',3,'W');

SELECT DISTINCT PS1.PID FROM PROJECT_STEPS PS1 WHERE PS1.STEP = 0 AND PS1.STATUS = 'C' AND PS1.PID IN( 
    SELECT PS2.PID FROM PROJECT_STEPS PS2 WHERE PS2.STEP != 0 AND PS1.PID = PS2.PID AND PS2.STATUS = 'W'
);