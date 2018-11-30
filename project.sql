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

< The SQL/DDL code that creates your schema >
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
    epName          CHAR(15)    NOT NULL,
    synopsis        CHAR(150)   NOT NULL,
    duration        TIMESTAMP   NOT NULL,
    season          INTEGER     NOT NULL,
    views           INTEGER     NOT NULL
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

--
SET FEEDBACK OFF
< The INSERT statements that populate the tables>
SET FEEDBACK ON
COMMIT;
--
< One query (per table) of the form: SELECT * FROM table; in order to print out your
database >
--
< The SQL queries>. Include the following for each query:
--
< The insert/delete/update statements to test the enforcement of ICs >
COMMIT;
--
SPOOL OFF
