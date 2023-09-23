CREATE DATABASE FPT_EXAM
drop database FPT_EXAM
GO
USE FPT_EXAM
GO

CREATE TABLE Role(
    roleID char(20) PRIMARY KEY,
    name nvarchar(50)
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
	status char(4)
);

CREATE TABLE Classroom (
    classRoomID char(20) PRIMARY KEY,
    code nvarchar(50),
	status char(4),
	capacity nvarchar(35),
	
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


CREATE TABLE Examiner (
    examinerID char(20) PRIMARY KEY,
    name nvarchar(50),
    email varchar(50),
    password varchar(50),
	status char(4),
	roleID char(20) REFERENCES Role(roleID),
);
CREATE TABLE Examiner_In_Semeter (
      examinerInSemeterID char(20) PRIMARY  KEY,
	  examinerID char(20) REFERENCES  Examiner(examinerID),
	  sesmeterID char(20) REFERENCES Semester(semesterID),
	  totalSlot nvarchar(60),
	  minSot nvarchar(40),
	  maxSlot nvarchar(60),
);

CREATE TABLE Student (
    studentID char(20) PRIMARY KEY,
    name nvarchar(50),
    email varchar(50),
    password varchar(50),
    Status char(4),
    roleID char(20) REFERENCES Role(roleID)
);

CREATE TABLE ExamRoom (
    examRoomID char(20) PRIMARY KEY,
    classRoomID char(20) REFERENCES Classroom(ClassRoomID),
	examSlotID varchar(20) ,
	subjectID char(20) REFERENCES Subject(subjectID),
	examinerID char(20),

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
drop table Examiner_In_Slot
CREATE TABLE Examiner_In_Slot (
    examinerID char(20) REFERENCES Examiner(examinerID),
    status char(4),
    PRIMARY KEY (examinerID),
);
ALTER TABLE Examiner_In_Slot
ADD examSlotID char(20) FOREIGN KEY (examSlotID) REFERENCES ExamSlot(examSlotID) 

CREATE TABLE ExamSlot (
    examSlotID char(20) PRIMARY KEY,
    examBatchID char(20) REFERENCES ExamBatch(examBatchID),
    examRoomID char(20) REFERENCES ExamRoom(examRoomID),
	date date,
    startTime datetime,
    endTime datetime,
	quantity char(20),
);

CREATE TABLE Subject_Slot (
    subjectID char(20) REFERENCES Subject(subjectID),
    examSlotID char(20) REFERENCES ExamSlot(examSlotID),
	PRIMARY KEY(subjectID, examSlotID),
);
