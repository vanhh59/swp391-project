CREATE DATABASE FPT_EXAM;

USE FPT_EXAM;
GO

CREATE TABLE Role(
    roleID varchar(20) PRIMARY KEY,
    name nvarchar(50)
);

CREATE TABLE Semester(
    SemesterID varchar(20) PRIMARY KEY,
    SemesterName varchar(50)
);

CREATE TABLE Subject (
    subID varchar(20) PRIMARY KEY,
    subName varchar(50)
);

CREATE TABLE Classroom (
    ClassRoomID varchar(20) PRIMARY KEY,
    name varchar(50)
);

CREATE TABLE ExamType (
    examTypeID varchar(20) PRIMARY KEY,
    name varchar(50)
);

CREATE TABLE Course (
    courseID varchar(20) PRIMARY KEY,
    name varchar(50)
);

CREATE TABLE Examiner (
    examinerID varchar(20) PRIMARY KEY,
    name nvarchar(50),
    email varchar(50),
    password varchar(50),
    roleID varchar(20) REFERENCES Role(roleID)
);

CREATE TABLE Student (
    studentID varchar(20) PRIMARY KEY,
    name varchar(50),
    email varchar(50),
    password varchar(50),
    field varchar(50),
    major varchar(50),
    roleID varchar(20) REFERENCES Role(roleID)
);

CREATE TABLE ExamRoom (
    examRoomID varchar(20) PRIMARY KEY,
    classRoomID varchar(20) REFERENCES Classroom(ClassRoomID)
);

CREATE TABLE Subject_in_Student (
    subjectID varchar(20) REFERENCES Subject(subID),
    studentID varchar(20) REFERENCES Student(studentID),
    PRIMARY KEY (subjectID, studentID)
);

CREATE TABLE ExamSlot (
    examSlotID int PRIMARY KEY,
    examTypeID varchar(20) REFERENCES ExamType(examTypeID),
    examinerID varchar(20) REFERENCES Examiner(examinerID),
    examRoomID varchar(20) REFERENCES ExamRoom(examRoomID),
    startTime datetime,
    endTime datetime
);

CREATE TABLE ExamSlot_in_Subject (
    examSlotID varchar(20) REFERENCES ExamSlot(examSlotID),
    subjectCode varchar(20) REFERENCES Subject(subID),
    PRIMARY KEY (examSlotID, subjectCode)
);

CREATE TABLE Exam (
    ID varchar(20) PRIMARY KEY,
    subjectID varchar(20) REFERENCES Subject(subID),
    examSlotID varchar(20) REFERENCES ExamSlot_in_Subject(examSlotID),
    ExaminerID varchar(20) REFERENCES Examiner(examinerID),
    examRoomID varchar(20) REFERENCES ExamRoom(examRoomID)
);

CREATE TABLE Student_in_Exam (
    studentID varchar(20) REFERENCES Student(studentID),
    ExamID varchar(20) REFERENCES Exam(ID)
);
