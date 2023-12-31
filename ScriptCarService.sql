USE [master]
GO
/****** Object:  Database [CarService_KozlovS_ISP2120]    Script Date: 29.06.2022 15:55:57 ******/
CREATE DATABASE [CarService_KozlovS_ISP2120]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarService_KozlovS_ISP2120', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CarService_KozlovS_ISP2120.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarService_KozlovS_ISP2120_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CarService_KozlovS_ISP2120_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarService_KozlovS_ISP2120].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET  MULTI_USER 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET QUERY_STORE = OFF
GO
USE [CarService_KozlovS_ISP2120]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[VIN] [varchar](20) NOT NULL,
	[ID_Owner] [int] NOT NULL,
	[Brand] [varchar](50) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Year] [int] NOT NULL,
	[CarNumbers] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicesForOrder]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicesForOrder](
	[ID_Order] [int] NOT NULL,
	[ID_Service] [int] NOT NULL,
	[Price] [decimal](9, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Order] ASC,
	[ID_Service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VIN_Car] [varchar](20) NOT NULL,
	[Date] [date] NULL,
	[Priority] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PriceOfOrders]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PriceOfOrders]
AS
SELECT Orders.ID, Orders.VIN_Car, Cars.Brand, Cars.Model, Orders.Priority, SUM(CASE Orders.Priority
															WHEN 'Высокий' THEN ServicesForOrder.Price*1.5
															WHEN 'Средний' THEN ServicesForOrder.Price*1.25
															WHEN 'Низкий' THEN ServicesForOrder.Price
														END) AS Price,
														Orders.Date
FROM Orders, ServicesForOrder, Cars
WHERE ServicesForOrder.ID_Order = Orders.ID AND Cars.VIN = Orders.VIN_Car
GROUP BY Orders.ID, Orders.VIN_Car, Orders.Priority, Cars.Brand, Cars.Model, Orders.Date;
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Patronymic] [varchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Unit] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailsForService]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailsForService](
	[ID_Service] [int] NOT NULL,
	[ID_Detail] [int] NOT NULL,
 CONSTRAINT [PK_DetailsForService] PRIMARY KEY CLUSTERED 
(
	[ID_Service] ASC,
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailsInWarehouses]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailsInWarehouses](
	[ID_Warehouse] [int] NOT NULL,
	[ID_Detail] [int] NOT NULL,
	[Amount] [decimal](9, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Warehouse] ASC,
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Patronymic] [varchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Position] [varchar](50) NOT NULL,
	[StartDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesForOrder]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesForOrder](
	[ID_Order] [int] NOT NULL,
	[ID_Employee] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Order] ASC,
	[ID_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouses]    Script Date: 29.06.2022 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'1C4RJEAG2FC735440', 6, N'JEEP', N'GRAND CHEROKEE', 2015, N'А162ХА')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'1D7HL48N54S509115', 4, N'DODGE', N'DAKOTA', 2004, N'С441УА')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'2B3HD46R13H524537', 5, N'DODGE', N'INTREPID', 2003, N'Т284АС')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'2G1FB1E30D9198936', 7, N'CHEVROLET', N'CAMARO', 2013, N'Н058НН')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'4S4BRDKC2C2204347', 3, N'SUBARU', N'OUTBACK', 2012, N'В946СТ')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'4T1BF1FK4EU407031', 1, N'TOYOTA', N'CAMRY', 2014, N'Х762ЕА')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'5NPET46C17H196324', 2, N'HYUNDAI', N'SONATA', 2007, N'А361ЕУ')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'5UXFA13524LU34511', 2, N'BMW', N'X5', 2004, N'Е664КМ')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'JHMGE88499S015456', 9, N'HONDA', N'FIT', 2009, N'Н883ВХ')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'KMHDU46D98U431251', 8, N'HYUNDAI', N'ELANTRA', 2008, N'В492УО')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'KMHHU6KJ1DU101445', 2, N'HYUNDAI', N'GENESIS COUPE', 2013, N'Е072ТМ')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'WBABW33474PL28176', 10, N'BMW', N'325CI', 2004, N'Н757РН')
