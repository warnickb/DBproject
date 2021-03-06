SPOOL project.out
SET ECHO ON
/*
CIS 353 - Database Design Project
<One line per team member name>
*/
DROP TABLE Subscription CASCADE CONSTRAINTS;
DROP TABLE UserProfile CASCADE CONSTRAINTS;
DROP TABLE Episode CASCADE CONSTRAINTS;
DROP TABLE Show CASCADE CONSTRAINTS;
DROP TABLE WorkHistory CASCADE CONSTRAINTS;
DROP TABLE CastMember CASCADE CONSTRAINTS;
DROP TABLE Genre CASCADE CONSTRAINTS;
DROP TABLE Watches CASCADE CONSTRAINTS;

--< The SQL/DDL code that creates your schema >
CREATE TABLE Subscription(
    accountID       INTEGER,
    email           CHAR(25)    NOT NULL,
    nextBillDate    DATE        NOT NULL,
    lastBillDate    DATE        NOT NULL,
    paymentMethod   CHAR(10)    NOT NULL,
    managerID       INTEGER     NOT NULL,
    CONSTRAINT suIC1 PRIMARY KEY(accountID)
);

CREATE TABLE UserProfile(
    userID          INTEGER,
    userName        CHAR(20)   NOT NULL,
    accountID       INTEGER    NOT NULL,
    CONSTRAINT uIC1 PRIMARY KEY(userID)
);

CREATE TABLE Show (
    showID          INTEGER,
    showTitle       CHAR(30)    NOT NULL,
    maturity        CHAR(5)     NOT NULL,
    CONSTRAINT shIC1 PRIMARY KEY(showID)   
);

CREATE TABLE Episode(
    showID          INTEGER,
    epNum           INTEGER,
    epName          CHAR(40)    NOT NULL,
    duration        TIMESTAMP   NOT NULL,
    season          INTEGER     NOT NULL,
    views           INTEGER     NOT NULL,
    synopsis        CHAR(300),
    CONSTRAINT eIC1 FOREIGN KEY(showID) REFERENCES Show(showID) ON DELETE CASCADE,
	CONSTRAINT eIC2 CHECK(NOT(season = 0)),
	CONSTRAINT eIC3 CHECK(SUBSTR(epNum, 0, 1)= SUBSTR(season, 0, 1)) 
);

CREATE TABLE CastMember (
    castID          INTEGER,
    castName        CHAR(30)    NOT NULL,
    CONSTRAINT cIC1 PRIMARY KEY(castID)  
);

CREATE TABLE WorkHistory (
    showID          INTEGER,
    castID          INTEGER,
    role            CHAR(15),
    startDate       DATE        NOT NULL,
    endDate         DATE        NOT NULL,
    CONSTRAINT woIC1 FOREIGN KEY(showID) REFERENCES Show(showID) ON DELETE CASCADE,
	CONSTRAINT woIC2 FOREIGN KEY(castID) REFERENCES CastMember(castID) ON DELETE CASCADE
);


CREATE TABLE Genre (
    showID          INTEGER,
    genreName           CHAR(15),
    CONSTRAINT gIC1 FOREIGN KEY(showID) REFERENCES Show(showID) ON DELETE CASCADE
);

CREATE TABLE Watches (
    userID          INTEGER,
    showID          INTEGER,
    epNum           INTEGER,
    timestamp       TIMESTAMP    NOT NULL,
    CONSTRAINT wIC1 FOREIGN KEY(userID) REFERENCES UserProfile(userID) ON DELETE CASCADE,
	CONSTRAINT wIC2 FOREIGN KEY(showID) REFERENCES Show(showID) ON DELETE CASCADE,
	CONSTRAINT wIC3 CHECK(NOT(epNum = 0))
);


SET FEEDBACK OFF
--< The INSERT statements that populate the tables>

INSERT INTO Show VALUES (743756, 'Sherlock', 'TV-14');
INSERT INTO Show VALUES (481516, 'Lost', 'TV-14');
INSERT INTO Show VALUES (123456, 'Fargo', 'TV-14');
INSERT INTO Show VALUES (999999, 'Star Trek: The Original Series', 'TV-PG');

