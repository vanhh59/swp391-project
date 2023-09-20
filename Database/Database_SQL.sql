CREATE DATABASE FPT_EXAM
GO
USE FPT_EXAM
GO

CREATE TABLE Role(
    roleID char(20) PRIMARY KEY,
    name nvarchar(50)
);

CREATE TABLE Semester(
    SemesterID char(20) PRIMARY KEY,
    SemesterName nvarchar(50)
);

CREATE TABLE Subject (
    subID char(20) PRIMARY KEY,
    subName nvarchar(50)
);

CREATE TABLE Classroom (
    ClassRoomID char(20) PRIMARY KEY,
    name nvarchar(50)
);

CREATE TABLE ExamType (
    examTypeID char(20) PRIMARY KEY,
    name nvarchar(50)
);

CREATE TABLE Course (
    courseID char(20) PRIMARY KEY,
    name nvarchar(50),
	SemesterID char (20) REFERENCES Semester (SemesterID)
);

CREATE TABLE Examiner (
    examinerID char(20) PRIMARY KEY,
    name nvarchar(50),
    email varchar(50),
    password varchar(50),
    roleID char(20) REFERENCES Role(roleID)
);

CREATE TABLE Student (
    studentID char(20) PRIMARY KEY,
    name nvarchar(50),
    email varchar(50),
    password varchar(50),
    field varchar(50),
    major varchar(50),
    roleID char(20) REFERENCES Role(roleID)
);

CREATE TABLE ExamRoom (
    examRoomID char(20) PRIMARY KEY,
    classRoomID char(20) REFERENCES Classroom(ClassRoomID)
);

CREATE TABLE Subject_in_Student (
    subjectID char(20) REFERENCES Subject(subID),
    studentID char(20) REFERENCES Student(studentID),
    PRIMARY KEY (subjectID, studentID)
);

CREATE TABLE ExamSlot (
    examSlotID char (20) PRIMARY KEY,
    examTypeID char(20) REFERENCES ExamType(examTypeID),
    examinerID char(20) REFERENCES Examiner(examinerID),
    examRoomID char(20) REFERENCES ExamRoom(examRoomID),
    startTime datetime,
    endTime datetime
);

CREATE TABLE ExamSlot_in_Subject (
    examSlotID char(20) REFERENCES ExamSlot(examSlotID),
    subjectCode char(20) REFERENCES Subject(subID),
    PRIMARY KEY (examSlotID, subjectCode)
);

CREATE TABLE Exam (
    ID char(20) PRIMARY KEY,
    subjectID char(20) REFERENCES Subject(subID),
    examSlotID char(20) REFERENCES ExamSlot_in_Subject(examSlotID),
    ExaminerID char(20) REFERENCES Examiner(examinerID),
    examRoomID char(20) REFERENCES ExamRoom(examRoomID),
	courseID char(20) REFERENCES Course(courseID)
);

CREATE TABLE Student_in_Exam (
    studentID char(20) REFERENCES Student(studentID),
    ExamID char(20) REFERENCES Exam(ID)
);
