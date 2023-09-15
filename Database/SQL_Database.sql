DROP DATABASE FPT_EXAM;

CREATE DATABASE FPT_EXAM;

USE FPT_EXAM;


CREATE TABLE Teacher (
teacherID varchar(20) PRIMARY KEY,
name nvarchar(50),
email varchar(50),
password varchar(50),
);


CREATE TABLE Semester (
semesterID varchar(20) PRIMARY KEY,
name varchar(50)
);

CREATE TABLE Course (
courseID varchar(20) PRIMARY KEY,
name varchar(50),
semesterID varchar(20) FOREIGN KEY REFERENCES Semester(semesterID),
);

CREATE TABLE ExamType (
examTypeID varchar(20) PRIMARY KEY,
name varchar(50),
courseID varchar(20) FOREIGN KEY REFERENCES Course(courseID),
);


CREATE TABLE Student (
studentID varchar(20) PRIMARY KEY,
name varchar(50),
email varchar(50),
password varchar(50),

);

CREATE TABLE Subject (
subjectCode varchar(20) PRIMARY KEY,
name varchar(50),
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


CREATE TABLE Subject_in_Student (
subjectCode varchar(20) FOREIGN KEY REFERENCES Subject(subjectCode),
studentID varchar(20) FOREIGN KEY REFERENCES Student(studentID),
PRIMARY KEY (subjectCode, studentID)
);



CREATE TABLE ExamSlot (
examSlotID int PRIMARY KEY,
examTypeID varchar(20) FOREIGN KEY REFERENCES ExamType(examTypeID),
teacherID varchar(20) FOREIGN KEY REFERENCES Teacher(teacherID),
examRoomID varchar(20) FOREIGN KEY REFERENCES ExamRoom(examRoomID),
startTime datetime,
endTime datetime
);


CREATE TABLE ExamSlot_in_Subject (
examSlotID int FOREIGN KEY REFERENCES ExamSlot(examSlotID),
subjectCode varchar(20) FOREIGN KEY REFERENCES Subject(subjectCode),
PRIMARY KEY (examSlotID, subjectCode)
);


