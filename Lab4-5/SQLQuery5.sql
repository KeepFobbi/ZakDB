USE Student

UPDATE Faculty
SET Phone = '(098)1234567'
WHERE DeanName = '���� ��������� �����������'
ALTER TABLE Faculty ADD pole1 varchar(50) NULL
UPDATE Faculty SET pole1 = 'asd'
UPDATE Faculty 
SET pole1 = 'qwerty'
WHERE Phone LIKE '(098)%'

UPDATE Teacher
SET TeacherName = CONVERT(varchar, '������ ���������')
WHERE Surname = '���������'
ALTER TABLE Teacher ADD pole2 varchar(50) NULL
UPDATE Teacher
SET pole2 = 'test2'
WHERE idTeacher = 2
UPDATE Teacher
SET Phone = '(098)1020036', TeacherName = '����� ���������', Surname = '������'
WHERE idTeacher = 4
UPDATE Teacher
SET pole2 = 'testasd', HomeAddress = '���. �������� 777 ��.666'
WHERE pole2 = 'test2'

UPDATE Groups
SET idFaculty = 5
WHERE Curator = 2
ALTER TABLE Groups ADD pole3 varchar(50) NOT NULL DEFAULT '-'
UPDATE Groups
SET pole3 = 'test3'
WHERE Curator = 7
UPDATE Groups
SET pole3 = 'sot'
WHERE idFaculty = 5 AND Curator = 5
UPDATE Groups
SET Starosta = '��������� ���������', GroupName = 'ϲ-60', pole3 = 'test3'
WHERE idFaculty = 5

UPDATE Lesson
SET idTeacher = 5
WHERE LectureHall = '�� 101%'
ALTER TABLE Lesson ADD Floor varchar(50) NOT NULL DEFAULT '-'
UPDATE Lesson
SET Floor = '1'
WHERE LectureHall = '�� 103'
UPDATE Lesson
SET Floor = '1'
UPDATE Lesson
SET Floor = '3'
WHERE LectureHall LIKE '3%'
UPDATE Lesson
SET Floor = '1'
WHERE LectureHall LIKE '��%'

UPDATE Students
SET StudentName = '�����'
WHERE Specialty = '���������' AND TypeOfTraining = '������'
ALTER TABLE Students ADD AVGMark FLOAT NOT NULL DEFAULT '0'
UPDATE Students
SET AVGMark = 62.5
WHERE TypeOfTraining = '��������'
UPDATE Students
SET AVGMark = 99.99
WHERE TypeOfTraining = '������' AND Specialty = '���������'
UPDATE Students
SET AVGMark = 73
WHERE Specialty = 'ʳ����������'
UPDATE Students
SET AVGMark = 75.5
WHERE TypeOfTraining = '��������' AND Birthday BETWEEN '1990-01-01' AND '1990-01-07'

SELECT * FROM Faculty
SELECT * FROM Teacher
SELECT * FROM Groups
SELECT * FROM Lesson
SELECT * FROM Students
ALTER TABLE Groups DROP COLUMN pole3

DECLARE @ENTERDAY0 date, @TypeOfTraining0 varchar(50)
SET @ENTERDAY0 = '2020-12-08'
SET @TypeOfTraining0 = '��������'
SELECT * FROM Students
WHERE EnterDay < @ENTERDAY0 AND TypeOfTraining = @TypeOfTraining0


DECLARE @Surname0 varchar(50)
SET @Surname0 = 'ճ�������'
SELECT Students.StudentName, Students.Surname, Students.idGroup, Groups.idGroup, Groups.GroupName, Groups.Starosta
FROM Students INNER JOIN Groups ON Groups.idGroup = Students.idGroup
WHERE Students.Surname = @Surname0

SELECT * FROM Teacher WHERE ScientificRank IS NULL

DECLARE @TypeOfTraining_1 varchar(50), @Specialty_1 varchar(50)
SET @TypeOfTraining_1 = '������'
SET @Specialty_1 = '���������'
SELECT * FROM Students
WHERE TypeOfTraining IN (@TypeOfTraining_1) AND Specialty IN (@Specialty_1)

DECLARE @Surname_1 varchar(50)
SET @Surname_1 = '���������'
SELECT Students.StudentName, Students.Surname, Faculty.FacultyName
FROM Students INNER JOIN Groups ON Students.idGroup = Groups.idGroup INNER JOIN Faculty ON Groups.idFaculty = Faculty.idFaculty
WHERE Students.Surname = @Surname_1

DECLARE @Surname_2 varchar(50)
SET @Surname_2 = '����������'
SELECT Teacher.TeacherName, Teacher.Surname, Lesson.LessonName
FROM Teacher INNER JOIN Lesson ON Teacher.idTeacher = Lesson.idTeacher 
WHERE Teacher.Surname = @Surname_2

DECLARE @Surname_3 varchar(50)
SET @Surname_3 = '����������'
SELECT Teacher.TeacherName, Teacher.Surname, Lesson.LectureHall, Lesson.TimeStart
FROM Teacher INNER JOIN Lesson ON Teacher.idTeacher = Lesson.idTeacher 
WHERE Teacher.Surname = @Surname_3

DECLARE @Surname_4 varchar(50)
SET @Surname_4 = '������'
SELECT Students.Surname, Groups.GroupName
FROM Students INNER JOIN Groups ON Students.idGroup = Groups.idGroup
WHERE Students.Surname IN (@Surname_4)

DECLARE @Surname_5 varchar(50)
SET @Surname_5 = '�%'
SELECT * FROM Students
WHERE Surname LIKE @Surname_5
ORDER BY Birthday

DECLARE @Surname_6 varchar(50)
SET @Surname_6 = '���������'
SELECT Students.StudentName, Students.Surname, Faculty.DeanName
FROM Students INNER JOIN Groups ON Students.idGroup = Groups.idGroup 
INNER JOIN Faculty ON Groups.idFaculty = Faculty.idFaculty
WHERE Students.Surname = @Surname_6