INSERT INTO Episode VALUES (743756, 101, 'A Study in Pink', 
                            TO_TIMESTAMP('01:28:18','hh24:mi:ss'), 1, 457887,
                            'A string of apparent suicides has Scotland Yard baffled in London 2010, and officials turn to their consultant, Sherlock Holmes, for assistance.');
INSERT INTO Episode VALUES (743756, 102, 'The Blind Banker', TO_TIMESTAMP('01:28:24','hh24:mi:ss'), 1, 876568, 
                            'Holmes plunges into a world of codes and symbols when he investigates a series of murders linked to a mysterious cipher.');
INSERT INTO Episode VALUES (743756, 103, 'The Great Game', TO_TIMESTAMP('01:29:14','hh24:mi:ss'), 1, 346588, 
                            'Sherlock and John plunge into a battle of wits with a shadowy stranger when faced with a unusual clue in an empty room.');                           
INSERT INTO Episode VALUES (743756, 201, 'The Scandal in Belgravia', TO_TIMESTAMP('01:29:47','hh24:mi:ss'), 2, 435786, 
                            'Sherlock and John discover that a case of blackmail is more than just a threat to topple the monarchy.');                           
INSERT INTO Episode VALUES (743756, 202, 'The Hounds of Baskerville', TO_TIMESTAMP('01:28:36','hh24:mi:ss'), 2, 876807, 
                            'Sherlock and John investigate for their client, who saw his father killed by a monstrous creature on Dartmoor 20 years earlier.');    
INSERT INTO Episode VALUES (743756, 203, 'The Reichenbach Fall', TO_TIMESTAMP('01:28:02','hh24:mi:ss'), 2, 2365457, 
                            'A whirlwind adventure and the return of arch-nemesis Moriarty lead John to believe that Sherlock is dead.');    
INSERT INTO Episode VALUES (481516, 101, 'Pilot(Part 1)', TO_TIMESTAMP('00:48:32','hh24:mi:ss'), 1, 10312543, 
                            'Forty-eight survivors crash-land onto an unknown island 1000 miles off course, struggle to figure out a way to survive.');    
INSERT INTO Episode VALUES (481516, 102, 'Pilot(Part 2)', TO_TIMESTAMP('00:44:24','hh24:mi:ss'), 1, 10023432, 
                            'Having retrieved the plane tranceiver, a group of survivors try to transmit a signal, only to receive a strange transmission from another inhabitant.');    
INSERT INTO Episode VALUES (481516, 201, 'Man of Science, Man of Faith', TO_TIMESTAMP('00:47:32','hh24:mi:ss'), 2, 10343264, 
                            'One of the castaways is chosen to descend into the mysterious hatch, and Shannon stumbles upon a shockingly familiar face in the jungle.');    
INSERT INTO Episode VALUES (481516, 202, 'Adrift', TO_TIMESTAMP('00:47:14','hh24:mi:ss'), 2, 9803243, 
                            'Michael and Sawyer fight for their lives on the high seas and discover a new threat. Locke descends into the hatch to find a missing Kate.');                                                            
INSERT INTO Episode VALUES (123456, 101, 'The Crocodiles Dilemma', TO_TIMESTAMP('01:10:35','hh24:mi:ss'), 1, 15889244, 
                            'A manipulative man meets a small town insurance salesman and sets him on a path of destruction.');  
INSERT INTO Episode VALUES (123456, 102, 'The Rooster Prince', TO_TIMESTAMP('00:51:54','hh24:mi:ss'), 1, 15889238, 
                            'Molly begins to suspect that Lester is involved with the murders.');  
INSERT INTO Episode VALUES (123456, 201, 'Waiting For Dutch', TO_TIMESTAMP('00:50:51','hh24:mi:ss'), 2, 15888945, 
                            'In 1979, a turn of events at a diner disrupts the lives of the citizens in a small Minnesota town.');  
INSERT INTO Episode VALUES (123456, 202, 'Before the Law', TO_TIMESTAMP('00:59:32','hh24:mi:ss'), 2, 14665795, 
                            'The Gerhardts get a surprising offer, and two murderers do their best to clean up their mess.');  
