DROP DATABASE FPT_EXAM;

CREATE DATABASE FPT_EXAM;

USE FPT_EXAM;



CREATE TABLE Teacher (
ID int PRIMARY KEY,
Name varchar(50),
Email varchar(50),
Password varchar(50),
);

CREATE TABLE TestingAdmin (
ID int PRIMARY KEY,
Name varchar(50),
Email varchar(50),
Password varchar(50),
TeacherID int FOREIGN KEY REFERENCES Teacher(ID)
);

CREATE TABLE Semester (
ID int PRIMARY KEY,
Name varchar(50)
);

CREATE TABLE Subject (
ID int PRIMARY KEY,
Name varchar(50)
);

CREATE TABLE Student (
ID int PRIMARY KEY,
Name varchar(50),
StudentID varchar(20),
Email varchar(50),
Password varchar(50)
);

CREATE TABLE ExamRoom (
ID int PRIMARY KEY,
RoomNumber varchar(10)
);

CREATE TABLE Classroom (
ID int PRIMARY KEY,
Name varchar(50),
BuildingNumber varchar(10)
);

CREATE TABLE ExamSlot (
ID int PRIMARY KEY,
SemesterID int FOREIGN KEY REFERENCES Semester(ID),
SubjectID int FOREIGN KEY REFERENCES Subject(ID),
TeacherID int FOREIGN KEY REFERENCES Teacher(ID),
ExamRoomID int FOREIGN KEY REFERENCES ExamRoom(ID),
StartTime datetime,
EndTime datetime
);

CREATE TABLE ExamSlot_Student (
ExamSlotID int FOREIGN KEY REFERENCES ExamSlot(ID),
StudentID int FOREIGN KEY REFERENCES Student(ID),
PRIMARY KEY(ExamSlotID, StudentID)
);

CREATE TABLE ExamSlot_Classroom (
ExamSlotID int FOREIGN KEY REFERENCES ExamSlot(ID),
ClassroomID int FOREIGN KEY REFERENCES Classroom(ID),
PRIMARY KEY(ExamSlotID, ClassroomID)
);



CREATE TABLE ExamSlot_Subject (
ExamSlotID int FOREIGN KEY REFERENCES ExamSlot(ID),
SubjectID int FOREIGN KEY REFERENCES Subject(ID),
PRIMARY KEY (ExamSlotID, SubjectID)
);
