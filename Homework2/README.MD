# Homework 2: SQL Queries 

## Problem Statement
* In this assignment, we were required to code solutions to the five SQL problems which relate back to HW1 
* We created tables for STEM tutoring business and perform queries on the data.
* Click [here](http://bytes.usc.edu/cs585/s20_db0ds1ml2agi/hw/HW2/index.html) to see the full problem statement from the course website.


## Questions
#### Question 1
* To work on their projects, each student group (who sit in numbered tables, as described in HW1) can also reserve one of ten available rooms to work on their project. The rooms can be reserved for a block of a few hours (eg. 3 hours), with a start time and end time, eg. 3pm-6pm, 9am-2pm etc. At the end of the day, everyone goes home, so there's no possibility of rooms being booked for multiple days. The table structure you are asked to use, is this:
```
CREATE TABLE ProjectRoomBookings
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
endTime INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime));
```

* There are two problems with the above. 
	- First, the start time could be incorrectly entered to be later than the end time.
	- Second, a new entry (for a new group) could be accidentally put in to occupy a room, even before the existing group in that room is done using that room. For simplicity, you can express times in the 24h military-style format, eg. 9 for 9AM, 17 for 5PM, etc. For further simplicity, all bookings start and end 'on the hour', so, ints between 7 (7AM) and 18 (6PM) should be sufficient.
* How would you redesign the table to fix both these issues? 

#### Question 2
* Write a query to create a listing that includes class name and the number of students enrolled in the class, sorted in reverse order of enrollment (eg. to tell which were the most popular classes, at the end of the term).

#### Question 3
* Below is a small table that tracks work being done on the students' projects. We have a project ID column on the left, a 'step' column in the middle (0,1,2.. denote steps of the project), and a status column on the right (where 'W' denotes 'waiting', 'C' denotes 'completed'). Such a table lets project instructors get a quick status on the various aspects (steps) of their projects ("where they're at", in colloquial, ungrammatical language). Specifically, 'W' would mean that the students are stalled for whatever reason (don't understand what to do, a part broke, they have bugs they can't fix, etc) and need additional help from the instructors - students would have a way to input these (step number, status), and instructors can review the table periodically and run queries like the one you will be creating.
```
PID        Step  Status

P100       0     C
P100       1     W
P100       2     W
P201       0     C
P201       1     C
P333       0     W
P333       1     W
P333       2     W
P333       3     W
```
* Write a query to output the project(s) where only step 0 has been completed, ie. the project gotten started but the rest of the steps are in waiting mode. In the above table, such a query would output just 'P100'. You can assume that steps get completed in order, ie. P333 will never have C,W,C,W for example [all Cs will occur before all Ws].

#### Question 4
* Below is a small sample of a junkmail database we own, ie. people we want to 'spam' via postal mail to get them to enroll their kids in our STEM academy.
```
Name      Address  ID  SameFam

'Alice'   'A'      10  NULL
'Bob'     'B'      15  NULL
'Carmen'  'C'      22  NULL
'Diego'   'A'      9   10
'Ella'    'B'      3   15
'Farkhad' 'D'      11  NULL
```

* Each entry consists of a name, address, ID, and whether there is a prior family member already in the db; in the last column, NULL means that entry is the first family member in our db, and a non-null value is the ID of the first family member (eg. Diego points to Alice, and Ella points to Bob).
* Write a query to delete from the table, names that have 'NULL' for SameFam and another family member in the db. So in our example above, the query would delete Alice and Bob, but not Carmen and Farkhad. In other words, we want to save postage by only sending one mail per household if we have two people from a house in our db (we assume that our db contains either one person per household, or two).

#### Question 5
* We post job descriptions, to build a list of qualified instructors we can pick from. Here's an abbreviated table of possible candidates, with just their name and the subject(s) they can teach:
```
Instructor   Subject

Aleph        Scratch
Aleph        Java
Aleph        Processing
Bit          Python
Bit          JavaScript
Bit          Java
CRC          Python
CRC          JavaScript
Dat          Scratch
Dat          Python
Dat          JavaScript
Emscr        Scratch
Emscr        Processing
Emscr        JavaScript
Emscr        Python
```

* Write a query that will pick out just the instructors who can teach every subject in the table below (this is so we can hire a small number of instructors who would be easy to manage, compared to a larger group) - we're deciding to offer just the classes listed below:
```
JavaScript
Scratch
Python
```

## Contact
If you want to contact me you can reach me at <km69564@usc.edu> or <krishnamanoj14@gmail.com>.