INSERT [dbo].[Cars] ([VIN], [ID_Owner], [Brand], [Model], [Year], [CarNumbers]) VALUES (N'WBAFB3349YLH02350', 4, N'BMW', N'X5', 2000, N'О488ТС')
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber]) VALUES (1, N'Мельников', N'Георгий ', N'Никитич', CAST(N'1966-12-10' AS Date), N'+7(900)231-69-71')
INSERT [dbo].[Clients] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber]) VALUES (2, N'Пахомова ', N'Диана ', N'Дмитриевна', CAST(N'1960-02-14' AS Date), N'+7(900)694-82-93')
INSERT [dbo].[Clients] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber]) VALUES (3, N'Майорова ', N'Ксения ', N'Никитична', CAST(N'1982-05-05' AS Date), N'+7(900)799-54-77')
INSERT [dbo].[Clients] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber]) VALUES (4, N'Морозова ', N'Злата ', N'Степановна', CAST(N'1992-10-02' AS Date), N'+7(900)911-65-85')
INSERT [dbo].[Clients] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber]) VALUES (5, N'Морозов ', N'Вячеслав ', N'Маркович', CAST(N'1974-11-26' AS Date), N'+7(900)274-14-53')
INSERT [dbo].[Clients] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber]) VALUES (6, N'Белова ', N'Екатерина ', N'Александровна', CAST(N'1998-02-18' AS Date), N'+7(900)589-88-34')
INSERT [dbo].[Clients] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber]) VALUES (7, N'Суворов ', N'Кирилл ', N'Глебович', CAST(N'1961-02-20' AS Date), N'+7(900)230-71-81')
INSERT [dbo].[Clients] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber]) VALUES (8, N'Ковалев ', N'Богдан ', N'Лукич ', CAST(N'1966-01-20' AS Date), N'+7(900)027-61-24')
INSERT [dbo].[Clients] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber]) VALUES (9, N'Александров ', N'Артём ', N'Алексеевич', CAST(N'1979-01-23' AS Date), N'+7(900)985-44-85')
INSERT [dbo].[Clients] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber]) VALUES (10, N'Дмитриева ', N'Ника', N'Ильинична', CAST(N'1970-07-01' AS Date), N'+7(900)757-59-10')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Details] ON 

INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (1, N'Амортизатор', N'шт')
INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (2, N'Антифриз', N'л')
INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (3, N'Бензин', N'л')
INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (4, N'Втулка', N'шт')
INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (5, N'Глушитель', N'шт')
INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (6, N'Дверь', N'шт')
INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (7, N'Диск тормозной', N'шт')
INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (8, N'Колодки', N'шт')
INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (9, N'Коробка передач', N'шт')
INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (10, N'Масло Лукойл', N'л')
INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (11, N'Фонарь', N'шт')
INSERT [dbo].[Details] ([ID], [Name], [Unit]) VALUES (12, N'Ремень', N'шт')
SET IDENTITY_INSERT [dbo].[Details] OFF
GO
INSERT [dbo].[DetailsForService] ([ID_Service], [ID_Detail]) VALUES (1, 11)
INSERT [dbo].[DetailsForService] ([ID_Service], [ID_Detail]) VALUES (4, 12)
INSERT [dbo].[DetailsForService] ([ID_Service], [ID_Detail]) VALUES (7, 3)
INSERT [dbo].[DetailsForService] ([ID_Service], [ID_Detail]) VALUES (9, 6)
INSERT [dbo].[DetailsForService] ([ID_Service], [ID_Detail]) VALUES (10, 10)
INSERT [dbo].[DetailsForService] ([ID_Service], [ID_Detail]) VALUES (11, 9)
INSERT [dbo].[DetailsForService] ([ID_Service], [ID_Detail]) VALUES (12, 8)
INSERT [dbo].[DetailsForService] ([ID_Service], [ID_Detail]) VALUES (13, 2)
GO
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 1, CAST(10.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 2, CAST(100.45 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 3, CAST(1000.99 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 4, CAST(20.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 5, CAST(10.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 6, CAST(15.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 7, CAST(5.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 8, CAST(5.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 9, CAST(7.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 10, CAST(11.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 11, CAST(10.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (1, 12, CAST(20.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (3, 1, CAST(20.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (3, 2, CAST(467.43 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (3, 5, CAST(64.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (3, 6, CAST(43.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (3, 7, CAST(17.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (3, 8, CAST(74.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (3, 9, CAST(24.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (3, 10, CAST(548.67 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (3, 11, CAST(30.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (3, 12, CAST(54.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 1, CAST(4.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 2, CAST(56.46 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 3, CAST(87.41 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 4, CAST(6.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 5, CAST(4.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 6, CAST(9.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 7, CAST(14.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 8, CAST(8.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 9, CAST(11.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 10, CAST(34.30 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 11, CAST(16.00 AS Decimal(9, 2)))
INSERT [dbo].[DetailsInWarehouses] ([ID_Warehouse], [ID_Detail], [Amount]) VALUES (4, 12, CAST(17.00 AS Decimal(9, 2)))
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber], [Position], [StartDate]) VALUES (1, N'Макарова', N'Ева', N'Максимовна', CAST(N'1975-04-13' AS Date), N'+7(900)290-59-48', N'ИП', CAST(N'2013-07-25' AS Date))
INSERT [dbo].[Employees] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber], [Position], [StartDate]) VALUES (2, N'Кузнецова', N'Виктория', N'Григорьевна', CAST(N'1965-01-05' AS Date), N'+7(900)640-12-41', N'Тех. директор', CAST(N'2013-07-25' AS Date))
INSERT [dbo].[Employees] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber], [Position], [StartDate]) VALUES (3, N'Кузнецова', N'Софья', N'Анатольевна', CAST(N'1998-09-05' AS Date), N'+7(900)652-69-14', N'Бухгалтер', CAST(N'2013-07-25' AS Date))
INSERT [dbo].[Employees] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber], [Position], [StartDate]) VALUES (4, N'Румянцев', N'Андрей', N'Максимович', CAST(N'1997-02-22' AS Date), N'+7(900)682-38-48', N'Автослесарь', CAST(N'2013-07-25' AS Date))
INSERT [dbo].[Employees] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber], [Position], [StartDate]) VALUES (5, N'Агафонов', N'Иван', N'Львович', CAST(N'1973-07-13' AS Date), N'+7(900)996-44-75', N'Электрик', CAST(N'2013-07-25' AS Date))
INSERT [dbo].[Employees] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber], [Position], [StartDate]) VALUES (6, N'Васильев', N'Макар', N'Артёмович', CAST(N'1959-03-04' AS Date), N'+7(900)648-98-90', N'Маляр', CAST(N'2015-09-06' AS Date))
INSERT [dbo].[Employees] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber], [Position], [StartDate]) VALUES (7, N'Ковалева', N'Екатерина', N'Кирилловна', CAST(N'1963-06-07' AS Date), N'+7(900)728-66-70', N'Автослесарь', CAST(N'2017-01-04' AS Date))
INSERT [dbo].[Employees] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber], [Position], [StartDate]) VALUES (8, N'Васильев', N'Георгий', N'Дмитриевич', CAST(N'1986-07-10' AS Date), N'+7(900)660-13-58', N'Автослесарь', CAST(N'2017-06-13' AS Date))
INSERT [dbo].[Employees] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber], [Position], [StartDate]) VALUES (9, N'Герасимова', N'Анна', N'Артёмовна', CAST(N'1997-08-12' AS Date), N'+7(900)116-03-17', N'Автослесарь', CAST(N'2019-03-23' AS Date))
INSERT [dbo].[Employees] ([ID], [Surname], [Name], [Patronymic], [Birthday], [PhoneNumber], [Position], [StartDate]) VALUES (10, N'Иванов', N'Дмитрий', N'Михайлович', CAST(N'1979-10-15' AS Date), N'+7(900)559-34-98', N'Автослесарь', CAST(N'2021-06-08' AS Date))
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (1, 4)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (1, 5)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (2, 4)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (2, 5)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (3, 6)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (3, 7)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (4, 5)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (5, 8)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (5, 9)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (6, 7)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (7, 6)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (8, 5)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (8, 7)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (8, 10)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (9, 7)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (9, 9)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (9, 10)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (10, 5)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (10, 6)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (11, 7)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (12, 5)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (12, 7)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (13, 7)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (13, 8)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (14, 6)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (14, 7)
INSERT [dbo].[EmployeesForOrder] ([ID_Order], [ID_Employee]) VALUES (14, 10)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (1, N'1C4RJEAG2FC735440', CAST(N'2021-08-31' AS Date), N'Средний')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (2, N'1D7HL48N54S509115', CAST(N'2021-09-12' AS Date), N'Низкий')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (3, N'1D7HL48N54S509115', CAST(N'2021-09-18' AS Date), N'Высокий')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (4, N'2G1FB1E30D9198936', CAST(N'2021-10-25' AS Date), N'Низкий')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (5, N'4S4BRDKC2C2204347', CAST(N'2021-11-04' AS Date), N'Низкий')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (6, N'4T1BF1FK4EU407031', CAST(N'2021-11-09' AS Date), N'Низкий')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (7, N'5NPET46C17H196324', CAST(N'2021-12-31' AS Date), N'Низкий')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (8, N'5UXFA13524LU34511', CAST(N'2022-01-23' AS Date), N'Средний')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (9, N'JHMGE88499S015456', CAST(N'2022-02-11' AS Date), N'Средний')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (10, N'KMHDU46D98U431251', CAST(N'2022-03-06' AS Date), N'Низкий')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (11, N'KMHHU6KJ1DU101445', CAST(N'2022-04-24' AS Date), N'Высокий')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (12, N'WBABW33474PL28176', CAST(N'2022-05-05' AS Date), N'Низкий')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (13, N'WBAFB3349YLH02350', CAST(N'2022-05-14' AS Date), N'Низкий')
INSERT [dbo].[Orders] ([ID], [VIN_Car], [Date], [Priority]) VALUES (14, N'5NPET46C17H196324', CAST(N'2022-05-29' AS Date), N'Высокий')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ID], [Name], [Type]) VALUES (1, N'Ремонт фар и задних фонарей', 7)
INSERT [dbo].[Services] ([ID], [Name], [Type]) VALUES (4, N'Замена ремня ГРМ', 2)
INSERT [dbo].[Services] ([ID], [Name], [Type]) VALUES (5, N'Диагностика автомобиля', 2)
INSERT [dbo].[Services] ([ID], [Name], [Type]) VALUES (7, N'Заправка автомобиля', 5)
INSERT [dbo].[Services] ([ID], [Name], [Type]) VALUES (9, N'Замена дверей', 3)
INSERT [dbo].[Services] ([ID], [Name], [Type]) VALUES (10, N'Замена масла', 4)
INSERT [dbo].[Services] ([ID], [Name], [Type]) VALUES (11, N'Замена КПП', 8)
INSERT [dbo].[Services] ([ID], [Name], [Type]) VALUES (12, N'Замена тормозных колодок', 2)
INSERT [dbo].[Services] ([ID], [Name], [Type]) VALUES (13, N'Доливка антифриза', 2)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (1, 5, CAST(5000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (1, 7, CAST(1000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (2, 4, CAST(4000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (3, 11, CAST(5000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (4, 12, CAST(2000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (5, 13, CAST(500.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (6, 5, CAST(5000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (7, 5, CAST(5000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (8, 1, CAST(4000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (8, 12, CAST(5000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (9, 10, CAST(1000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (9, 12, CAST(2000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (9, 13, CAST(500.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (10, 1, CAST(4500.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (11, 9, CAST(10000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (11, 11, CAST(5000.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (12, 5, CAST(4500.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (13, 5, CAST(5500.00 AS Decimal(9, 2)))
INSERT [dbo].[ServicesForOrder] ([ID_Order], [ID_Service], [Price]) VALUES (14, 4, CAST(4000.00 AS Decimal(9, 2)))
GO
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([ID], [Name]) VALUES (1, N'Уборочно-моечные')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (2, N'Контрольно-диагностические')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (3, N'Крепежные')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (4, N'Смазочные')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (5, N'Заправочные')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (6, N'Регулировочные')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (7, N'Электротехнические')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (8, N'Другие')
SET IDENTITY_INSERT [dbo].[Types] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouses] ON 

INSERT [dbo].[Warehouses] ([ID], [Name], [Address]) VALUES (1, N'Склад №1', N'г. Вологда, ул. Ленинградская, 136 ')
INSERT [dbo].[Warehouses] ([ID], [Name], [Address]) VALUES (3, N'Склад №2', N'г. Вологда, ул. Окружное, 30 ')
INSERT [dbo].[Warehouses] ([ID], [Name], [Address]) VALUES (4, N'Склад №3', N'г. Вологда, ул. Горького, 119')
SET IDENTITY_INSERT [dbo].[Warehouses] OFF
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Clients] FOREIGN KEY([ID_Owner])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Clients]
GO
ALTER TABLE [dbo].[DetailsForService]  WITH CHECK ADD  CONSTRAINT [FK_DetailsForService_Details] FOREIGN KEY([ID_Detail])
REFERENCES [dbo].[Details] ([ID])
GO
ALTER TABLE [dbo].[DetailsForService] CHECK CONSTRAINT [FK_DetailsForService_Details]
GO
ALTER TABLE [dbo].[DetailsForService]  WITH CHECK ADD  CONSTRAINT [FK_DetailsForService_Services] FOREIGN KEY([ID_Service])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[DetailsForService] CHECK CONSTRAINT [FK_DetailsForService_Services]
GO
ALTER TABLE [dbo].[DetailsInWarehouses]  WITH CHECK ADD  CONSTRAINT [FK_DetailsInWarehouses_Details] FOREIGN KEY([ID_Detail])
REFERENCES [dbo].[Details] ([ID])
GO
ALTER TABLE [dbo].[DetailsInWarehouses] CHECK CONSTRAINT [FK_DetailsInWarehouses_Details]
GO
ALTER TABLE [dbo].[DetailsInWarehouses]  WITH CHECK ADD  CONSTRAINT [FK_DetailsInWarehouses_Warehouses] FOREIGN KEY([ID_Warehouse])
REFERENCES [dbo].[Warehouses] ([ID])
GO
ALTER TABLE [dbo].[DetailsInWarehouses] CHECK CONSTRAINT [FK_DetailsInWarehouses_Warehouses]
GO
ALTER TABLE [dbo].[EmployeesForOrder]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesForOrder_Employees] FOREIGN KEY([ID_Employee])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[EmployeesForOrder] CHECK CONSTRAINT [FK_EmployeesForOrder_Employees]
GO
ALTER TABLE [dbo].[EmployeesForOrder]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesForOrder_Orders] FOREIGN KEY([ID_Order])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[EmployeesForOrder] CHECK CONSTRAINT [FK_EmployeesForOrder_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Cars] FOREIGN KEY([VIN_Car])
REFERENCES [dbo].[Cars] ([VIN])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Cars]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Types] FOREIGN KEY([Type])
REFERENCES [dbo].[Types] ([ID])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Types]
GO
ALTER TABLE [dbo].[ServicesForOrder]  WITH CHECK ADD  CONSTRAINT [FK_ServicesForOrder_Orders] FOREIGN KEY([ID_Order])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[ServicesForOrder] CHECK CONSTRAINT [FK_ServicesForOrder_Orders]
GO
ALTER TABLE [dbo].[ServicesForOrder]  WITH CHECK ADD  CONSTRAINT [FK_ServicesForOrder_Services] FOREIGN KEY([ID_Service])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[ServicesForOrder] CHECK CONSTRAINT [FK_ServicesForOrder_Services]
GO
USE [master]
GO
ALTER DATABASE [CarService_KozlovS_ISP2120] SET  READ_WRITE 
GO
