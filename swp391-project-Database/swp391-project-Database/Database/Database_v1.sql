CREATE DATABASE SWP_Database_1

CREATE TABLE Student
(
    StudentID NVARCHAR(10) PRIMARY KEY CHECK (StudentID LIKE 'SE[0-9][0-9][0-9][0-9][0-9][0-9]'),
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
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(255) NOT NULL,
    Title NVARCHAR(255),
    Credits INT DEFAULT 3,
    TotalSlot INT CHECK (TotalSlot >= 1 AND TotalSlot <= 20),
    TermNo INT CHECK (TermNo >= 1 AND TermNo <= 9),
	Status BIT DEFAULT 1
);

CREATE TABLE Teacher
(
    TeacherID NVARCHAR(10) PRIMARY KEY,
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
    CourseID INT,
    RoomNo NVARCHAR(3),
    TimeSlotID INT,
    TermNo INT,
    TeacherID NVARCHAR(10),
	FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
	FOREIGN KEY (RoomNo) REFERENCES Classroom(RoomNo),
	FOREIGN KEY (TimeSlotID) REFERENCES SlotTime(TimeSlotID),
	FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID),
    Status BIT DEFAULT 1
);

ALTER TABLE Exam
ADD StudentListID INT REFERENCES StudentList(ID)

CREATE TABLE Student_Course
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT REFERENCES Course(CourseID),
    StudentID NVARCHAR(10), 
	FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    Status BIT DEFAULT 1
);