INSERT INTO Episode VALUES (999999, 101, 'The Cage', TO_TIMESTAMP('01:03:25','hh24:mi:ss'), 1, 12343214, 
                            'Captain Pike has been captured and is being tested upon by mysterious aliens! As the crew tries to rescue him, they are soon left questioning what is real and what is not...');
INSERT INTO Episode VALUES (999999, 102, 'The Man Trap', TO_TIMESTAMP('00:50:12','hh24:mi:ss'), 1, 13589734, 
                            'Something strange and sinister seems to have boarded the enterprise. Its victims suffer a rather unusual death.');
INSERT INTO Episode VALUES (999999, 103, 'Charlie X', TO_TIMESTAMP('00:50:34','hh24:mi:ss'), 1, 12013255, 
                            'The Enterprise has picked up a strange passenger -- a 17-year-old boy with dangerous psychic powers.');
INSERT INTO Episode VALUES (999999, 104, 'Where No Man Has Gone Before', TO_TIMESTAMP('00:50:16','hh24:mi:ss'), 1, 15432671, 
                            'When investigating investigating the fate of a lost ship, two crew members fall unconcious and awaken with strange powers.');
--< testing eIC1, this should fail foreign key test >
INSERT INTO Episode VALUES (123, 104, 'Where No Man Has Gone Before', TO_TIMESTAMP('00:50:16','hh24:mi:ss'), 1, 15432671, 
                            'When investigating investigating the fate of a lost ship, two crew members fall unconcious and awaken with strange powers.'); 
--< testing eIC3, this should fail because episode number doesnt match season >
INSERT INTO Episode VALUES (999999, 104, 'Where No Man Has Gone Before', TO_TIMESTAMP('00:50:16','hh24:mi:ss'), 2, 15432671, 
                            'When investigating investigating the fate of a lost ship, two crew members fall unconcious and awaken with strange powers.');
							
INSERT INTO CastMember VALUES (54, 'Benedict Cumberbatch');
INSERT INTO CastMember VALUES (32, 'Steven Moffat');
INSERT INTO CastMember VALUES (934, 'Evangeline Lily');
INSERT INTO CastMember VALUES (4395, 'Matthew Fox');
INSERT INTO CastMember VALUES (546, 'J. J. Abrams');
INSERT INTO CastMember VALUES (1234, 'Billy Bob Thornton');
INSERT INTO CastMember VALUES (342, 'Martin Freeman');
INSERT INTO CastMember VALUES (23, 'Leonard Nimoy');
INSERT INTO CastMember VALUES (42, 'William Shatner');
INSERT INTO CastMember VALUES (616, 'Gene Roddenberry');

