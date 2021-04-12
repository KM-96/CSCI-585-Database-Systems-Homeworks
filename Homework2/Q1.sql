/*
 * Used https://sqliteonline.com/ site to run the queries
 * Database: PostgreSQL 12.2
 */
 
/*
 * ISSUE 1:
 * The given create table query has been slightly modified in order to counter the first issue.
 * Added a CHECK constraint that checks if the start time is less than the end time.
 * I assumed that the project teams will atleast book the room for 1 hour and hence the strictly less than condition unlike less than or equal to.
 * Also apart from the above constraint, I also limited the starttime to be greater than 7 (7 AM) and endtime to be less than 18 (6 PM) - These being 
 * the only durations during which the students can book the room.
 *
 * ISSUE 2:
 * The second issue where mulitple teams try to access the same room during an overlapped duration has been dealt by adding a user defined function
 * and restricting the teams to not book overlapping schedules.
 * The user defined function named CHECK_FOR_OVERLAPPING_TIMES will check for the current record that is being inserted, against all the records 
 * already present in the table that have the same room number and identify if there are any overlaps present.
 * The function returns a count of the total number of overlaps.
 * If the number of overlaps is 0, then the new record can be insert and it does not create any conflicts.
 * On the other hand, if there number of overlaps is greater than 0, then the record is not inserted and an error is thrown by the database.
 * This is added as an additional CHECK  to the PROJECTROOMBOOKINGS table where we pass the room number, start time and end time as the arguments
 * to the user defined function.
 *
 * ANALYSIS:
 * The first three insert statements will execute without any problem as there are no conflicts between them.
 * The final insert statement will fail because it has a conflict with the first statement. 
 * [Uncomment the last insert statement to notice how the user defined function handles the overlapping issue.]
 */
 
CREATE TABLE PROJECTROOMBOOKINGS
(
    RoomNum INTEGER NOT NULL,
    StartTime INTEGER NOT NULL CHECK (StartTime >= 7),
    EndTime INTEGER NOT NULL CHECK (ENDTIME <= 18),
    GroupName CHARACTER(10) NOT NULL,
    CONSTRAINT PROJECTROOMBOOKINGS_PK PRIMARY KEY (ROOMNUM, StartTime),
    CONSTRAINT STARTTIME_LESSTHAN_ENDTIME CHECK (STARTTIME < ENDTIME)
);

CREATE OR REPLACE FUNCTION CHECK_FOR_OVERLAPPING_TIMES(ROOM_NUMBER INTEGER, START_TIME INTEGER, END_TIME INTEGER)
    RETURNS BIGINT
    LANGUAGE 'sql'
    AS $BODY$ 
    SELECT COUNT(*) FROM PROJECTROOMBOOKINGS WHERE ROOMNUM = @ROOM_NUMBER AND
    (
      (@START_TIME >= STARTTIME AND @START_TIME < ENDTIME) OR
      (@END_TIME > STARTTIME AND @END_TIME <= ENDTIME) OR
      (@START_TIME >= STARTTIME AND @START_TIME < ENDTIME AND @END_TIME > STARTTIME AND @END_TIME <= ENDTIME)
    ) 
    $BODY$;
    
ALTER TABLE PROJECTROOMBOOKINGS ADD CONSTRAINT OVERLAPPING_TIMES 
CHECK (CHECK_FOR_OVERLAPPING_TIMES(roomnum, starttime, endtime) = 0);

INSERT INTO PROJECTROOMBOOKINGS VALUES (1, 8,13,'GRP1');
INSERT INTO PROJECTROOMBOOKINGS VALUES (1, 13,14,'GRP1');
INSERT INTO PROJECTROOMBOOKINGS VALUES (1, 15,16,'GRP1');
SELECT * FROM PROJECTROOMBOOKINGS;
-- INSERT INTO PROJECTROOMBOOKINGS VALUES (1, 7,9,'GRP1');