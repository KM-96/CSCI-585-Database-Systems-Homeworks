REM   Script: CSCI 585 DDL Homework2
REM   DDL COMMANDS FOR HOMEWORK2

CREATE TABLE PROJECT_STEPS ( 
PID VARCHAR(10),  
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


CREATE TABLE INSTRUCTOR_SUBJECT(
    INSTRUCTOR VARCHAR(15),
    SUBJECT VARCHAR(10)
);



INSERT INTO INSTRUCTOR_SUBJECT VALUES('Aleph','Scratch');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Aleph',        'Java');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Aleph',        'Processing');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Bit'  ,        'Python');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Bit'  ,        'JavaScript');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Bit'   ,      'Java');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('CRC'    ,      'Python');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('CRC'     ,     'JavaScript');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Dat'      ,    'Scratch');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Dat'      ,    'Python');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Dat'      ,    'JavaScript');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Emscr'    ,    'Scratch');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Emscr'    ,    'Processing');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Emscr'    ,    'JavaScript');
INSERT INTO INSTRUCTOR_SUBJECT VALUES('Emscr'    ,    'Python');


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


CREATE TABLE PROJECT_ENROLLMENT(
    SID INT,
    CLASSNAME VARCHAR2(10),
    GRADE CHAR(1)
);



INSERT INTO PROJECT_ENROLLMENT VALUES(123,  'Processing', 'A');
INSERT INTO PROJECT_ENROLLMENT VALUES(123, 'Python',     'B');
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