INSERT INTO WorkHistory VALUES (743756, 54, 'Star', TO_DATE('10/24/2010', 'MM/DD/YYYY'),  TO_DATE('01/15/2017', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (743756, 32, 'Showrunner', TO_DATE('10/24/2010', 'MM/DD/YYYY'),  TO_DATE('01/15/2017', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (743756, 342, 'Star', TO_DATE('10/24/2010', 'MM/DD/YYYY'),  TO_DATE('01/15/2017', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (481516, 934, 'Star', TO_DATE('09/22/2004', 'MM/DD/YYYY'),  TO_DATE('05/23/2010', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (481516, 4395, 'Star', TO_DATE('09/22/2004', 'MM/DD/YYYY'),  TO_DATE('05/23/2010', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (481516, 546, 'Writer', TO_DATE('09/22/2004', 'MM/DD/YYYY'),  TO_DATE('05/23/2010', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (481516, 546, 'Director', TO_DATE('09/22/2004', 'MM/DD/YYYY'),  TO_DATE('05/23/2010', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (481516, 546, 'Producer', TO_DATE('09/22/2004', 'MM/DD/YYYY'),  TO_DATE('05/23/2010', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (123456, 1234, 'Star', TO_DATE('04/14/2014', 'MM/DD/YYYY'),  TO_DATE('05/10/2017', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (123456, 342, 'Star', TO_DATE('04/14/2014', 'MM/DD/YYYY'),  TO_DATE('12/17/2015', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (999999, 23, 'Star', TO_DATE('09/08/1966', 'MM/DD/YYYY'),  TO_DATE('06/03/1969', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (999999, 42, 'Star', TO_DATE('09/08/1966', 'MM/DD/YYYY'),  TO_DATE('06/03/1969', 'MM/DD/YYYY'));
INSERT INTO WorkHistory VALUES (999999, 616, 'Producer', TO_DATE('09/08/1966', 'MM/DD/YYYY'),  TO_DATE('06/03/1969', 'MM/DD/YYYY'));

INSERT INTO Genre VALUES (743756, 'Crime');
INSERT INTO Genre VALUES (743756, 'Drama');
INSERT INTO Genre VALUES (743756, 'British TV');
INSERT INTO Genre VALUES (481516, 'Adventure');
INSERT INTO Genre VALUES (481516, 'Mystery');
INSERT INTO Genre VALUES (481516, 'Science Fiction');
INSERT INTO Genre VALUES (123456, 'Crime');
INSERT INTO Genre VALUES (123456, 'Drama');
INSERT INTO Genre VALUES (999999, 'Science Fiction');
INSERT INTO Genre VALUES (999999, 'Space Opera');
INSERT INTO Genre VALUES (999999, 'Space Western');

INSERT INTO Subscription VALUES (123456, 'fake@fakemail.com', TO_DATE('11/05/2018', 'MM/DD/YYYY'),  TO_DATE('12/05/2018', 'MM/DD/YYYY'), 'Visa', 1111);
INSERT INTO Subscription VALUES (64845, 'superfake@fa.ke', TO_DATE('11/25/2018', 'MM/DD/YYYY'),  TO_DATE('12/25/2018', 'MM/DD/YYYY'), 'Mastercard', 1212);
--< testing suIC1, this should fail primary key test >
INSERT INTO Subscription VALUES (123456, 'fake@fakemail.com', TO_DATE('11/05/2018', 'MM/DD/YYYY'),  TO_DATE('12/05/2018', 'MM/DD/YYYY'), 'Visa', 1111);

INSERT INTO UserProfile VALUES (1111, 'oneone', 123456);
INSERT INTO UserProfile VALUES (2222, 'twotwo', 123456);
INSERT INTO UserProfile VALUES (3333, 'threethree', 123456);
INSERT INTO UserProfile VALUES (4444, 'fourfour', 123456);
INSERT INTO UserProfile VALUES (1212, 'onetwo', 64845);


INSERT INTO Watches VALUES (1111, 743756, 101, TO_TIMESTAMP('01:28:18', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (1111, 743756, 102, TO_TIMESTAMP('00:54:16', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (2222, 481516, 101, TO_TIMESTAMP('00:48:32', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (3333, 481516, 101, TO_TIMESTAMP('00:48:32', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (3333, 481516, 102, TO_TIMESTAMP('00:42:12', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (3333, 743756, 201, TO_TIMESTAMP('01:29:47', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (3333, 123456, 201, TO_TIMESTAMP('00:51:54', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (4444, 999999, 101, TO_TIMESTAMP('01:03:25', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (4444, 999999, 102, TO_TIMESTAMP('00:50:12', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (1212, 481516, 101, TO_TIMESTAMP('00:48:32', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (1212, 481516, 102, TO_TIMESTAMP('00:44:24', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (1212, 481516, 201, TO_TIMESTAMP('00:47:32', 'hh24:mi:ss'));
INSERT INTO Watches VALUES (1212, 481516, 202, TO_TIMESTAMP('00:47:12', 'hh24:mi:ss'));
--< testing wIC3, this should fail because epNum = 0 >
INSERT INTO Watches VALUES (1111, 743756, 0, TO_TIMESTAMP('01:28:18', 'hh24:mi:ss'));


SET FEEDBACK ON
COMMIT;
--
--< One query (per table) of the form: SELECT * FROM table; in order to print out your
--database >
--
--< The SQL queries>. Include the following for each query:
SET ECHO ON
-- ---------------------------------------------------------------
-- 
-- Queries
--
-- ------------------------------------------------------------
SELECT * FROM Subscription;
SELECT * FROM UserProfile;
SELECT * FROM Episode;
SELECT * FROM Show;
SELECT * FROM CastMember;
SELECT * FROM WorkHistory;
SELECT * FROM Genre;
SELECT * FROM Watches;

--Join 4 Relations, SUM -------------------------------
--
/*
Find the total views Martin Freeman has per show.
*/
SELECT S.showTitle, SUM(E.views)
FROM Show S, Episode E, CastMember C, WorkHistory W
WHERE C.castName = 'Martin Freeman' AND
      C.castID = W.castID AND
      W.showID = S.showID AND
      W.showID = E.showID
GROUP BY S.showTitle;
--
-- Self Join ------------------------------
-- 
/*
Find the Cast ID and Name for pairs of cast apperances in the same show that have different end dates. 
*/
SELECT C1.castID, C1.castName, C2.castID, C2.castName
FROM CastMember C1, CastMember C2, WorkHistory W1, WorkHistory W2 
WHERE C1.castID = W1.castID AND C2.castID = W2.castID AND
		W1.showID = W2.showID AND W1.endDate != W2.endDate AND
		C1.castID > C2.castID
ORDER BY C1.castName;
--
-- Union, Intersect, and/or Minus ---------------------------
--
/*
Find cast members that worked on science fiction shows but did not star in them.
*/
SELECT C.CastName
FROM CastMember C, Genre G, WorkHistory W
WHERE C.castID = W.CastID AND
      W.showID = G.showID AND
      'Science Fiction' IN G.genreName
MINUS
SELECT C.CastName 
FROM  CastMember C, WorkHistory W
WHERE C.castID = W.castID AND
      W.role = 'Star';
--
-- Group By, Having, and Order By -------------------------------------------
-- 
/*
Find the show ID and Show name for every show that has more than two cast members 
*/
SELECT S.showID, S.showTitle, COUNT(*)
FROM Show S, WorkHistory W
WHERE S.showID = W.showID
GROUP BY S.showID, S.showTitle
HAVING COUNT (*) > 2
ORDER BY S.showID;
--
-- Correlated Subquery, AVG -------------------
--
/*
Find the show ID, Show Title, Episode Number, and Episode name for all episodes that have more than the adverage number of views, sorted by show ID. 
*/
SELECT S.showID, S.showTitle, E.epNum, E.epName
FROM Show S, Episode E 
WHERE S.showID = E.showID AND
	E.views > (SELECT AVG (E2.views)
		 FROM Episode E2
		 WHERE E2.showID = S.showID)
ORDER BY S.showID;
--
-- Non-Correlated Subquery ----------------------------------
--
/*
Find the cast ID and Name of all cast members that do not work on a show of the drama genre. 
*/ 
SELECT C.castID, C.castName
FROM CastMember C
WHERE C.castID NOT IN 
		(SELECT W.castID
		 FROM Genre G, WorkHistory W
		 WHERE W.showID = G.showID AND
			G.genreName = 'Drama');
--
-- Relational Division ----------------------------------
-- 
/*
Find the castID and castName of every CastMember working on all crime shows
*/
SELECT C.castID, C.castName
FROM CastMember C
WHERE NOT EXISTS(
      (SELECT G.showID
       FROM   Genre G
       WHERE  G.genreName = 'Crime')
       MINUS
       (SELECT W.showID
       FROM WorkHistory W
       WHERE C.castID = W.castID));
-- 
-- Outer Join Query --------------------------------
--
/*
For every cast member find their cast ID and cast name. Also find the show ID they're working on and their role.
*/
SELECT C.castID, C.castName, W.showID, W.role
From CastMember C LEFT OUTER JOIN WorkHistory W On C.castID = W.castID;
--
-- Rank Query -------------------------------
--
/*
Find the rank of the first episode of season to for all shows.
*/
SELECT RANK (201) WITHIN GROUP
	(ORDER BY epNum) "Rank of episode 1 of season 2"
FROM Episode;

--
-- Top-N Query ---------------------------------------------
--
/*
Find the show ID, Show title, and Episode number of the five most viewed episodes, sorted by views. 
*/
SELECT *
FROM (SELECT S.showID, S.showTitle, E.epNum, E.epName, E.views FROM Show S, Episode E WHERE S.showID = E.showID ORDER BY views DESC)
WHERE ROWNUM <= 5;
--
SET ECHO OFF
SPOOL OFF
--< The insert/delete/update statements to test the enforcement of ICs >
COMMIT;
--
SPOOL OFF