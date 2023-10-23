CREATE DATABASE DB_EXAM;
GO
USE DB_EXAM;
GO
--SSMS
--Server name: ec2-3-27-130-125.ap-southeast-2.compute.amazonaws.com
--Login: sa
--Password: swp391
	
DROP DATABASE DB_EXAM;

CREATE TABLE Users (
    ID char(8) PRIMARY KEY,
    userName nvarchar(50),
    email char(40),
    Role char(30),
    status bit
);

CREATE TABLE Semester(
    ID char(8) PRIMARY KEY,
    code nvarchar(50),
    name nvarchar(100),
    year int,
    startDate datetime,
    endDate datetime,
    status bit
);

CREATE TABLE  Subject(
   ID char(8) PRIMARY KEY,
    code nvarchar(50),
    name nvarchar(100),
    credit int,
    status bit
);

CREATE TABLE Classroom (
    ID char(8) PRIMARY KEY,
    code nvarchar(50),
    building nvarchar(100),
    floor int,
    type nvarchar(50),
    capacity int,
    status bit
);

CREATE TABLE Course (
  ID char(8) PRIMARY KEY,
    subjectID char(20) FOREIGN KEY (subjectID) REFERENCES Subject(ID),
    semesterID char (20) FOREIGN KEY (semesterID) REFERENCES Semester(ID),
    name nvarchar(100),
    instructor nvarchar(30),
    status bit
);

CREATE TABLE ExamBatch (
    ID char(8) PRIMARY KEY,
    courseID char(20) FOREIGN KEY (courseID) REFERENCES Course(ID),
    code nvarchar(50),
    date datetime,
    location nvarchar(100),
    status bit
);

CREATE TABLE ExamSlot (
   ID char(8) PRIMARY KEY,
    examBatchID char(20) FOREIGN KEY (examBatchID) REFERENCES ExamBatch(ID),   
    startTime datetime,
    endTime datetime,
    quantity int,
    status bit
);

CREATE TABLE Examiner (
    ID char(8) PRIMARY KEY,
    name nvarchar(50),
    email varchar(50),
    experienceYears int,
    specialization nvarchar(100),
    status bit

);

CREATE TABLE Department (
    examinerID char(8) FOREIGN KEY(examinerID) REFERENCES Examiner(ID),
    name nvarchar(8),
    examinerType char(20),
    faculty nvarchar(50),
    location nvarchar(100),
    phone char(15),
    status bit
);

CREATE TABLE Examiner_In_Semeter (
      ID char(8) PRIMARY KEY,
      examinerID char(8) FOREIGN KEY (examinerID) REFERENCES Examiner(ID),
      semeterID char(8) FOREIGN KEY (semeterID) REFERENCES Semester(ID),
      totalSlot int,
      minSot int,
      maxSlot int,
      status bit
);

CREATE TABLE Student (
    ID char(8) PRIMARY KEY,
    name nvarchar(50),
    email varchar(50),
    dateOfBirth date,
    major nvarchar(50),
    yearOfStudy nvarchar(50),
    status bit
);
CREATE TABLE ExamRoom (
    ID char(8) PRIMARY KEY,
    classRoomID char(8)  FOREIGN KEY (classRoomID) REFERENCES Classroom(ID),
    examSlotID char(8)  FOREIGN KEY (examSlotID) REFERENCES ExamSlot(ID),
    subjectID char(8)  FOREIGN KEY (subjectID) REFERENCES Subject(ID),
    examinerID char(8)  FOREIGN KEY (examinerID) REFERENCES Examiner(ID)
);

CREATE TABLE Student_In_Course (
    studentID char(8) FOREIGN KEY (studentID) REFERENCES Student(ID),
    courseID char(8) FOREIGN KEY (courseID) REFERENCES Course(ID),
    PRIMARY KEY (courseID, studentID)
);

CREATE TABLE Stu_ExamRoom(
    studentID char(8) FOREIGN KEY (studentID) REFERENCES Student(ID),
    examRoomID char(8) FOREIGN KEY (examRoomID) REFERENCES ExamRoom(ID),
    PRIMARY KEY (studentID, examRoomID),
    status bit
);

CREATE TABLE Register (
    examinerID char(8) FOREIGN KEY (examinerID) REFERENCES Examiner(ID),
    examSlotID char(8) FOREIGN KEY (examSlotID) REFERENCES ExamSlot(ID) ,
    PRIMARY KEY (examinerID,examSlotID),
    status bit
);

CREATE TABLE Subject_Slot (
    subjectID char(8) FOREIGN KEY (subjectID) REFERENCES Subject(ID),
    examSlotID char(8) FOREIGN KEY (examSlotID) REFERENCES ExamSlot(ID),
    PRIMARY KEY(subjectID, examSlotID),
    status bit
);
