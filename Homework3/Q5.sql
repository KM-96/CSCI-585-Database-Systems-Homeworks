﻿--Database Used: POSTGIS Version 12.2

--Table Creation
CREATE TABLE USC_LOCATIONS (
	LOCATION_ID varchar(20) PRIMARY KEY,
	COORDINATES geometry
);

--LIBRARY
INSERT INTO USC_LOCATIONS VALUES('DHL',ST_GEOMFROMTEXT('POINT(-118.283723 34.020038)'));
INSERT INTO USC_LOCATIONS VALUES('VKC',ST_GEOMFROMTEXT('POINT(-118.284023 34.021239)'));
INSERT INTO USC_LOCATIONS VALUES('LVL',ST_GEOMFROMTEXT('POINT(-118.282958 34.021835)'));
INSERT INTO USC_LOCATIONS VALUES('ACL',ST_GEOMFROMTEXT('POINT(-118.285565 34.019157)'));
INSERT INTO USC_LOCATIONS VALUES('SEL',ST_GEOMFROMTEXT('POINT(-118.288796 34.019604)'));

--DINING
INSERT INTO USC_LOCATIONS VALUES('CBT',ST_GEOMFROMTEXT('POINT(-118.286296 34.020204)'));
INSERT INTO USC_LOCATIONS VALUES('LSC',ST_GEOMFROMTEXT('POINT(-118.284544 34.018913)'));
INSERT INTO USC_LOCATIONS VALUES('SBD',ST_GEOMFROMTEXT('POINT(-118.282171 34.021736)'));
INSERT INTO USC_LOCATIONS VALUES('CPK',ST_GEOMFROMTEXT('POINT(-118.285801 34.020035)'));
INSERT INTO USC_LOCATIONS VALUES('LMD',ST_GEOMFROMTEXT('POINT(-118.286133 34.020601)'));

--PLAZA
INSERT INTO USC_LOCATIONS VALUES('MTP',ST_GEOMFROMTEXT('POINT(-118.282790 34.021794)'));
INSERT INTO USC_LOCATIONS VALUES('EFP',ST_GEOMFROMTEXT('POINT(-118.288917 34.020549)'));
INSERT INTO USC_LOCATIONS VALUES('MPP',ST_GEOMFROMTEXT('POINT(-118.287179 34.021350)'));
INSERT INTO USC_LOCATIONS VALUES('NBP',ST_GEOMFROMTEXT('POINT(-118.286421 34.022623)'));
INSERT INTO USC_LOCATIONS VALUES('GHP',ST_GEOMFROMTEXT('POINT(-118.283533 34.023091)'));

--SQL for Convex Hull

SELECT ST_AsText(ST_ConvexHull(
			ST_Collect(COORDINATES :: GEOMETRY)			
			)) AS POLYGON FROM USC_LOCATIONS;

--SQL for K Nearest Neighbours

SELECT USCL.LOCATION_ID, 
       ST_ASTEXT(USCL.COORDINATES),
       ST_DISTANCE(ST_GEOMFROMTEXT('POINT(-118.286133 34.020601)'), USCL.COORDINATES) AS DISTANCE
FROM USC_LOCATIONS USCL
WHERE USCL.LOCATION_ID != (SELECT LOCATION_ID FROM USC_LOCATIONS WHERE COORDINATES = ST_GEOMFROMTEXT('POINT(-118.286133 34.020601)'))
ORDER BY ST_DISTANCE(ST_GEOMFROMTEXT('POINT(-118.286133 34.020601)'), USCL.COORDINATES) ASC
LIMIT 4;