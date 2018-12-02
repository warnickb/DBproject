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
    managerID       INTEGER     NOT NULL
);

CREATE TABLE UserProfile(
    userID          INTEGER,
    userName        CHAR(10)   NOT NULL,
    accountID       INTEGER    NOT NULL
);

CREATE TABLE Episode(
    showID          INTEGER,
    epNum           INTEGER,
    epName          CHAR(40)    NOT NULL,
    duration        TIMESTAMP   NOT NULL,
    season          INTEGER     NOT NULL,
    views           INTEGER     NOT NULL,
    synopsis        CHAR(300)   
);

CREATE TABLE Show (
    showID          INTEGER,
    showTitle       CHAR(30)    NOT NULL,
    maturity        CHAR(5)     NOT NULL
);

CREATE TABLE CastMember (
    castID          INTEGER,
    castName        CHAR(30)    NOT NULL
);

CREATE TABLE WorkHistory (
    showID          INTEGER,
    castID          INTEGER,
    role            CHAR(15),
    startDate       DATE        NOT NULL,
    endDate         DATE        NOT NULL
);


CREATE TABLE Genre (
    showID          INTEGER,
    genreName           CHAR(15)
);

CREATE TABLE Watches (
    userID          INTEGER,
    showID          INTEGER,
    epNum           INTEGER,
    timestamp       TIMESTAMP    NOT NULL
);


SET FEEDBACK OFF
--< The INSERT statements that populate the tables>

INSERT INTO Show VALUES (743756, 'Sherlock', 'TV-14');
INSERT INTO Show VALUES (481516, 'Lost', 'TV-14');
INSERT INTO Show VALUES (123456, 'Fargo', 'TV-14');


INSERT INTO Episode VALUES (743756, 101, 'A Study in Pink', 
                            TO_TIMESTAMP('01:28:18','hh24:mi:ss'), 1, 457887,
                            'A string of apparent suicides has Scotland Yard baffled in London 2010, 
                            and officials turn to their consultant, Sherlock Holmes, for assistance.');
INSERT INTO Episode VALUES (743756, 102, 'The Blind Banker', TO_TIMESTAMP('01:28:24','hh24:mi:ss'), 1, 876568, 
                            'Holmes plunges into a world of codes and symbols when he investigates 
                            a series of murders linked to a mysterious cipher.');
INSERT INTO Episode VALUES (743756, 103, 'The Great Game', TO_TIMESTAMP('01:29:14','hh24:mi:ss'), 1, 346588, 
                            'Sherlock and John plunge into a battle of wits with 
                            a shadowy stranger when faced with a unusual clue in an empty room.');                           
INSERT INTO Episode VALUES (743756, 201, 'The Scandal in Belgravia', TO_TIMESTAMP('01:29:47','hh24:mi:ss'), 2, 435786, 
                            'Sherlock and John discover that a case of 
                            blackmail is more than just a threat to topple the monarchy.');                           
INSERT INTO Episode VALUES (743756, 202, 'The Hounds of Baskerville', TO_TIMESTAMP('01:28:36','hh24:mi:ss'), 2, 876807, 
                            'Sherlock and John investigate for their client,
                             who saw his father killed by a monstrous creature on Dartmoor 20 years earlier.');    
INSERT INTO Episode VALUES (743756, 203, 'The Reichenbach Fall', TO_TIMESTAMP('01:28:02','hh24:mi:ss'), 2, 2365457, 
                            'A whirlwind adventure and the return of 
                            arch-nemesis Moriarty lead John to believe that Sherlock is dead.');    
INSERT INTO Episode VALUES (481516, 101, 'Pilot(Part 1)', TO_TIMESTAMP('00:48:32','hh24:mi:ss'), 1, 10312543, 
                            'Forty-eight survivors crash-land onto an unknown 
                            island 1000 miles off course, struggle to figure out a way to survive.');    
INSERT INTO Episode VALUES (481516, 102, 'Pilot(Part 2)', TO_TIMESTAMP('00:44:24','hh24:mi:ss'), 1, 10023432, 
                            'Having retrieved the plane tranceiver, a group of survivors try to transmit 
                            a signal, only to receive a strange transmission from another inhabitant.');    
INSERT INTO Episode VALUES (481516, 201, 'Man of Science, Man of Faith', TO_TIMESTAMP('00:47:32','hh24:mi:ss'), 2, 10343264, 
                            'One of the castaways is chosen to descend into the mysterious hatch, and Shannon stumbles
                             upon a shockingly familiar face in the jungle.');    
INSERT INTO Episode VALUES (481516, 202, 'Adrift', TO_TIMESTAMP('00:47:14','hh24:mi:ss'), 2, 9803243, 
                            'Michael and Sawyer fight for their lives on the high seas and discover 
                            a new threat. Locke descends into the hatch to find a missing Kate.');                                                            
INSERT INTO Episode VALUES (123456, 101, 'The Crocodiles Dilemma', TO_TIMESTAMP('01:10:35','hh24:mi:ss'), 1, 15889244, 
                            'A manipulative man meets a small town insurance salesman and sets him on a path of destruction.');  
INSERT INTO Episode VALUES (123456, 102, 'The Rooster Prince', TO_TIMESTAMP('00:51:54','hh24:mi:ss'), 1, 15889238, 
                            'Molly begins to suspect that Lester is involved with the murders.');  
INSERT INTO Episode VALUES (123456, 201, 'Waiting For Dutch', TO_TIMESTAMP('00:50:51','hh24:mi:ss'), 2, 15888945, 
                            'In 1979, a turn of events at a diner disrupts the lives of the citizens in a small Minnesota town.');  
INSERT INTO Episode VALUES (123456, 202, 'Before the Law', TO_TIMESTAMP('00:59:32','hh24:mi:ss'), 2, 14665795, 
                            'The Gerhardts get a surprising offer, and two murderers do their best to clean up their mess.');  

INSERT INTO CastMember VALUES (54, 'Benedict Cumberbatch');
INSERT INTO CastMember VALUES (32, 'Steven Moffat');
INSERT INTO CastMember VALUES (934, 'Evangeline Lily');
INSERT INTO CastMember VALUES (4395, 'Matthew Fox');
INSERT INTO CastMember VALUES (546, 'J. J. Abrams');
INSERT INTO CastMember VALUES (1234, 'Billy Bob Thornton');
INSERT INTO CastMember VALUES (342, 'Martin Freeman');

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

SET FEEDBACK ON
COMMIT;
--
--< One query (per table) of the form: SELECT * FROM table; in order to print out your
--database >
--
--< The SQL queries>. Include the following for each query:
--
--< The insert/delete/update statements to test the enforcement of ICs >
COMMIT;
--
SPOOL OFF
