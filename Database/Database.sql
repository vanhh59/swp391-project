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
 userID char(30) PRIMARY KEY,
 userName nvarchar(50),
 email char(40),
 Role char(30),
);

CREATE TABLE Semester(
    semesterID char(20) PRIMARY KEY,
    code nvarchar(50),
	startDate datetime,
	endDate datetime,
);

CREATE TABLE  Subject(
    subjectID char(20) PRIMARY KEY,
    code nvarchar(50),
	status bit
);

CREATE TABLE Classroom (
    classRoomID char(20) PRIMARY KEY,
    code nvarchar(50),
	status bit,
	capacity int,
);

CREATE TABLE Course (
    courseID char(20) PRIMARY KEY,
    subjectID char(20) REFERENCES Subject(subjectID),
	semesterID char (20) REFERENCES Semester(semesterID),
);

CREATE TABLE ExamBatch (
    examBatchID char(20) PRIMARY KEY, 
    courseID char(20) REFERENCES Course(courseID),
	code nvarchar(50),
);

CREATE TABLE ExamSlot (
    examSlotID char(20) PRIMARY KEY,
    examBatchID char(20) REFERENCES ExamBatch(examBatchID),   
	date date,
    startTime datetime,
    endTime datetime,
	quantity int,
);

CREATE TABLE Examiner (
    examinerID char(20) PRIMARY KEY,
    name nvarchar(50),
    email varchar(50),
    password varchar(50),
	status bit,

);

CREATE TABLE Examiner_In_Semeter (
      examinerInSemeterID char(20) PRIMARY  KEY,
	  examinerID char(20) REFERENCES  Examiner(examinerID),
	  sesmeterID char(20) REFERENCES Semester(semesterID),
	  totalSlot int,
	  minSot int,
	  maxSlot int,
);

CREATE TABLE Student (
    studentID char(20) PRIMARY KEY,
    name nvarchar(50),
    email varchar(50),
    password varchar(50),
    status bit,
);

CREATE TABLE ExamRoom (
    examRoomID char(20) PRIMARY KEY,
    classRoomID char(20) REFERENCES Classroom(ClassRoomID),
	examSlotID char(20) REFERENCES ExamSlot(examSlotID),
	subjectID char(20) REFERENCES Subject(subjectID),
	examinerID char(20) REFERENCES Examiner(examinerID),
);

CREATE TABLE Student_In_Course (
    studentID char(20) REFERENCES Student(studentID),
	courseID char(20) REFERENCES Course (courseID),
    PRIMARY KEY (courseID, studentID)
);

CREATE TABLE Stu_ExamRoom(
    studentID char(20) REFERENCES Student(studentID),
	examRoomID char(20) REFERENCES ExamRoom(examRoomID),
	PRIMARY KEY (studentID, examRoomID),
);
CREATE TABLE Examiner_In_Slot (
    examinerID char(20) REFERENCES Examiner(examinerID),
	examSlotID char(20) FOREIGN KEY (examSlotID) REFERENCES ExamSlot(examSlotID) ,
    status VARCHAR(10)
    PRIMARY KEY (examinerID,examSlotID),
);

CREATE TABLE Subject_Slot (
    subjectID char(20) REFERENCES Subject(subjectID),
    examSlotID char(20) REFERENCES ExamSlot(examSlotID),
	PRIMARY KEY(subjectID, examSlotID),
);
