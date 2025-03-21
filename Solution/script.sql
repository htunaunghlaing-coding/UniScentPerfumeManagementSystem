USE [master]
GO
/****** Object:  Database [PerfumeShopManagementSystem]    Script Date: 3/17/2025 4:09:50 PM ******/
CREATE DATABASE [PerfumeShopManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PerfumeShopManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PerfumeShopManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PerfumeShopManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PerfumeShopManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PerfumeShopManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PerfumeShopManagementSystem]
GO
/****** Object:  Table [dbo].[TblOrder]    Script Date: 3/17/2025 4:09:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[PaymentMethod] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[UserId] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblOrderAddress]    Script Date: 3/17/2025 4:09:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOrderAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[AddressLine1] [nvarchar](255) NOT NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[City] [nvarchar](100) NOT NULL,
	[State] [nvarchar](100) NOT NULL,
	[PostalCode] [nvarchar](20) NOT NULL,
	[PhoneNo] [nvarchar](15) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblOrderItem]    Script Date: 3/17/2025 4:09:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PerfumeId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPaymentDetails]    Script Date: 3/17/2025 4:09:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPaymentDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[TipsPercentage] [decimal](5, 2) NULL,
	[TotalAmountWithTips] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPerfume]    Script Date: 3/17/2025 4:09:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPerfume](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CompanyName] [nvarchar](255) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Category] [nvarchar](100) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[SizeML] [int] NOT NULL,
	[PictureUrl] [nvarchar](max) NULL,
	[Longevity] [nvarchar](255) NULL,
	[KeyIngredients] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[Gender] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRole]    Script Date: 3/17/2025 4:09:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRole](
	[RoleId] [int] NOT NULL,
	[RoleCode] [nvarchar](50) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUser]    Script Date: 3/17/2025 4:09:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PhoneNo] [nvarchar](15) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[RoleCode] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblOrder] ON 

INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (7, CAST(N'2025-03-16T21:05:27.633' AS DateTime), CAST(165.00 AS Decimal(18, 2)), N'None', N'Pending', CAST(N'2025-03-16T21:05:27.653' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (8, CAST(N'2025-03-16T21:14:26.893' AS DateTime), CAST(154.00 AS Decimal(18, 2)), N'None', N'Pending', CAST(N'2025-03-16T21:14:26.893' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (9, CAST(N'2025-03-16T21:38:03.830' AS DateTime), CAST(462.00 AS Decimal(18, 2)), N'Mastercard', N'Pending', CAST(N'2025-03-16T21:38:03.830' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (10, CAST(N'2025-03-16T21:53:48.293' AS DateTime), CAST(539.00 AS Decimal(18, 2)), N'Mastercard', N'Pending', CAST(N'2025-03-16T21:53:48.293' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (11, CAST(N'2025-03-16T21:56:23.743' AS DateTime), CAST(715.00 AS Decimal(18, 2)), N'None', N'Pending', CAST(N'2025-03-16T21:56:23.757' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (12, CAST(N'2025-03-16T22:00:05.083' AS DateTime), CAST(1070.00 AS Decimal(18, 2)), N'None', N'Pending', CAST(N'2025-03-16T22:00:05.083' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (13, CAST(N'2025-03-16T22:07:38.717' AS DateTime), CAST(627.00 AS Decimal(18, 2)), N'None', N'Pending', CAST(N'2025-03-16T22:07:38.717' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (14, CAST(N'2025-03-16T22:21:51.343' AS DateTime), CAST(462.00 AS Decimal(18, 2)), N'None', N'Pending', CAST(N'2025-03-16T22:21:51.343' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (15, CAST(N'2025-03-16T23:56:25.113' AS DateTime), CAST(165.00 AS Decimal(18, 2)), N'None', N'Pending', CAST(N'2025-03-16T23:56:25.113' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (16, CAST(N'2025-03-16T23:58:10.537' AS DateTime), CAST(165.00 AS Decimal(18, 2)), N'None', N'Pending', CAST(N'2025-03-16T23:58:10.537' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (24, CAST(N'2025-03-17T02:32:42.727' AS DateTime), CAST(165.00 AS Decimal(18, 2)), N'None', N'Success', CAST(N'2025-03-17T02:32:42.743' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (25, CAST(N'2025-03-17T02:41:54.660' AS DateTime), CAST(715.00 AS Decimal(18, 2)), N'PayPal', N'Success', CAST(N'2025-03-17T02:41:54.660' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (26, CAST(N'2025-03-17T02:49:34.297' AS DateTime), CAST(330.00 AS Decimal(18, 2)), N'None', N'Success', CAST(N'2025-03-17T02:49:34.297' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (27, CAST(N'2025-03-17T02:51:14.693' AS DateTime), CAST(165.00 AS Decimal(18, 2)), N'None', N'Success', CAST(N'2025-03-17T02:51:14.713' AS DateTime), NULL, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (28, CAST(N'2025-03-17T08:03:05.680' AS DateTime), CAST(1386.00 AS Decimal(18, 2)), N'None', N'Success', CAST(N'2025-03-17T08:03:05.680' AS DateTime), NULL, N'c918ce3e-449f-40ff-8e38-c023e6fb26a7')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (29, CAST(N'2025-03-17T08:11:07.147' AS DateTime), CAST(352.00 AS Decimal(18, 2)), N'None', N'Success', CAST(N'2025-03-17T08:11:07.163' AS DateTime), NULL, N'c918ce3e-449f-40ff-8e38-c023e6fb26a7')
INSERT [dbo].[TblOrder] ([Id], [OrderDate], [TotalAmount], [PaymentMethod], [Status], [CreatedAt], [UpdatedAt], [UserId]) VALUES (30, CAST(N'2025-03-17T14:47:21.217' AS DateTime), CAST(165.00 AS Decimal(18, 2)), N'Mastercard', N'Success', CAST(N'2025-03-17T14:47:21.233' AS DateTime), NULL, N'c918ce3e-449f-40ff-8e38-c023e6fb26a7')
SET IDENTITY_INSERT [dbo].[TblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[TblOrderAddress] ON 

INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (1, 7, N'myanmar', N'Htun Aung Hlaing', N'Sanchaung', NULL, N'Yangon', N'Myanmar', N'1111', N'09763651040', CAST(N'2025-03-16T21:05:42.780' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (2, 8, N'Myanmar', N'Htun Aung Hlaing', N'Sanchaung', NULL, N'Yangon', N'Myanmar', N'1111', N'09763651040', CAST(N'2025-03-16T21:14:26.893' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (3, 9, N'Myanmar', N'Htun Aung Hlaing', N'Sanchaung', NULL, N'Yangon', N'Myanmar', N'1111', N'09763651040', CAST(N'2025-03-16T21:38:03.833' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (4, 10, N'Myanmar', N'Htun Aung Hlaing', N'Sanchaung', NULL, N'Yangon', N'Myanmar', N'1111', N'09763651040', CAST(N'2025-03-16T21:53:48.297' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (5, 11, N'myanmar', N'Htun', N'sanchaung', NULL, N'ygn', N'myanmar', N'1111', N'09763651040', CAST(N'2025-03-16T21:56:29.903' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (6, 12, N'm', N'htun', N's', NULL, N'yangon', N'm', N'1111', N'09888990', CAST(N'2025-03-16T22:00:05.083' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (7, 13, N'Myanmar', N'Htun Aung Hlaing', N'sanchaung', NULL, N'Yangon', N'Myanmar', N'1111', N'09763651040', CAST(N'2025-03-16T22:07:38.720' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (8, 14, N'Myanmar', N'Htun Aung Hlaing', N'Sanchaung', NULL, N'Yangon', N'Myanmar', N'1111', N'09763651040', CAST(N'2025-03-16T22:21:51.343' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (9, 15, N'Myanmar', N'Htun Aung Hlaing', N'Sanchaung', NULL, N'Yangon', N'Myanmar', N'1111', N'09449893775', CAST(N'2025-03-16T23:56:25.113' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (10, 16, N'Myanmar', N'zaw zaw', N'Sanchaung', NULL, N'Yangon', N'Myanmar', N'1111', N'09763651040', CAST(N'2025-03-16T23:58:10.537' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (15, 24, N'Myanmar', N'Htun Aung Hlaing', N'sanchaung', NULL, N'Yangon', N'myanmar', N'1111', N'0977889910', CAST(N'2025-03-17T02:32:48.807' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (16, 25, N'Myanmar', N'Htun Aung Hlaing', N'sanchaung', NULL, N'yangon', N'Myanmar', N'1111', N'09763651040', CAST(N'2025-03-17T02:41:54.660' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (17, 26, N'Myanmar', N'Htun Aung Hlaing', N'Sanchaung', NULL, N'Yangon', N'Myanmar', N'1111', N'09763651040', CAST(N'2025-03-17T02:49:34.297' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (18, 27, N'mm', N'hh', N's', NULL, N'y', N'm', N'1111', N'554444', CAST(N'2025-03-17T02:51:23.597' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (19, 28, N'Myanmar', N'Aung Aung', N'Sanchaung', NULL, N'Yangon', N'Yangon', N'1111', N'0977889910', CAST(N'2025-03-17T08:03:05.683' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (20, 29, N'Myanmar', N'Aung Aung', N'Sanchaung', NULL, N'Yangon', N'Yangon', N'1111', N'09887766991', CAST(N'2025-03-17T08:13:28.460' AS DateTime), NULL)
INSERT [dbo].[TblOrderAddress] ([Id], [OrderId], [Country], [FullName], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [PhoneNo], [CreatedAt], [UpdatedAt]) VALUES (21, 30, N'Myanmar', N'Aung Aung', N'Sanchaung', NULL, N'Yangon', N'Yangon', N'1111', N'09998877661', CAST(N'2025-03-17T14:47:30.553' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[TblOrderAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[TblOrderItem] ON 

INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (1, 7, 5, 1, CAST(150.00 AS Decimal(18, 2)), CAST(N'2025-03-17T03:35:46.487' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (2, 8, 7, 1, CAST(140.00 AS Decimal(18, 2)), CAST(N'2025-03-17T03:44:27.407' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (3, 9, 19, 1, CAST(420.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:08:04.710' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (4, 10, 7, 1, CAST(140.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:23:49.993' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (5, 10, 24, 1, CAST(350.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:23:49.993' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (6, 11, 7, 1, CAST(140.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:26:31.357' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (7, 11, 24, 1, CAST(350.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:26:31.357' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (8, 11, 6, 1, CAST(160.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:26:31.357' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (9, 12, 7, 1, CAST(140.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:30:05.193' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (10, 12, 24, 1, CAST(350.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:30:05.193' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (11, 12, 6, 1, CAST(160.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:30:05.193' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (12, 12, 19, 1, CAST(420.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:30:05.193' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (13, 13, 5, 1, CAST(150.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:37:39.553' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (14, 13, 19, 1, CAST(420.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:37:39.553' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (15, 14, 19, 1, CAST(420.00 AS Decimal(18, 2)), CAST(N'2025-03-17T04:51:51.843' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (16, 15, 5, 1, CAST(150.00 AS Decimal(18, 2)), CAST(N'2025-03-17T06:26:25.897' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (17, 16, 5, 1, CAST(150.00 AS Decimal(18, 2)), CAST(N'2025-03-17T06:28:10.690' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (25, 24, 5, 1, CAST(150.00 AS Decimal(18, 2)), CAST(N'2025-03-17T09:02:51.707' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (26, 25, 5, 2, CAST(150.00 AS Decimal(18, 2)), CAST(N'2025-03-17T09:11:55.407' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (27, 25, 20, 1, CAST(350.00 AS Decimal(18, 2)), CAST(N'2025-03-17T09:11:55.407' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (28, 26, 5, 2, CAST(150.00 AS Decimal(18, 2)), CAST(N'2025-03-17T09:19:35.083' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (29, 27, 5, 1, CAST(150.00 AS Decimal(18, 2)), CAST(N'2025-03-17T09:21:26.130' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (30, 28, 19, 3, CAST(420.00 AS Decimal(18, 2)), CAST(N'2025-03-17T14:33:06.003' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (31, 29, 23, 1, CAST(320.00 AS Decimal(18, 2)), CAST(N'2025-03-17T14:43:29.010' AS DateTime))
INSERT [dbo].[TblOrderItem] ([Id], [OrderId], [PerfumeId], [Quantity], [UnitPrice], [CreatedAt]) VALUES (32, 30, 5, 1, CAST(150.00 AS Decimal(18, 2)), CAST(N'2025-03-17T14:47:31.030' AS DateTime))
SET IDENTITY_INSERT [dbo].[TblOrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[TblPerfume] ON 

INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (5, N'Acqua Di Gio Parfum', N'Giorgio Armani', CAST(150.00 AS Decimal(18, 2)), N'Designer', 100, 100, N'/images/Designer/Male/AcquaDiGioParfum.jpg', N'12+ hours', N'Citrus, Woody, Amber', N'A sophisticated and timeless scent.', N'For elegant and refined men.', 1, CAST(N'2025-03-04T10:42:35.250' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (6, N'Acqua Di Gio Profondo', N'Giorgio Armani', CAST(160.00 AS Decimal(18, 2)), N'Designer', 100, 100, N'/images/Designer/Male/AcquaDiGioProfondo.jpg', N'12+ hours', N'Marine, Patchouli, Musk', N'A deep and mysterious aquatic scent.', N'For adventurous and bold men.', 1, CAST(N'2025-03-04T10:42:35.250' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (7, N'Azzaro The Most Wanted Parfum', N'Azzaro', CAST(140.00 AS Decimal(18, 2)), N'Designer', 100, 100, N'/images/Designer/Male/AzzaroTheMostWanted.jpg', N'10-12 hours', N'Vanilla, Tonka Bean, Lavender', N'A warm and seductive fragrance.', N'For charismatic and confident men.', 1, CAST(N'2025-03-04T10:42:35.250' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (8, N'Azzaro The Most Wanted Parfum Intense', N'Azzaro', CAST(170.00 AS Decimal(18, 2)), N'Designer', 100, 100, N'/images/Designer/Male/AzzaroTheMostWantedIntense.jpg', N'12+ hours', N'Vanilla, Cinnamon, Amber', N'An intense and captivating scent.', N'For bold and daring men.', 1, CAST(N'2025-03-04T10:42:35.250' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (9, N'Dior Sauvage Elixir', N'Dior', CAST(180.00 AS Decimal(18, 2)), N'Designer', 100, 100, N'/images/Designer/Male/DiorSauvageElixir.jpg', N'12+ hours', N'Cinnamon, Nutmeg, Cardamom, Grapefruit', N'A spicy and aromatic fragrance.', N'For confident and charismatic men.', 1, CAST(N'2025-03-04T10:42:35.250' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (10, N'JPG Le Beau EDP', N'Jean Paul Gaultier', CAST(130.00 AS Decimal(18, 2)), N'Designer', 100, 125, N'/images/Designer/Male/JPGLeBeauEDP.jpg', N'8-10 hours', N'Coconut, Vanilla, Tonka Bean', N'A tropical and sweet scent.', N'For playful and adventurous men.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (11, N'JPG Le Beau EDT', N'Jean Paul Gaultier', CAST(120.00 AS Decimal(18, 2)), N'Designer', 100, 125, N'/images/Designer/Male/JPGLeBeauEDT.jpg', N'6-8 hours', N'Coconut, Bergamot, Musk', N'A fresh and vibrant fragrance.', N'For casual and carefree men.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (12, N'JPG Le Beau Paradise Garden EDP', N'Jean Paul Gaultier', CAST(140.00 AS Decimal(18, 2)), N'Designer', 100, 125, N'/images/Designer/Male/JPGLeBeauParadiseGardenEDP.jpg', N'10-12 hours', N'Coconut, Pineapple, Vanilla', N'A fruity and exotic scent.', N'For dreamy and adventurous men.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (13, N'JPG Le Male Elixir', N'Jean Paul Gaultier', CAST(150.00 AS Decimal(18, 2)), N'Designer', 100, 125, N'/images/Designer/Male/JPGLemaleElixir.jpg', N'12+ hours', N'Lavender, Vanilla, Amber', N'A warm and spicy fragrance.', N'For confident and sensual men.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (14, N'JPG Le Male Le Parfum', N'Jean Paul Gaultier', CAST(160.00 AS Decimal(18, 2)), N'Designer', 100, 125, N'/images/Designer/Male/JPGLeMaleLeParfum.jpg', N'12+ hours', N'Lavender, Tonka Bean, Vanilla', N'A rich and creamy scent.', N'For bold and stylish men.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (15, N'JPG Ultramale', N'Jean Paul Gaultier', CAST(140.00 AS Decimal(18, 2)), N'Designer', 100, 125, N'/images/Designer/Male/JPGUtramale.jpg', N'10-12 hours', N'Vanilla, Cinnamon, Amber', N'A sweet and spicy fragrance.', N'For daring and confident men.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (16, N'Spice Bomb Extreme', N'Viktor & Rolf', CAST(130.00 AS Decimal(18, 2)), N'Designer', 100, 100, N'/images/Designer/Male/SpiceBombExtreme.jpg', N'12+ hours', N'Tobacco, Cinnamon, Vanilla', N'A warm and intense scent.', N'For bold and adventurous men.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (17, N'Stronger With You Intensely', N'Emporio Armani', CAST(140.00 AS Decimal(18, 2)), N'Designer', 100, 100, N'/images/Designer/Male/StrongerWithYouIntensely.jpg', N'10-12 hours', N'Vanilla, Lavender, Sage', N'A sweet and aromatic fragrance.', N'For romantic and confident men.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (18, N'Valentino Born In Roma Intense', N'Valentino', CAST(170.00 AS Decimal(18, 2)), N'Designer', 100, 100, N'/images/Designer/Male/ValentinoBornInRomaIntense.jpg', N'12+ hours', N'Vanilla, Iris, Patchouli', N'A luxurious and intense scent.', N'For sophisticated and bold men.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (19, N'Amouage Interlude Man', N'Amouage', CAST(420.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/AmouageInterludeMan.jpg', N'12+ hours', N'Oud, Frankincense, Bergamot', N'A smoky and woody fragrance.', N'For men who appreciate complexity.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (20, N'Baccarat Rouge-540', N'Maison Francis Kurkdjian', CAST(350.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/BaccaratRouge540.jpg', N'12+ hours', N'Jasmine, Saffron, Amberwood', N'A luxurious and radiant scent.', N'For those who love elegance.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (21, N'Creed Aventus', N'Creed', CAST(400.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/CreedAventus.jpg', N'12+ hours', N'Pineapple, Birch, Musk', N'A bold and sophisticated fragrance.', N'For confident and charismatic men.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (22, N'Initio Oud For Greatness', N'Initio Parfums Privés', CAST(300.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/InitioOudForGreatness.jpg', N'12+ hours', N'Oud, Agarwood, Musk', N'A powerful and captivating scent.', N'For those who love intense oud fragrances.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (23, N'Initio Side Effect', N'Initio Parfums Privés', CAST(320.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/InitioSideEffect.jpg', N'12+ hours', N'Vanilla, Cashmeran, Musk', N'A sensual and addictive fragrance.', N'For men who want to leave a lasting impression.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (24, N'LV Afternoon Swim', N'Louis Vuitton', CAST(350.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/LVAfternoonSwim.jpg', N'8-10 hours', N'Citrus, Ginger, Amber', N'A fresh and invigorating scent.', N'For men who love vibrant fragrances.', 1, CAST(N'2025-03-04T10:42:35.253' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (1005, N'Maison Crivelli Oud Maracujá', N'Maison Crivelli', CAST(280.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/MaisonCrivelliOudMaracuja.jpg', N'10-12 hours', N'Oud, Passionfruit, Patchouli', N'A tropical and exotic fragrance.', N'For those who love bold and unique scents.', 1, CAST(N'2025-03-06T10:00:00.000' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (1006, N'Maison Francis Kurkdjian Grand Soir', N'Maison Francis Kurkdjian', CAST(300.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/MaisonFrancisKurkdjianGrandSoir.jpg', N'12+ hours', N'Amber, Benzoin, Vanilla', N'A rich and warm fragrance.', N'For those who love luxurious amber scents.', 1, CAST(N'2025-03-06T10:00:00.000' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (1007, N'Maison Francis Kurkdjian Oud Satin Mood', N'Maison Francis Kurkdjian', CAST(380.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/MaisonFrancisKurkdjianOudSatinMood.jpg', N'12+ hours', N'Oud, Rose, Vanilla', N'A soft and elegant oud fragrance.', N'For those who love refined scents.', 1, CAST(N'2025-03-06T10:00:00.000' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (1008, N'Mancera Red Tobacco', N'Mancera', CAST(250.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/ManceraRedTobacco.jpg', N'12+ hours', N'Tobacco, Cinnamon, Amber', N'A warm and spicy fragrance.', N'For men who love bold and intense scents.', 1, CAST(N'2025-03-06T10:00:00.000' AS DateTime), CAST(N'2025-03-06T10:00:00.000' AS DateTime), N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (1009, N'Montale Arabians Tonka', N'Montale', CAST(220.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/MontaleArabiansTonka.jpg', N'12+ hours', N'Tonka Bean, Vanilla, Almond', N'A sweet and creamy fragrance.', N'For those who love gourmand scents.', 1, CAST(N'2025-03-06T10:00:00.000' AS DateTime), NULL, N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (1010, N'Parfums De Marly Althair', N'Parfums De Marly', CAST(320.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/ParfumsDeMarlyAlthair.jpg', N'12+ hours', N'Citrus, Lavender, Musk', N'A fresh and aromatic fragrance.', N'For men who love modern classics.', 1, CAST(N'2025-03-06T10:00:00.000' AS DateTime), NULL, N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (1011, N'Parfums De Marly Layton', N'Parfums De Marly', CAST(300.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/ParfumsDeMarlyLayton.jpg', N'12+ hours', N'Apple, Caramel, Vanilla', N'A sweet and fruity fragrance.', N'For those who love gourmand scents.', 1, CAST(N'2025-03-06T10:00:00.000' AS DateTime), NULL, N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (1012, N'Replica By The Fireplace', N'Maison Margiela', CAST(200.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/ReplicaByTheFireplace.jpg', N'8-10 hours', N'Cloves, Chestnut, Vanilla', N'A cozy and comforting fragrance.', N'For those who love winter-inspired scents.', 1, CAST(N'2025-03-06T10:00:00.000' AS DateTime), NULL, N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (1013, N'Replica Jazz Club', N'Maison Margiela', CAST(200.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/ReplicaJazzClub.jpg', N'8-10 hours', N'Rum, Tobacco, Vanilla', N'A warm and boozy fragrance.', N'For those who love vintage-inspired scents.', 1, CAST(N'2025-03-06T10:00:00.000' AS DateTime), NULL, N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (1014, N'Xerjoff Alexandria II', N'Xerjoff', CAST(500.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/XerjoffAlexandriaII.jpg', N'12+ hours', N'Cinnamon, Rose, Sandalwood', N'A luxurious and exotic fragrance.', N'For those who appreciate high-end scents.', 1, CAST(N'2025-03-06T10:00:00.000' AS DateTime), NULL, N'Male')
INSERT [dbo].[TblPerfume] ([Id], [Name], [CompanyName], [Price], [Category], [StockQuantity], [SizeML], [PictureUrl], [Longevity], [KeyIngredients], [Notes], [Description], [Status], [CreatedAt], [UpdatedAt], [Gender]) VALUES (1015, N'Xerjoff Erba Pura', N'Xerjoff', CAST(280.00 AS Decimal(18, 2)), N'Niche', 100, 100, N'/images/Niche/Male/XerjoffErbaPura.jpg', N'10-12 hours', N'Citrus, Amber, Musk', N'A fresh and vibrant fragrance.', N'For those who love citrusy scents with depth.', 1, CAST(N'2025-03-06T10:00:00.000' AS DateTime), NULL, N'Male')
SET IDENTITY_INSERT [dbo].[TblPerfume] OFF
GO
INSERT [dbo].[TblRole] ([RoleId], [RoleCode], [RoleName]) VALUES (1, N'C001', N'Customer')
INSERT [dbo].[TblRole] ([RoleId], [RoleCode], [RoleName]) VALUES (2, N'A001', N'Admin')
GO
SET IDENTITY_INSERT [dbo].[TblUser] ON 

INSERT [dbo].[TblUser] ([Id], [UserId], [UserName], [Email], [PhoneNo], [Password], [RoleCode], [CreatedDate], [UpdatedDate]) VALUES (1, N'40ae5004-04dc-462a-8fbf-8d80fc5ca866', N'Htun Aung Hlaing', N'htun@gmail.com', N'09763651040', N'545b4174c3406da1d4372584ae5f4893b4a0b1011c51fd35563e5292daf090fa', N'C001', CAST(N'2025-03-16T19:49:54.990' AS DateTime), NULL)
INSERT [dbo].[TblUser] ([Id], [UserId], [UserName], [Email], [PhoneNo], [Password], [RoleCode], [CreatedDate], [UpdatedDate]) VALUES (2, N'52f3f845-ddd2-44d9-856a-b4f9475385ba', N'Kyaw Kyaw', N'kyaw@gmail.com', N'0977889922', N'0fdc76e847765b798df9a305f0f7d6bd2569c33f19b1f83c143c686c1a5b2f82', N'C001', CAST(N'2025-03-17T10:30:03.947' AS DateTime), NULL)
INSERT [dbo].[TblUser] ([Id], [UserId], [UserName], [Email], [PhoneNo], [Password], [RoleCode], [CreatedDate], [UpdatedDate]) VALUES (3, N'c918ce3e-449f-40ff-8e38-c023e6fb26a7', N'Aung Aung ', N'aung@gmail.com', N'09778899100', N'53d62de3d8c21baca8ddeafb888753f94f199242ac202391db5967de33107f0f', N'C001', CAST(N'2025-03-17T14:30:23.730' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[TblUser] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TblRole__D62CB59C2173A7B7]    Script Date: 3/17/2025 4:09:51 PM ******/
ALTER TABLE [dbo].[TblRole] ADD UNIQUE NONCLUSTERED 
(
	[RoleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_TblUser_UserId]    Script Date: 3/17/2025 4:09:51 PM ******/
ALTER TABLE [dbo].[TblUser] ADD  CONSTRAINT [UQ_TblUser_UserId] UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblOrder] ADD  CONSTRAINT [DF_TblOrder_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[TblOrder] ADD  CONSTRAINT [DF_TblOrder_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TblOrderAddress] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TblOrderItem] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TblPaymentDetails] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TblPerfume] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[TblPerfume] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TblUser] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TblOrder]  WITH CHECK ADD  CONSTRAINT [FK_TblOrder_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[TblUser] ([UserId])
GO
ALTER TABLE [dbo].[TblOrder] CHECK CONSTRAINT [FK_TblOrder_UserId]
GO
ALTER TABLE [dbo].[TblOrderAddress]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[TblOrder] ([Id])
GO
ALTER TABLE [dbo].[TblOrderItem]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[TblOrder] ([Id])
GO
ALTER TABLE [dbo].[TblOrderItem]  WITH CHECK ADD FOREIGN KEY([PerfumeId])
REFERENCES [dbo].[TblPerfume] ([Id])
GO
ALTER TABLE [dbo].[TblPaymentDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[TblOrder] ([Id])
GO
USE [master]
GO
ALTER DATABASE [PerfumeShopManagementSystem] SET  READ_WRITE 
GO
