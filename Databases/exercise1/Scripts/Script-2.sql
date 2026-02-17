DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Examiner;
DROP TABLE IF EXISTS Semester;
DROP TABLE IF EXISTS starts_in;

CREATE TABLE Student (
    StudID INTEGER PRIMARY KEY, 
    email TEXT NOT NULL, 
    name TEXT NOT NULL
);

CREATE TABLE Course (
    CID INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    capacity INTEGER NOT NULL CHECK (capacity <= 300)
);

CREATE TABLE Examiner (
    EID INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL
);

CREATE TABLE Semester (
    SemID INTEGER PRIMARY KEY,
    year INTEGER NOT NULL,
    season TEXT NOT NULL CHECK (season IN ('Autumn', 'Spring'))
);

CREATE TABLE starts_in (
    SemesterID INT REFERENCES Semester (SemID),
    StudentID INT REFERENCES Student (StudID),
    PRIMARY KEY (SemesterID, StudentID)
);
