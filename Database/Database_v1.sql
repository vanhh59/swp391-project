CREATE DATABASE SWP_Database_1

CREATE TABLE Student
(
    ID NVARCHAR(10) PRIMARY KEY CHECK (ID LIKE 'SE[0-9][0-9][0-9][0-9][0-9][0-9]'),
    LastName NVARCHAR(255) NOT NULL,
    MiddleName NVARCHAR(255),
    FirstName NVARCHAR(255) NOT NULL,
	Fullname NVARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL, 
    Gender NVARCHAR(10) NOT NULL,
    IDCard NVARCHAR(20) NOT NULL,
	Address NVARCHAR(255) NOT NULL,
    MobilePhone NVARCHAR(15) NOT NULL,
    Email NVARCHAR(255) CHECK (Email LIKE '%@fpt.edu.vn') NOT NULL,
    Major NVARCHAR(255) DEFAULT 'KTPM' NOT NULL,
	Status BIT DEFAULT 1
);

CREATE TABLE Course
(
    ID INT PRIMARY KEY,
    CourseName NVARCHAR(255) NOT NULL,
    Title NVARCHAR(255),
    Credits INT DEFAULT 3,
    TotalSlot INT CHECK (TotalSlot >= 1 AND TotalSlot <= 20),
    TermNo INT CHECK (TermNo >= 1 AND TermNo <= 9),
	Status BIT DEFAULT 1
);

CREATE TABLE Teacher
(
    ID NVARCHAR(10) PRIMARY KEY,
    LastName NVARCHAR(255) NOT NULL,
    MiddleName NVARCHAR(255),
    FirstName NVARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    IDCard NVARCHAR(20),
    MobilePhone NVARCHAR(15),
    Email NVARCHAR(255) CHECK (
        Email LIKE '%@fpt.edu.vn' OR
        Email LIKE '%@fe.edu.vn'
    ),
    SlotWorked INT DEFAULT 0,
    Salary DECIMAL(10, 2) DEFAULT 0.00,
	Status BIT DEFAULT 1
);

CREATE TABLE Classroom
(
    RoomNo NVARCHAR(3) PRIMARY KEY CHECK (RoomNo LIKE '[1-4][0-9][0-9]' AND RoomNo <= '422'),
    Location NVARCHAR(255) NOT NULL,
    MaxCapacity INT CHECK (MaxCapacity = 26),
    MaxStudents INT CHECK (MaxStudents = 25),
	Status BIT DEFAULT 1
);

CREATE TABLE SlotTime
(
    TimeSlotID INT PRIMARY KEY CHECK (TimeSlotID >= 1 AND TimeSlotID <= 4),
    Day NVARCHAR(255) NOT NULL,
    StartTime TIME,
    EndTime TIME,
	Status BIT DEFAULT 1
);

CREATE TABLE Exam
(
    ExamID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT REFERENCES Course(id),
    RoomNo NVARCHAR(3) REFERENCES Classroom(RoomNo),
    TimeSlotID INT REFERENCES SlotTime(TimeSlotID),
    TermNo INT,
    TeacherID NVARCHAR(10) REFERENCES Teacher(ID),\
    Status BIT DEFAULT 1
);

CREATE TABLE StudentList
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    StudentID NVARCHAR(10) REFERENCES Student(ID),
    ExamID INT REFERENCES Exam(ExamID),
    Status BIT DEFAULT 1
);

ALTER TABLE Exam
ADD StudentListID INT REFERENCES StudentList(ID)

CREATE TABLE Student_Course
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT REFERENCES Course(ID),
    StudentID NVARCHAR(10) REFERENCES Student(ID),
    Status BIT DEFAULT 1
);