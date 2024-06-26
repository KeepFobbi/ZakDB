create database torg_firm
go
USE [torg_firm]
GO
/****** Object:  Table [dbo].[klient]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klient](
	[id_klient] [int] NOT NULL,
	[Nazva] [varchar](50) NULL,
	[Adress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_klient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[postachalnik]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postachalnik](
	[id_postach] [int] NOT NULL,
	[Nazva] [varchar](50) NULL,
	[Adress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
	[Kontakt_osoba] [varchar](50) NULL,
	[Posada] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_postach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sotrudnik]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sotrudnik](
	[id_sotrud] [int] NOT NULL,
	[Fname] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[Posada] [varchar](50) NULL,
	[Adress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Home_tel] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_sotrud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tovar]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tovar](
	[id_tovar] [int] IDENTITY(1,1) NOT NULL,
	[Nazva] [varchar](50) NULL,
	[Price] [decimal](6, 2) NULL,
	[NaSklade] [int] NULL,
	[id_postav] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tovar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zakaz]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zakaz](
	[id_zakaz] [int] IDENTITY(1,1) NOT NULL,
	[id_klient] [int] NOT NULL,
	[id_sotrud] [int] NOT NULL,
	[date_rozm] [datetime] NULL,
	[date_naznach]  AS (dateadd(day,(10),CONVERT([date],[date_rozm]))),
PRIMARY KEY CLUSTERED 
(
	[id_zakaz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zakaz_tovar]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zakaz_tovar](
	[id_zakaz] [int] NOT NULL,
	[id_tovar] [int] NOT NULL,
	[Kilkist] [int] NOT NULL,
	[Znigka] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_zakaz] ASC,
	[id_tovar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel]) VALUES (1, N'ПП Стоян С.В.', N'вул. Бердичівська 10', N'Житомир', N'0504345566')
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel]) VALUES (2, N'ТОВ "Арей"', N'вул. Київська 7', N'Житомир', N'0678889994')
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel]) VALUES (3, N'ПП Апин В.С.', N'вул. Короленка 9', N'Київ', N'0501112233')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (1, N'ПП Фриз Н.Н.', N'вул. Бердичівська 46', N'Житомир', N'0509998877', N'Фриз Н.Н.', N'')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (2, N'ТОВ "Арей"', N'вул. Київська 7', N'Житомир', N'0678889994', N'Петров С.К', N'менеджер')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (3, N'Краз Н.Н', N'вул. Вітрука 9', N'Київ', N'0974445544', N'Краз Н.Н.', N'')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (1, N'Крув', N'Наталія', N'Сергіївна', N'Продавець', N'вул. Бердичівська 67 кв.20', N'Житомир', N'0509998877')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (2, N'Петренко', N'Олексій', N'Геннадійович', N'Продавець', N'вул. Вітрука 20 кв.50', N'Житомир', N'0506667788')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (3, N'Хмельник', N'Олена', N'Петрівна', N'Продавець-консультант', N'вул. Київська 67 кв.20', N'Житомир', N'0509998877')
SET IDENTITY_INSERT [dbo].[tovar] ON 

INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (1, N'Молоко', CAST(18.00 AS Decimal(6, 2)), 50, 1)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (2, N'Молоко', CAST(16.00 AS Decimal(6, 2)), 50, 2)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (3, N'Кефир', CAST(21.00 AS Decimal(6, 2)), 25, 3)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (4, N'Сметана', CAST(10.00 AS Decimal(6, 2)), 30, 2)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (5, N'Творог', CAST(35.00 AS Decimal(6, 2)), 10, 1)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (6, N'Молоко', CAST(18.00 AS Decimal(6, 2)), 50, 1)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (7, N'Молоко', CAST(16.00 AS Decimal(6, 2)), 50, 2)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (8, N'Кефир', CAST(21.00 AS Decimal(6, 2)), 25, 3)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (9, N'Сметана', CAST(10.00 AS Decimal(6, 2)), 30, 2)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (10, N'Творог', CAST(35.00 AS Decimal(6, 2)), 10, 1)
SET IDENTITY_INSERT [dbo].[tovar] OFF
SET IDENTITY_INSERT [dbo].[zakaz] ON 

INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (1, 3, 2, CAST(N'2017-07-10T07:11:51.293' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (2, 2, 2, CAST(N'2017-07-07T07:11:51.293' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (3, 1, 3, CAST(N'2017-06-22T07:11:51.293' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (4, 3, 1, CAST(N'2017-07-06T07:11:51.293' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (5, 1, 3, CAST(N'2017-06-30T07:11:51.297' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (6, 2, 2, CAST(N'2017-06-21T07:11:51.297' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (7, 3, 1, CAST(N'2017-06-22T07:11:51.297' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (8, 2, 2, CAST(N'2017-07-11T07:11:51.297' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (9, 1, 1, CAST(N'2017-06-16T07:11:51.297' AS DateTime))
SET IDENTITY_INSERT [dbo].[zakaz] OFF
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (1, 1, 32, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (1, 4, 5, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (2, 1, 43, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (2, 2, 48, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (2, 3, 7, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (3, 1, 17, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (3, 2, 16, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (3, 3, 9, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (3, 4, 16, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (3, 5, 21, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (4, 1, 2, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (4, 4, 13, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (5, 1, 2, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (5, 2, 15, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (5, 5, 11, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (5, 6, 48, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (6, 3, 35, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (6, 4, 36, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (6, 6, 21, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (7, 2, 42, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (7, 4, 7, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (7, 5, 1, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (8, 2, 20, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (8, 3, 20, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (8, 4, 7, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (8, 6, 9, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (9, 2, 45, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (9, 4, 39, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (9, 5, 3, 0)
ALTER TABLE [dbo].[tovar]  WITH CHECK ADD FOREIGN KEY([id_postav])
REFERENCES [dbo].[postachalnik] ([id_postach])
GO
ALTER TABLE [dbo].[zakaz]  WITH CHECK ADD FOREIGN KEY([id_klient])
REFERENCES [dbo].[klient] ([id_klient])
GO
ALTER TABLE [dbo].[zakaz]  WITH CHECK ADD FOREIGN KEY([id_sotrud])
REFERENCES [dbo].[sotrudnik] ([id_sotrud])
GO
ALTER TABLE [dbo].[zakaz_tovar]  WITH CHECK ADD FOREIGN KEY([id_tovar])
REFERENCES [dbo].[tovar] ([id_tovar])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[zakaz_tovar]  WITH CHECK ADD FOREIGN KEY([id_zakaz])
REFERENCES [dbo].[zakaz] ([id_zakaz])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
