CREATE DATABASE movieHouse
USE movieHouse

CREATE TABLE Distributor
(
	Id_dis int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Director varchar(50) NOT NULL,
	Adress varchar(50) CONSTRAINT DirAdress_format CHECK (Adress LIKE '���. [�-�]% [0-9]% ��.[0-9]%') NOT NULL,
	PhoneNumber varchar(50) check (PhoneNumber like '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL
)

CREATE TABLE Cinema
(
	Id_cinema int IDENTITY(1,1) PRIMARY KEY,
	Adress varchar(50) CONSTRAINT CinAdress_format CHECK (Adress LIKE '���. [�-�]% [0-9]% ��.[0-9]%') NOT NULL,
	Director varchar(50) NOT NULL,
	Places int not null,
	WorkingTime Time NOT NULL,
	StaffAmount int NOT nULL,
	Id_dis int
	FOREIGN KEY (Id_dis) REFERENCES Distributor(Id_dis)
)

CREATE TABLE Staff
(
	Id_staff int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Position varchar(50) NOT NULL,
	Salary int NOT NULL,
	WorkingTime Time NOT NULL,
	Age int NOT NULL,
	PassportCode varchar(8) CONSTRAINT PassportCode_format CHECK (PassportCode LIKE '[A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9]'),
	IDCode int,
	Id_cinema int,
	FOREIGN KEY (Id_cinema) REFERENCES Cinema(Id_cinema)
)

CREATE TABLE Visitors
(
	Id_vis int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(50),
	LastName varchar(50),
	Place int NOT NULL,
	SessionDate smalldatetime NOT NULL,
	Price int NOT NULL,
	Id_cinema int,
	FOREIGN KEY (Id_cinema) REFERENCES Cinema(Id_cinema)
)

CREATE TABLE Films
(
	Id_film int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(50) NOT NULL,
	PremiereDate smalldatetime NOT NULL,
	Duration varchar(50) CONSTRAINT Duration_format CHECK (Duration LIKE '[0-9]% x�.') NOT NULL,
	Price int NOT NULL,
	AmountOfTickets int NOT NULL,
	Id_dis int
	FOREIGN KEY (Id_dis) REFERENCES Distributor(Id_dis)
)

INSERT INTO Distributor
(Name, Director, Adress, PhoneNumber) VALUES
('Vanessa', '������� ѳ����', '���. ��������� 10 ��.1', '(073)0000000'),
('Lama', '�������� ���-���', '���. ��������� 10 ��.1', '(073)0000000'),
('Kolomoy', '���� ���������', '���. ��������� 10 ��.1', '(073)0000000'),
('FilmInCloud', '����� ͳ������', '���. ��������� 10 ��.1', '(073)0000000'),
('LogiMuvie', '������ �����', '���. ��������� 10 ��.1', '(073)0000000')

INSERT INTO Cinema
(Adress, Director, Places, WorkingTime, StaffAmount, Id_dis) VALUES
('���. ����� 10 ��.1', '��������� ���������', 200, '22:00:00', 9, 1),
('���. ����� 10 ��.1', 'ĳ�� ������', 150, '20:00:00', 5, 2),
('���. ����� 10 ��.1', '������� �����', 100, '18:00:00', 3, 3),
('���. ����� 10 ��.1', '�������� ����', 400, '00:00:00', 20, 4),
('���. ����� 10 ��.1', '������ ������', 220, '23:00:00', 14, 5)

INSERT INTO Staff
(Name, LastName, Position, Salary, WorkingTime, Age, PassportCode, IDCode, Id_cinema) VALUES
('�����', '���������', '�����', 6000, '22:00:00', 20, NULL, 000111023, 1),
('�����', '���������', '�������', 8000, '22:00:00', 32, 'EE123456', NULL, 2),
('�������', '������', '�������������', 5000, '22:00:00', 43, 'AU333333', NULL, 3),
('������', '�����', '�����', 9000, '22:00:00', 18, NULL, 000158745, 4),
('������', '�������', '�������', 25000, '22:00:00', 111, 'AA000001', NULL, 5)

INSERT INTO Visitors
(Name, LastName, Place, SessionDate, Price, Id_cinema) VALUES
('���������', '���������', 1, '2020-05-08 15:00:00', 0, 4),
(NULL, NULL, 2, '2020-05-08 15:00:00', 50, 1),
(NULL, NULL, 3, '2020-05-08 15:00:00', 60, 2),
(NULL, NULL, 12, '2020-05-09 15:00:00', 70, 3),
(NULL, NULL, 65, '2020-05-10 15:00:00', 100, 5)

INSERT INTO Films
(Name, PremiereDate, Duration, Price, AmountOfTickets, Id_dis) VALUES
('����� � ����', '2020-01-01 10:00:00', '120 x�.', 60000, 500, 1),
('�������', '2020-01-01 10:00:00', '120 x�.', 70000, 400, 2),
('������� 2020', '2020-01-01 10:00:00', '120 x�.', 80000, 500, 3),
('˸� 2', '2020-01-01 10:00:00', '120 x�.', 90000, 2000, 4),
('�������-���������', '2020-01-01 10:00:00', '120 x�.', 100000, 700, 5)

SELECT * FROM Distributor
SELECT * FROM Cinema
SELECT * FROM Staff
SELECT * FROM Visitors
SELECT * FROM Films