# Homework 1: Conceptual Entity-Relational (ER) Diagram

## Problem Statement
* A small 'STEM' organization is interested in offering programming courses during summer vacation. Rather than offer just "the usual" (Scratch, Java, Python, Ruby...) coding classes, the owners plan on making the classes be centered around microcontrollers. 
* Students will take coding classes, and also work on hands-on projects that will have them run their code in a microcontroller.
* Students will sign up for a mix of coding classes, and projects. 
* Coding would be taught using Scratch, Processing, Python, Java and JavaScript. 
* Each project would be based on a microcontroller - Arduino, Raspberry Pi, BeagleBoard or micro:bit. 
* Students pay a single flat fee at the beginning, for the entire curriculum.
* Instructors (faculty) would teach a variety of coding classes throughout the day, and also oversee projects. Each coding class has a textbook. An instructor might specify a textbook for more than one class that he/she teaches
*  A class would have multiple instructors, and each instructor could potentially use a different text (their favorite) for the same class.
* Instructors would get paid based on hours they teach, and hours they supervise projects; all instructors are paid identical rates.
* Projects are done in shared fashion, ie. as a group (typically containing 4 students who all sign up for a common project). Students would sit around large, square, numbered tables (1,2..) assigned to them, to work on projects; at the start of the term, each table would be provided a big plastic storage box containing all the parts for the project the students will work on; at the end of the term, students will return all the parts presumably in good working order, otherwise they would be charged for damaged items.
* Each project would require parts specific to it - a microcontroller, and extra hardware such as wheels, motors, sensors, LEDs, switches, enclosures, etc.
* The owners of the institution plan to order project parts from several online suppliers - there is expected to be multiple orders placed with multiple vendors, to procure all the items.
* There are several rooms that will be available for the classes and projects - students will be provided a schedule that will list where and when these will be.
* There is a small library that contains books about electronics, coding, etc. A student can check out up to 4 books at a time, which need to be returned in 2 weeks.
* At the end of the curriculum, students will be required to rate their instructors, courses, and projects, using a single score for each (one to five stars).
* Follow [this](http://bytes.usc.edu/cs585/s20_db0ds1ml2agi/hw/HW1/index.html) to see the full problem statement description on the course website.

## ER Diagram
<img src="" height="800" width="1000"/>

## ASSUMPTIONS:

### STUDENT table:

1. A student can sign up to 1 or more coding classes and 1 or more projects.
2. The rating given by the student to the courses and projects is stored in the bridge entity that is created between the STUDENT table and the CODING_CLASS and PROJECT table. The student rates all the classes taken by him/her at the end. The rating of the instructors is stored in a seperate table called INSTRUCTOR_RATING.
3. A student pays the fee for entire curriculum at the beginning. Hence there is  only a 1-1 relation between the STUDENT and the STUDENT_FEE table.
4. A student can belong to 1 or more groups to do projects. A group can have atmost 4 students.
5. A student can take 0 or more textbooks from the library. The maximum number of books that he can take is 4. I assumed that the textbooks mentioned by instructor in the class and the textbooks available in the library are same. The library has all the textbooks preferred by the instructor and more.
6. The students are not directly linked to the Instructors. Hence I created a bridge table between them to store the ratings given by the students to instructors.

### CODING_CLASS table:

1. A coding class can have 0 or more students. I assumed that there might be some coding classes that no student is interested in and none of the students signed up for it.
2. The CLASS_FEE attribute determines the cost of the coding class that the students are expected to pay if they sign up for a particular coding class. The same applies to the PROJECT_FEE attribute in the PROJECT table. This helps in calculating the total fee of the student after he has signed up for all the classes and projects that he is interested in.
3. I assumed that in a coding class only 1 coding language can be taught. Hence I treated the coding language as an attribute in the CODING_CLASS table.
4. A coding class can have 1 or more sections (CODING_CLASS_SECTION table). Each section has an instructor and the instructor can specify a textbook of his choice to the section. Thus multiple instructors teaching a coding class.
5. A coding class can belong to one or more rooms.
6. The CLASS_HOUR_RATE column helps identify how much an instructor has to be paid for every hour that he taught a particular class. All the instructors are paid the same salary for a given coding class. I assumed that different coding classes are paid differnt hourly rates but all the professors teaching the same coding class will get paid the same amount. A similar attribute called PROJECT_HOUR_RATE is available in the project table and serves the same purpose. 

### PROJECT table:

1. A project can have 0 or more students. I assumed that there might be some projects that no student is interested in and none of the students signed up for it. Hence 0 or more relationship.
2. A project can be done by 0 or more groups. If no student has signed up for a project, then there is no group formed and thus no group does the project. Hence 0 or more.
3. A project needs 1 or more parts.
4. A project can be supervised by 1 or more instructors.
5. A project can use exactly one microcontroller. Hence, I treated it as a column, which specifies which microcontroller is used for a particular project.

### INSTRUCTOR table:

1. The textbook that is referred by an instructor to a particular coding class is stored in the TEXTBOOK_ID column in the CODING_CLASS_SECTION table. The instructor can refer the same textbook to multiple classes(sections). Also the number of hours that an instructor taught a class is stored in the HOURS_TAUGHT attribute which can be used to generate the salary of the instructor.
2. An instructor can have multiple salary records, each for a specific period of payment (Eg: Salary getting paid monthly)
3. I assumed that it is mandatory for the instructors to teach atleast 1 coding class and supervise atleast 1 project.

### GROUP table:


1. A group has 1 or more students.
2. A group does exactly 1 project. I assumed that the same group cannot be part of multiple projects.
3. A group is assigned exactly 1 table for the entire term (which means the table in the same room) to do the project.

### TABLE:

1. Each table has 0 or 1 STORAGE_BOXES. I assumed that there might be some tables in a room that are not assigned to any group and thus do not require a storage box of parts.

### PART table:

1. A part can be need in 0 or more projects.
2. A part can be ordered from 1 or more online suppliers.
3. A part can belong to 0 or more storage boxes.
4. The part table has a price attribute indicating the price of each part. The price here is the price for 1 quantity. This attribute is used to charge the students if any of the part is damaged at the end of the project.

### TEXTBOOK table:

1. A textbook can be used in 0 or more coding classes.
2. A textbook can be preferred by 0 or more instructors.

### RATINGS table:

1. An instructor / course and project can only have only 1 rating from a particular student.

### STUDENT_FEE table:

1. Every student fee detail is associated to exactly 1 student. The student pays the entire amount of the courses and projects that he enrolled at once. If there is no record pertaining to a student id, then it means that he hasnt paid the fee.

### Additional:

1. I have assumed that Supplier is same as the Vendor. Hence there is only a SUPPLIER table.
2. A part (parts required for the project) can be part of multiple orders which are supplied by multiple suppliers.
3. A supplier can supply items required for 0 or more orders.
4. I assumed that a given order can be supplied by only 1 vendor. There can be multiple orders placed that can be served by different vendors.

## Sample Database Queries
* SELECT ALL THE STUDENTS BELONGING TO A PARTICULAR PROJECT
```
SELECT * FROM PROJECT_ENROLLMENT WHERE PROJECT_ID = 1050;
```
```
SELECT S.STUDENT_ID, S.FIRST_NAME, S.LAST_NAME, PE.PROJECT_ID, PE.PROJECT_RATING
FROM STUDENT S
INNER JOIN PROJECT_ENROLLMENT PE ON S.STUDENT_ID = PE.STUDENT_ID
WHERE PE.PROJECT_ID = 1050;
```
```
SELECT S.STUDENT_ID, S.FIRST_NAME, S.LAST_NAME, PE.PROJECT_ID, P.PROJECT_NAME, PE.PROJECT_RATING, P.PROJECT_FEE, P.PROJECT_HOUR_RATE
FROM STUDENT S
INNER JOIN PROJECT_ENROLLMENT PE ON S.STUDENT_ID = PE.STUDENT_ID
INNER JOIN PROJECT P ON PE.PROJECT_ID = P.PROJECT_ID
WHERE PE.PROJECT_ID = 1050;
```
* SELECT ALL THE PROJECTS THAT A STUDENT ENROLLED
```
SELECT * FROM PROJECT_ENROLLMENT WHERE STUDENT_ID = 175;
```
```
SELECT S.STUDENT_ID, S.FIRST_NAME, S.LAST_NAME, PE.PROJECT_ID, PE.PROJECT_RATING
FROM STUDENT S
INNER JOIN PROJECT_ENROLLMENT PE ON S.STUDENT_ID = PE.STUDENT_ID
WHERE S.STUDENT_ID = 175;
```
```
SELECT S.STUDENT_ID, S.FIRST_NAME, S.LAST_NAME, PE.PROJECT_ID, P.PROJECT_NAME, PE.PROJECT_RATING, P.PROJECT_FEE, P.PROJECT_HOUR_RATE
FROM STUDENT S
INNER JOIN PROJECT_ENROLLMENT PE ON S.STUDENT_ID = PE.STUDENT_ID
INNER JOIN PROJECT P ON PE.PROJECT_ID = P.PROJECT_ID
WHERE S.STUDENT_ID = 175;
```

* CALCULATE THE FEE THAT A STUDENT HAS TO PAY FOR THE PROJECTS ENROLLED
```
SELECT SUM(P.PROJECT_FEE) AS PROJECT_FEE_TO_BE_PAID
FROM PROJECT P
INNER JOIN PROJECT_ENROLLMENT PE ON P.PROJECT_ID = PE.PROJECT_ID
WHERE PE.STUDENT_ID = 175;
```

* IDENTIFY ALL THE STUDENTS PAYING PROJECT_FEE LESS THAN 150 
```
SELECT S.STUDENT_ID, S.FIRST_NAME, S.LAST_NAME, S.EMAIL_ID, SUM(P.PROJECT_FEE) AS PROJECT_FEE_TO_BE_PAID
FROM PROJECT P
INNER JOIN PROJECT_ENROLLMENT PE ON P.PROJECT_ID = PE.PROJECT_ID
INNER JOIN STUDENT S ON S.STUDENT_ID = PE.STUDENT_ID
GROUP BY(S.STUDENT_ID, S.FIRST_NAME, S.LAST_NAME, S.EMAIL_ID) 
HAVING SUM(P.PROJECT_FEE) < 150
ORDER BY SUM(P.PROJECT_FEE) ASC;
```


* SELECT ALL THE STUDENTS THAT HAVE NOT ENROLLED IN ANY PROJECT 
```
SELECT S.STUDENT_ID,S.FIRST_NAME, S.LAST_NAME, S.EMAIL_ID, PE.STUDENT_ID
FROM STUDENT S
LEFT OUTER JOIN PROJECT_ENROLLMENT PE ON PE.STUDENT_ID = S.STUDENT_ID
WHERE PE.STUDENT_ID IS NULL;
```

* COUNT NUMBER OF STUDENTS THAT BELONG TO A PROJECT 
```
SELECT PE.PROJECT_ID, COUNT(PE.STUDENT_ID) AS TOTAL_NUMBER_OF_STUDENTS
FROM PROJECT_ENROLLMENT PE
GROUP BY PE.PROJECT_ID
ORDER BY COUNT(PE.STUDENT_ID) ASC;
```


## Contact
If you want to contact me you can reach me at <km69564@usc.edu> or <krishnamanoj14@gmail.com>.