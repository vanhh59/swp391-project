DROP DATABASE FPT_EXAM;

CREATE DATABASE FPT_EXAM;

USE FPT_EXAM;


CREATE TABLE Teacher (
teacherID varchar(20) PRIMARY KEY,
name nvarchar(50),
email varchar(50),
password varchar(50),
);

CREATE TABLE TestingAdmin (
testingAdminID varchar(20) PRIMARY KEY,
name nvarchar(50),
email varchar(50),
password varchar(50),
);

CREATE TABLE Semester (
semesterID varchar(20) PRIMARY KEY,
name varchar(50)
);


CREATE TABLE Student (
studentID varchar(20) PRIMARY KEY,
name varchar(50),
email varchar(50),
password varchar(50),

);

CREATE TABLE Subject (
subjectID varchar(20) PRIMARY KEY,
name varchar(50),
studentID varchar(20) FOREIGN KEY REFERENCES Student(studentID),
);

CREATE TABLE Classroom (
classRoomID varchar(20) PRIMARY KEY,
name varchar(50),
buildingNumber varchar(10)
);

CREATE TABLE ExamRoom (
examRoomID varchar(20) PRIMARY KEY,
classRoomID varchar(20) FOREIGN KEY REFERENCES Classroom(classRoomID),

);


CREATE TABLE ExamSlot (
examSlotID int PRIMARY KEY,
semesterID varchar(20) FOREIGN KEY REFERENCES Semester(semesterID),
subjectID varchar(20) FOREIGN KEY REFERENCES Subject(subjectID),
teacherID varchar(20) FOREIGN KEY REFERENCES Teacher(teacherID),
examRoomID varchar(20) FOREIGN KEY REFERENCES ExamRoom(examRoomID),
testingAdminID varchar(20) FOREIGN KEY REFERENCES TestingAdmin(testingAdminID),
startTime datetime,
endTime datetime
);
/*
CREATE TABLE ExamSlot_Student (
examSlotID int FOREIGN KEY REFERENCES ExamSlot(examSlotID),
studentID varchar(20) FOREIGN KEY REFERENCES Student(studentID),
PRIMARY KEY(examSlotID, studentID)
);



CREATE TABLE ExamSlot_Subject (
examSlotID int FOREIGN KEY REFERENCES ExamSlot(examSlotID),
subjectID varchar(20) FOREIGN KEY REFERENCES Subject(subjectID),
PRIMARY KEY (examSlotID, subjectID)
);
