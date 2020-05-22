USE Student

CREATE TABLE History 
(
    Id INT IDENTITY PRIMARY KEY,
    TempId INT NOT NULL,
    Operation NVARCHAR(200) NOT NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE(),
)

CREATE PROC proc1
AS
UPDATE Faculty SET pole1 = 'qwerty' + 'ASD'
WHERE Phone LIKE '(098)%'
EXEC proc1
SELECT * FROM Faculty

CREATE PROC proc2
AS
SELECT * FROM Students
WHERE EnterDay < '2020-12-08' AND TypeOfTraining = 'Контракт'
EXEC proc2

CREATE PROC proc3
AS
DECLARE @ENTERDAY0 date, @TypeOfTraining0 varchar(50)
SET @ENTERDAY0 = '2020-12-08'
SET @TypeOfTraining0 = 'Контракт'
SELECT * FROM Students
WHERE EnterDay < @ENTERDAY0 AND TypeOfTraining = @TypeOfTraining0
EXEC proc3

CREATE PROC proc4
AS
SELECT Students.StudentName, Students.Surname, Faculty.FacultyName
FROM Students INNER JOIN Groups ON Students.idGroup = Groups.idGroup INNER JOIN Faculty ON Groups.idFaculty = Faculty.idFaculty
WHERE Students.Surname = 'Білоножко'
EXEC proc4
--1--
CREATE TRIGGER trigger0
ON Faculty
AFTER INSERT
AS
INSERT INTO History(TempId, Operation)
SELECT idFaculty, 'Добавлен факультет: ' + FacultyName
FROM INSERTED
INSERT INTO Faculty
(FacultyName, DeanName, Phone) VALUES
('Факультет інформаційних технологій', 'Надія Миколаївна Лобанчикова', '(063)1234567')
SELECT * FROM History

DROP TRIGGER trigger0

--2--
CREATE TRIGGER trigger1
ON Faculty
AFTER DELETE
AS
INSERT INTO History(TempId, Operation)
SELECT idFaculty, 'Удален факультет' + FacultyName 
FROM DELETED

DELETE FROM Faculty WHERE idFaculty=6
SELECT * FROM History

DROP TRIGGER trigger1

--3--
CREATE TRIGGER trigger2
ON Faculty
AFTER UPDATE
AS
INSERT INTO History(TempId, Operation)
SELECT idFaculty, 'Факультет изменен: ' + FacultyName 
FROM INSERTED
UPDATE Faculty 
SET pole1 = 'qwertyф'
WHERE Phone LIKE '(098)%'
SELECT * FROM History

USE StudTask

--1--
CREATE PROC serBalBezPer @from DATE, @to DATE AS
SELECT Rozklad_pids.DATE, AVG(reiting.Reiting) AS avgReiting
FROM Rozklad_pids INNER JOIN reiting ON Rozklad_pids.K_zapis=reiting.K_zapis
WHERE Rozklad_pids.DATE BETWEEN @from AND @to
GROUP BY Rozklad_pids.DATE

EXECUTE serBalBezPer '2017-01-06', '2017-06-01'

--3--
CREATE PROC Student4i5 AS
SELECT DISTINCT dbo_student.Name_ini
FROM reiting INNER JOIN dbo_student ON reiting.Kod_student=dbo_student.Kod_stud
WHERE reiting.Reiting BETWEEN 72 AND 100
ORDER BY dbo_student.Name_ini

EXECUTE Student4i5


--4--
CREATE PROC mark AS
DECLARE @n INT
DECLARE @e varchar(2)
SELECT dbo_student.Name_ini, AVG(reiting.Reiting) AS AvgReiting, 
	CASE 
		WHEN AVG(reiting.Reiting) BETWEEN 90 AND 100 then 5
		WHEN AVG(reiting.Reiting) BETWEEN 65 AND 89 then 4
		WHEN AVG(reiting.Reiting) BETWEEN 50 AND 64 then 3
		WHEN AVG(reiting.Reiting) BETWEEN 1 AND 49 then 2
	END AS NationalMark,
	CASE 
		WHEN AVG(reiting.Reiting) BETWEEN 90 AND 100 then 'A'
		WHEN AVG(reiting.Reiting) BETWEEN 80 AND 89 then 'B'
		WHEN AVG(reiting.Reiting) BETWEEN 65 AND 79 then 'C'
		WHEN AVG(reiting.Reiting) BETWEEN 55 AND 64 then 'D'
		WHEN AVG(reiting.Reiting) BETWEEN 50 AND 54 then 'E'
		WHEN AVG(reiting.Reiting) BETWEEN 35 AND 49 then 'FX'
		WHEN AVG(reiting.Reiting) BETWEEN 1 AND 34 then 'F'
	END AS ECTS
FROM reiting INNER JOIN dbo_student ON reiting.Kod_student = dbo_student.Kod_stud
GROUP BY dbo_student.Name_ini

EXECUTE mark
--/////--
CREATE TRIGGER NewGroup ON dbo_student FOR INSERT AS
IF @@ROWCOUNT=1
BEGIN
	IF EXISTS(
		SELECT * FROM inserted
		WHERE inserted.Kod_group NOT IN (SELECT dbo_groups.Kod_group FROM dbo_groups))
	BEGIN
		INSERT into dbo_groups (Kod_group, Kod_men, Kod_zhurn, K_navch_plan, kilk)
		SELECT inserted.Kod_group, 2, 2, 17, 20
		FROM inserted
	END
END

CREATE TRIGGER onEmptyGroup ON dbo_groups FOR DELETE AS
IF @@ROWCOUNT=1
BEGIN
	IF EXISTS(
		SELECT * FROM dbo_groups WHERE dbo_groups.kilk = 0)
	BEGIN 
		DELETE FROM dbo_groups WHERE dbo_groups.kilk = 0
	END
END
--2--
CREATE PROC SerBalVyzTeac @from Date, @to Date, @teach int AS
SELECT Rozklad_pids.Date, AVG(reiting.Reiting) AS avgReiting
FROM Rozklad_pids INNER JOIN reiting ON Rozklad_pids.K_zapis=reiting.K_zapis
WHERE Rozklad_pids.Date BETWEEN @from AND @to AND Rozklad_pids.k_vilkad = 2
GROUP BY Rozklad_pids.Date

EXECUTE SerBalVyzTeac '2017-01-06', '2017-06-01', 2


CREATE TRIGGER dateError ON zakaz FOR INSERT AS
IF @@ROWCOUNT=1
BEGIN 
	IF EXISTS(
		SELECT * FROM inserted
		WHERE inserted.date_rozm > inserted.date_naznach)
	BEGIN 
		ROLLBACK TRAN
	END
END

CREATE PROC Znigka @discount FLOAT OUTPUT, @amount int AS
IF @amount between 1 and 20  BEGIN SET @discount=0.1 END
IF @amount between 21 and 30 BEGIN SET @discount=0.2 END
IF @amount between 31 and 50 BEGIN SET @discount=0.3 END
IF @amount between 51 and 80 BEGIN SET @discount=0.4 END
IF @amount > 80 BEGIN SET @discount=0.5 END
DECLARE @disc FLOAT
DECLARE @kilkist int = 50
EXECUTE getDiscount @disc OUTPUT, @kilkist
PRINT @disc
