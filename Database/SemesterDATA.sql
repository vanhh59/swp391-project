CREATE DATABASE DB;
GO
USE DB;
GO
--SSMS
--Server name: ec2-3-27-130-125.ap-southeast-2.compute.amazonaws.com
--Login: sa
--Password: swp391
	
DROP DATABASE DB;

CREATE TABLE Users (
 ID char(30) PRIMARY KEY,
 userName nvarchar(50),
 email char(40),
 Role char(30),
);

CREATE TABLE Semester(
    ID char(20) PRIMARY KEY,
    code nvarchar(50),
	startDate datetime,
	endDate datetime,
);

INSERT INTO Semester (ID, code, startDate, endDate)
VALUES 
('SP23', 'Spring 2023', '2023-01-01', '2023-05-31'),
('SU23', 'Summer 2023', '2023-06-01', '2023-08-31'),
('FA23', 'Fall 2023', '2023-09-01', '2023-12-31'),
('SP24', 'Spring 2024', '2024-01-01', '2024-05-31'),
('SU24', 'Summer 2024', '2024-06-01', '2024-08-31'),
('FA24', 'Fall 2024', '2024-09-01', '2024-12-31'),
('SP25', 'Spring 2025', '2025-01-01', '2025-05-31'),
('SU25', 'Summer 2025', '2025-06-01', '2025-08-31'),
('FA25', 'Fall 2025', '2025-09-01', '2025-12-31');




CREATE TABLE  Subject(
    ID char(20) PRIMARY KEY,
    code nvarchar(50),
	status bit
);

CREATE TABLE Classroom (
    ID char(20) PRIMARY KEY,
    code nvarchar(50),
	capacity int,
	status bit,
);

CREATE TABLE Course (
    ID char(20) PRIMARY KEY,
    subjectID char(20) FOREIGN KEY (subjectID) REFERENCES Subject(ID),
	semesterID char (20) FOREIGN KEY (semesterID) REFERENCES Semester(ID),
	status bit,
);

CREATE TABLE ExamBatch (
    ID char(20) PRIMARY KEY, 
    courseID char(20) FOREIGN KEY (courseID) REFERENCES Course(ID),
	code nvarchar(50),
	status bit,
);

CREATE TABLE ExamSlot (
    ID char(20) PRIMARY KEY,
    examBatchID char(20) FOREIGN KEY (examBatchID) REFERENCES ExamBatch(ID),   
    startTime datetime,
    endTime datetime,
	quantity int,
	status bit,
);

CREATE TABLE Examiner (
    ID char(20) PRIMARY KEY,
    name nvarchar(50),
    email varchar(50),
    password varchar(50),
	status bit,

);

CREATE TABLE Department (
    examinerID char(20) FOREIGN KEY(examinerID) REFERENCES Examiner(ID),
    name nvarchar(20),
    examinerType char(20),
    status bit,
);

CREATE TABLE Examiner_In_Semeter (
      ID char(20) PRIMARY  KEY,
	  examinerID char(20) FOREIGN KEY (examinerID) REFERENCES Examiner(ID),
	  semeterID char(20) FOREIGN KEY (semeterID) REFERENCES Semester(ID),
	  totalSlot int,
	  minSot int,
	  maxSlot int,
	  status bit,
);

CREATE TABLE Student (
    ID char(20) PRIMARY KEY,
    name nvarchar(50),
    email varchar(50),
    password varchar(50),
    status bit,
);
CREATE TABLE ExamRoom (
    ID char(20) PRIMARY KEY,
    classRoomID char(20)  FOREIGN KEY (classRoomID) REFERENCES Classroom(ID),
	examSlotID char(20)  FOREIGN KEY (examSlotID) REFERENCES ExamSlot(ID),
	subjectID char(20)  FOREIGN KEY (subjectID) REFERENCES Subject(ID),
	examinerID char(20)  FOREIGN KEY (examinerID) REFERENCES Examiner(ID),
);

CREATE TABLE Student_In_Course (
    studentID char(20) FOREIGN KEY (studentID) REFERENCES Student(ID),
	courseID char(20) FOREIGN KEY (courseID) REFERENCES Course(ID),
    PRIMARY KEY (courseID, studentID)
);

CREATE TABLE Stu_ExamRoom(
    studentID char(20) FOREIGN KEY (studentID) REFERENCES Student(ID),
	examRoomID char(20) FOREIGN KEY (examRoomID) REFERENCES ExamRoom(ID),
	status bit,
	PRIMARY KEY (studentID, examRoomID),
);

CREATE TABLE Register (
    examinerID char(20) FOREIGN KEY (examinerID) REFERENCES Examiner(ID),
	examSlotID char(20) FOREIGN KEY (examSlotID) REFERENCES ExamSlot(ID) ,
    status VARCHAR(10)
    PRIMARY KEY (examinerID,examSlotID),
);

CREATE TABLE Subject_Slot (
    subjectID char(20) FOREIGN KEY (subjectID) REFERENCES Subject(ID),
    examSlotID char(20) FOREIGN KEY (examSlotID) REFERENCES ExamSlot(ID),
	PRIMARY KEY(subjectID, examSlotID),
	status bit,
);