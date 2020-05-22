USE Student

SELECT * FROM Students
WHERE EnterDay < '2020-12-08' AND TypeOfTraining = '��������'

SELECT Students.StudentName, Students.Surname, Students.idGroup, Groups.idGroup, Groups.GroupName, Groups.Starosta
FROM Students INNER JOIN Groups ON Groups.idGroup = Students.idGroup
WHERE Students.Surname = 'ճ�������'

SELECT * FROM Teacher WHERE ScientificRank IS NULL

SELECT * FROM Students
WHERE TypeOfTraining IN ('������') AND Specialty IN ('���������')

SELECT Students.StudentName, Students.Surname, Faculty.FacultyName
FROM Students INNER JOIN Groups ON Students.idGroup = Groups.idGroup INNER JOIN Faculty ON Groups.idFaculty = Faculty.idFaculty
WHERE Students.Surname = '���������'

SELECT Teacher.TeacherName, Teacher.Surname, Lesson.LessonName
FROM Teacher INNER JOIN Lesson ON Teacher.idTeacher = Lesson.idTeacher 
WHERE Teacher.Surname = '����������'

SELECT Teacher.TeacherName, Teacher.Surname, Lesson.LectureHall, Lesson.TimeStart
FROM Teacher INNER JOIN Lesson ON Teacher.idTeacher = Lesson.idTeacher 
WHERE Teacher.Surname = '����������'

SELECT Students.Surname, Groups.GroupName
FROM Students INNER JOIN Groups ON Students.idGroup = Groups.idGroup
WHERE Students.Surname IN ('������')

SELECT * FROM Students
WHERE Surname LIKE '�%'
ORDER BY Birthday

SELECT Students.StudentName, Students.Surname, Faculty.DeanName
FROM Students INNER JOIN Groups ON Students.idGroup = Groups.idGroup 
INNER JOIN Faculty ON Groups.idFaculty = Faculty.idFaculty
WHERE Students.Surname = '���������'