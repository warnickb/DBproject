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
DROP TABLE Cast CASCADE CONSTRAINTS;
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

CREATE TABLE WorkHistory (
    showID          INTEGER,
    castID          INTEGER,
    role            CHAR(15),
    startDate       DATE        NOT NULL,
    endDate         DATE        NOT NULL
);

CREATE TABLE Cast (
    castID          INTEGER,
    castName        CHAR(30)    NOT NULL
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
                            TO_TIMESTAMP('01:28:18','hh:mi:ss'), 1, 457887,
                            'A string of apparent suicides has Scotland Yard baffled in London 2010, 
                            and officials turn to their consultant, Sherlock Holmes, for assistance.');
INSERT INTO Episode VALUES (743756, 102, 'The Blind Banker', TO_TIMESTAMP('01:28:24','hh:mi:ss'), 1, 876568, 
                            'Holmes plunges into a world of codes and symbols when he investigates 
                            a series of murders linked to a mysterious cipher.');
INSERT INTO Episode VALUES (743756, 103, 'The Great Game', TO_TIMESTAMP('01:29:14','hh:mi:ss'), 1, 346588, 
                            'Sherlock and John plunge into a battle of wits with 
                            a shadowy stranger when faced with a unusual clue in an empty room.');                           
INSERT INTO Episode VALUES (743756, 201, 'The Scandal in Belgravia', TO_TIMESTAMP('01:29:47','hh:mi:ss'), 2, 435786, 
                            'Sherlock and John discover that a case of 
                            blackmail is more than just a threat to topple the monarchy.');                           
INSERT INTO Episode VALUES (743756, 202, 'The Hounds of Baskerville', TO_TIMESTAMP('01:28:36','hh:mi:ss'), 2, 876807, 
                            'Sherlock and John investigate for their client,
                             who saw his father killed by a monstrous creature on Dartmoor 20 years earlier.');    
INSERT INTO Episode VALUES (743756, 203, 'The Reichenbach Fall', TO_TIMESTAMP('01:28:02','hh:mi:ss'), 2, 2365457, 
                            'A whirlwind adventure and the return of 
                            arch-nemesis Moriarty lead John to believe that Sherlock is dead.');    




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
