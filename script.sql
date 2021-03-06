USE [master]
GO
/****** Object:  Database [МагазинЭлектроники]    Script Date: 03.04.2022 20:53:18 ******/
CREATE DATABASE [МагазинЭлектроники]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'МагазинЭлектроники', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\МагазинЭлектроники.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'МагазинЭлектроники_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\МагазинЭлектроники_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [МагазинЭлектроники] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [МагазинЭлектроники].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [МагазинЭлектроники] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET ARITHABORT OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [МагазинЭлектроники] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [МагазинЭлектроники] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [МагазинЭлектроники] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET  ENABLE_BROKER 
GO
ALTER DATABASE [МагазинЭлектроники] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [МагазинЭлектроники] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [МагазинЭлектроники] SET  MULTI_USER 
GO
ALTER DATABASE [МагазинЭлектроники] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [МагазинЭлектроники] SET DB_CHAINING OFF 
GO
ALTER DATABASE [МагазинЭлектроники] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [МагазинЭлектроники] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [МагазинЭлектроники] SET DELAYED_DURABILITY = DISABLED 
GO
USE [МагазинЭлектроники]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 03.04.2022 20:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[papaname] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставка]    Script Date: 03.04.2022 20:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставка](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTov] [int] NOT NULL,
	[date] [date] NULL,
	[status] [varchar](50) NOT NULL,
	[countTov] [int] NOT NULL,
 CONSTRAINT [PK_Поставка] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продажа]    Script Date: 03.04.2022 20:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продажа](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[idTovar] [int] NOT NULL,
	[date] [date] NOT NULL,
	[countProd] [int] NOT NULL,
 CONSTRAINT [PK_Продажа] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТипыТоваров]    Script Date: 03.04.2022 20:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТипыТоваров](
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ТипыТоваров] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товар]    Script Date: 03.04.2022 20:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товар](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manufacture] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[warrantyPeriod] [nvarchar](50) NOT NULL,
	[number] [int] NOT NULL,
 CONSTRAINT [PK_Товар] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Пользователь] ON 

INSERT [dbo].[Пользователь] ([id], [login], [password], [email], [role], [fullname], [name], [papaname], [phone]) VALUES (1, N'123', N'123', N'lox@mail.ru', N'Менеджер', N'Кравченко', N'Никита', N'Алексеевич', N'896559991841')
INSERT [dbo].[Пользователь] ([id], [login], [password], [email], [role], [fullname], [name], [papaname], [phone]) VALUES (2, N'12345', N'12345', N'emir@yandex.ru', N'Администратор', N'Еркашов', N'Алексей', N'Сергеевич', N'2303819')
INSERT [dbo].[Пользователь] ([id], [login], [password], [email], [role], [fullname], [name], [papaname], [phone]) VALUES (3, N'123456', N'123456', N'dirimonka@gmail.com', N'Пользователь', N'Сайфутдинова', N'Диляра', N'Искандеровна', N'89393027938')
INSERT [dbo].[Пользователь] ([id], [login], [password], [email], [role], [fullname], [name], [papaname], [phone]) VALUES (6, N'qcw', N'ecwq', N'ec', N'Пользователь', N'qwe', N'wqec', N'weqc', N'124')
SET IDENTITY_INSERT [dbo].[Пользователь] OFF
GO
SET IDENTITY_INSERT [dbo].[Поставка] ON 

INSERT [dbo].[Поставка] ([id], [idTov], [date], [status], [countTov]) VALUES (2, 3, CAST(N'2022-04-27' AS Date), N'В пути', 100)
INSERT [dbo].[Поставка] ([id], [idTov], [date], [status], [countTov]) VALUES (5, 6, CAST(N'2022-04-20' AS Date), N'В пути', 3)
INSERT [dbo].[Поставка] ([id], [idTov], [date], [status], [countTov]) VALUES (6, 4, CAST(N'2022-04-07' AS Date), N'Получена', 45)
INSERT [dbo].[Поставка] ([id], [idTov], [date], [status], [countTov]) VALUES (8, 7, CAST(N'2022-04-08' AS Date), N'В пути', 30)
SET IDENTITY_INSERT [dbo].[Поставка] OFF
GO
SET IDENTITY_INSERT [dbo].[Продажа] ON 

INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (3, 3, 3, CAST(N'2022-04-03' AS Date), 2)
INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (4, 3, 3, CAST(N'2022-04-03' AS Date), 1)
INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (11, 3, 4, CAST(N'2022-04-03' AS Date), 1)
INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (12, 3, 7, CAST(N'2022-04-03' AS Date), 2)
INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (13, 3, 8, CAST(N'2022-04-03' AS Date), 4)
INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (14, 3, 6, CAST(N'2022-04-03' AS Date), 1)
INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (15, 3, 6, CAST(N'2022-04-03' AS Date), 1)
INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (16, 3, 6, CAST(N'2022-04-03' AS Date), 1)
INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (17, 3, 7, CAST(N'2022-04-03' AS Date), 4)
INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (18, 3, 4, CAST(N'2022-04-03' AS Date), 5)
INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (19, 3, 4, CAST(N'2022-04-03' AS Date), 3)
INSERT [dbo].[Продажа] ([id], [idUser], [idTovar], [date], [countProd]) VALUES (20, 3, 4, CAST(N'2022-04-03' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Продажа] OFF
GO
INSERT [dbo].[ТипыТоваров] ([name]) VALUES (N'Аудиотехника')
INSERT [dbo].[ТипыТоваров] ([name]) VALUES (N'Бытовая техника')
INSERT [dbo].[ТипыТоваров] ([name]) VALUES (N'Комплектующие для пк')
INSERT [dbo].[ТипыТоваров] ([name]) VALUES (N'Компьютеры и ноутбуки')
INSERT [dbo].[ТипыТоваров] ([name]) VALUES (N'Консоли и видиоигры')
INSERT [dbo].[ТипыТоваров] ([name]) VALUES (N'Переферия и аксессуары')
INSERT [dbo].[ТипыТоваров] ([name]) VALUES (N'Планшеты')
INSERT [dbo].[ТипыТоваров] ([name]) VALUES (N'Смартфоны и гаджеты')
INSERT [dbo].[ТипыТоваров] ([name]) VALUES (N'Телевизоры и аксессуары')
INSERT [dbo].[ТипыТоваров] ([name]) VALUES (N'Фототехника')
GO
SET IDENTITY_INSERT [dbo].[Товар] ON 

INSERT [dbo].[Товар] ([id], [manufacture], [name], [type], [price], [warrantyPeriod], [number]) VALUES (3, N'ХайперИкесИкесИкес', N'Наушники амулет', N'Переферия и аксессуары', 1000, N'1 месяц', 11)
INSERT [dbo].[Товар] ([id], [manufacture], [name], [type], [price], [warrantyPeriod], [number]) VALUES (4, N'KFA 2', N'GTX 1660 SUPER', N'Комплектующие для пк', 50000, N'1 год', 49)
INSERT [dbo].[Товар] ([id], [manufacture], [name], [type], [price], [warrantyPeriod], [number]) VALUES (5, N'Palit', N'GTX 1660 SUPER', N'Комплектующие для пк', 47500, N'1 год', 1)
INSERT [dbo].[Товар] ([id], [manufacture], [name], [type], [price], [warrantyPeriod], [number]) VALUES (6, N'KFA 2', N'GTX 1050', N'Комплектующие для пк', 24700, N'1 год', 9)
INSERT [dbo].[Товар] ([id], [manufacture], [name], [type], [price], [warrantyPeriod], [number]) VALUES (7, N'guardian', N'Shiva Guard', N'Бытовая техника', 35000, N'2 года', 2)
INSERT [dbo].[Товар] ([id], [manufacture], [name], [type], [price], [warrantyPeriod], [number]) VALUES (8, N'Престижо', N'G720-U', N'Смартфоны и гаджеты', 2000, N'3 месяца', 200)
INSERT [dbo].[Товар] ([id], [manufacture], [name], [type], [price], [warrantyPeriod], [number]) VALUES (9, N'Престижо', N'Амлет', N'Комплектующие для пк', 2450, N'1 месяц', 10)
INSERT [dbo].[Товар] ([id], [manufacture], [name], [type], [price], [warrantyPeriod], [number]) VALUES (10, N'РАСИЯ', N'Говнодавы 2.0', N'Аудиотехника', 15582365, N'0', 1)
SET IDENTITY_INSERT [dbo].[Товар] OFF
GO
ALTER TABLE [dbo].[Поставка]  WITH CHECK ADD  CONSTRAINT [FK_Поставка_Товар] FOREIGN KEY([idTov])
REFERENCES [dbo].[Товар] ([id])
GO
ALTER TABLE [dbo].[Поставка] CHECK CONSTRAINT [FK_Поставка_Товар]
GO
ALTER TABLE [dbo].[Продажа]  WITH CHECK ADD  CONSTRAINT [FK_Продажа_Пользователь] FOREIGN KEY([idUser])
REFERENCES [dbo].[Пользователь] ([id])
GO
ALTER TABLE [dbo].[Продажа] CHECK CONSTRAINT [FK_Продажа_Пользователь]
GO
ALTER TABLE [dbo].[Продажа]  WITH CHECK ADD  CONSTRAINT [FK_Продажа_Товар1] FOREIGN KEY([idTovar])
REFERENCES [dbo].[Товар] ([id])
GO
ALTER TABLE [dbo].[Продажа] CHECK CONSTRAINT [FK_Продажа_Товар1]
GO
ALTER TABLE [dbo].[Товар]  WITH CHECK ADD  CONSTRAINT [FK_Товар_ТипыТоваров] FOREIGN KEY([type])
REFERENCES [dbo].[ТипыТоваров] ([name])
GO
ALTER TABLE [dbo].[Товар] CHECK CONSTRAINT [FK_Товар_ТипыТоваров]
GO
USE [master]
GO
ALTER DATABASE [МагазинЭлектроники] SET  READ_WRITE 
GO
