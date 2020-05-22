USE Student

SELECT sysobjects.name AS �������, sysindexes.name AS ������, sysindexes.indid AS �����
FROM sysobjects INNER JOIN
 sysindexes ON sysobjects.id = sysindexes.id
WHERE (sysobjects.xtype = 'U') AND (sysindexes.indid > 0)
ORDER BY sysobjects.name, sysindexes.indid

CREATE NONCLUSTERED INDEX NAME ON Students(StudentName)
WITH  FILLFACTOR = 50

SELECT OBJECT_NAME(object_id) AS table_name,
NAME AS index_name, TYPE, TYPE_DESC
FROM sys.indexes
WHERE OBJECT_ID = OBJECT_ID(N'Students')

DROP INDEX ixName_Starosta on Groups
CREATE NONCLUSTERED INDEX ixName_Starosta on Groups(GroupName, Starosta)

SELECT idStudent, StudentName FROM Students WHERE StudentName = '����'
SELECT idStudent, StudentName FROM Students WHERE StudentName = '����' AND AVGMark > 60
SELECT StudentName FROM Students, Groups WHERE Students.idGroup = Groups.idGroup
SELECT StudentName FROM Students, Groups WHERE Students.idGroup = Groups.idGroup
AND Groups.Starosta LIKE '%���������%'

CREATE NONCLUSTERED INDEX ixFName ON [dbo].[Faculty](FacultyName)
CREATE NONCLUSTERED INDEX ixStarosta ON [dbo].[Groups](Starosta)
CREATE NONCLUSTERED INDEX ixLsName ON [dbo].[Lesson](LessonName)
CREATE NONCLUSTERED INDEX ixSurname ON [dbo].[Students](Surname)
CREATE NONCLUSTERED INDEX ixTeachSurname ON [dbo].[Teacher](TeacherName)