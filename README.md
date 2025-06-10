//Database SQL 
CREATE DATABASE StudentRegistrationSystem;
GO


USE StudentRegistrationSystem;
GO


CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY IDENTITY(1,1),
    SubjectName NVARCHAR(100) NOT NULL,
    PassingGrade FLOAT NOT NULL
);


CREATE TABLE Grades (
    GradeID INT PRIMARY KEY IDENTITY(1,1),
    GradeName NVARCHAR(50) NOT NULL
);


CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    FatherName NVARCHAR(100) NOT NULL,
    MotherName NVARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    PhoneNumber NVARCHAR(20),
    Area NVARCHAR(100),
    GradeID INT,
    FOREIGN KEY (GradeID) REFERENCES Grades(GradeID)
);


CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    FatherName NVARCHAR(100) NOT NULL,
    MotherName NVARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    PhoneNumber NVARCHAR(20)
);


CREATE TABLE TeacherSubjects (
    TeacherID INT,
    SubjectID INT,
    PRIMARY KEY (TeacherID, SubjectID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);


CREATE TABLE StudentSubjects (
    StudentID INT,
    SubjectID INT,
    GradeID INT,
    PRIMARY KEY (StudentID, SubjectID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
    FOREIGN KEY (GradeID) REFERENCES Grades(GradeID)
);
