USE [master]
GO
/****** Object:  Database [PerfumeShopManagementSystem]    Script Date: 3/17/2025 3:59:48 PM ******/
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
/****** Object:  Table [dbo].[TblOrder]    Script Date: 3/17/2025 3:59:48 PM ******/
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
/****** Object:  Table [dbo].[TblOrderAddress]    Script Date: 3/17/2025 3:59:48 PM ******/
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
/****** Object:  Table [dbo].[TblOrderItem]    Script Date: 3/17/2025 3:59:48 PM ******/
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
/****** Object:  Table [dbo].[TblPaymentDetails]    Script Date: 3/17/2025 3:59:48 PM ******/
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
/****** Object:  Table [dbo].[TblPerfume]    Script Date: 3/17/2025 3:59:48 PM ******/
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
/****** Object:  Table [dbo].[TblRole]    Script Date: 3/17/2025 3:59:48 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUser]    Script Date: 3/17/2025 3:59:48 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_TblUser_UserId] UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
