USE Student

SELECT * FROM Students
WHERE EnterDay < '2020-12-08' AND TypeOfTraining = 'Контракт'

SELECT Students.StudentName, Students.Surname, Students.idGroup, Groups.idGroup, Groups.GroupName, Groups.Starosta
FROM Students INNER JOIN Groups ON Groups.idGroup = Students.idGroup
WHERE Students.Surname = 'Хілоножко'

SELECT * FROM Teacher WHERE ScientificRank IS NULL

SELECT * FROM Students
WHERE TypeOfTraining IN ('Бюджет') AND Specialty IN ('Програміст')

SELECT Students.StudentName, Students.Surname, Faculty.FacultyName
FROM Students INNER JOIN Groups ON Students.idGroup = Groups.idGroup INNER JOIN Faculty ON Groups.idFaculty = Faculty.idFaculty
WHERE Students.Surname = 'Білоножко'

SELECT Teacher.TeacherName, Teacher.Surname, Lesson.LessonName
FROM Teacher INNER JOIN Lesson ON Teacher.idTeacher = Lesson.idTeacher 
WHERE Teacher.Surname = 'Левківський'

SELECT Teacher.TeacherName, Teacher.Surname, Lesson.LectureHall, Lesson.TimeStart
FROM Teacher INNER JOIN Lesson ON Teacher.idTeacher = Lesson.idTeacher 
WHERE Teacher.Surname = 'Левківський'

SELECT Students.Surname, Groups.GroupName
FROM Students INNER JOIN Groups ON Students.idGroup = Groups.idGroup
WHERE Students.Surname IN ('Ворона')

SELECT * FROM Students
WHERE Surname LIKE 'Б%'
ORDER BY Birthday

SELECT Students.StudentName, Students.Surname, Faculty.DeanName
FROM Students INNER JOIN Groups ON Students.idGroup = Groups.idGroup 
INNER JOIN Faculty ON Groups.idFaculty = Faculty.idFaculty
WHERE Students.Surname = 'Білоножко'