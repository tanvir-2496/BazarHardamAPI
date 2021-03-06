USE [master]
GO
/****** Object:  Database [SSL_Ecommerce]    Script Date: 5/3/2021 10:11:05 AM ******/
CREATE DATABASE [SSL_Ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SSL_Ecommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SSL_Ecommerce.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SSL_Ecommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SSL_Ecommerce_log.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SSL_Ecommerce] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SSL_Ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SSL_Ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SSL_Ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SSL_Ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SSL_Ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SSL_Ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [SSL_Ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [SSL_Ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SSL_Ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SSL_Ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SSL_Ecommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SSL_Ecommerce] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SSL_Ecommerce', N'ON'
GO
USE [SSL_Ecommerce]
GO
/****** Object:  Table [dbo].[SSL_Address]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Address](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CareOf] [nvarchar](250) NULL,
	[Phone] [nvarchar](25) NULL,
	[Division] [nvarchar](25) NOT NULL,
	[District] [nvarchar](25) NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_Authenticate]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Authenticate](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](25) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_Brand]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Brand](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImagePath] [nvarchar](250) NOT NULL,
	[Status] [nvarchar](25) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_BrandCategory]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_BrandCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_BrandCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_CampaignBrand]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_CampaignBrand](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BrandId] [bigint] NOT NULL,
	[CampBrandCategoryId] [bigint] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_CampaignBrand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_CampaignBrandCategory]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_CampaignBrandCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_CampaignBrandCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_CampaignProduct]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_CampaignProduct](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[CampProductCategoryId] [bigint] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_CampaignProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_CampaignProductCategory]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_CampaignProductCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_CampaignProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_CampaignSlider]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_CampaignSlider](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImagePath] [nvarchar](250) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_CampaignSlider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_Comment]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Comment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Comments] [nvarchar](500) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_Coupon]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Coupon](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Discount] [numeric](18, 2) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_Coupon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_DeliveryHistory]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_DeliveryHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[DeliveryCharge] [numeric](18, 2) NOT NULL,
	[Vat] [numeric](18, 2) NOT NULL,
	[TotalAmount] [numeric](18, 2) NOT NULL,
	[VendorId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[OrderNo] [nvarchar](25) NOT NULL,
	[Status] [nvarchar](25) NOT NULL,
	[StartLocation] [nvarchar](25) NOT NULL,
	[StartAddress] [nvarchar](250) NOT NULL,
	[EndLocation] [nvarchar](25) NOT NULL,
	[EndAddress] [nvarchar](250) NOT NULL,
	[DeliveryManId] [uniqueidentifier] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_DeliveryHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_DeliveryMan]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_DeliveryMan](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[PhoneNumber] [nvarchar](25) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImagePath] [nvarchar](250) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_DeliveryMan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_DeliveryType]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_DeliveryType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Cost] [numeric](18, 2) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_DeliveryType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_Description]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Description](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LabelName] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[ProductId] [bigint] NOT NULL,
 CONSTRAINT [PK_SSL_Description] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_Like]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Like](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_Like] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_OnlineBanking]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_OnlineBanking](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IsMobile] [bit] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[AccountNumber] [nvarchar](250) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_OnlineBanking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_Order]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Order](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [nvarchar](25) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[PaymentTypeId] [bigint] NOT NULL,
	[CouponId] [bigint] NULL,
	[RefId] [nvarchar](25) NULL,
	[Status] [nvarchar](25) NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[TotalAmount] [numeric](18, 2) NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_OrderDetail]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_OrderDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Qty] [int] NOT NULL,
	[UnitPrice] [numeric](18, 2) NOT NULL,
	[TotalAmount] [numeric](18, 2) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SSL_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_PaymentHistory]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_PaymentHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[InvoiceNo] [nvarchar](25) NOT NULL,
	[PaymentTypeId] [bigint] NOT NULL,
	[CouponId] [bigint] NULL,
	[RefId] [nvarchar](25) NULL,
	[TotalAmount] [numeric](18, 2) NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_PaymentHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_PaymentType]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_PaymentType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[ImageName] [nvarchar](50) NULL,
	[ImagePath] [nvarchar](250) NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_Product]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[BrandId] [bigint] NOT NULL,
	[UnitPrice] [numeric](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [numeric](18, 2) NOT NULL,
	[TotalAmount] [numeric](18, 2) NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImagePath] [nvarchar](250) NOT NULL,
	[VendorId] [bigint] NOT NULL,
	[Status] [nvarchar](25) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_ProductCategory]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_ProductCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_Reference]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Reference](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RefId] [nvarchar](25) NOT NULL,
	[Discount] [numeric](18, 2) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_Reference] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_ShoppingCart]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_ShoppingCart](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Qty] [int] NOT NULL,
	[UnitPrice] [numeric](18, 2) NOT NULL,
	[TotalAmount] [numeric](18, 2) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_Specification]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Specification](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LabelName] [nvarchar](250) NOT NULL,
	[Specification] [nvarchar](1000) NOT NULL,
	[ProductId] [bigint] NOT NULL,
 CONSTRAINT [PK_SSL_Specification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_User]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_User](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[PhoneNumber] [nvarchar](25) NOT NULL,
	[Gender] [nvarchar](25) NULL,
	[BirthDate] [nvarchar](25) NULL,
	[Email] [nvarchar](250) NULL,
	[Division] [nvarchar](50) NULL,
	[District] [nvarchar](50) NULL,
	[PoliceStation] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Location] [nvarchar](50) NULL,
	[ImageName] [nvarchar](50) NULL,
	[ImagePath] [nvarchar](250) NULL,
	[Token] [nvarchar](500) NULL,
	[RefId] [nvarchar](25) NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK__SSL_User__3214EC0711738F1A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_UserBalance]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_UserBalance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Balance] [numeric](18, 2) NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_User_Balance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSL_Vendor]    Script Date: 5/3/2021 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSL_Vendor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[ContactPerson] [nvarchar](250) NOT NULL,
	[PhoneNumber] [nvarchar](25) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[Division] [nvarchar](50) NULL,
	[District] [nvarchar](50) NULL,
	[PoliceStation] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImagePath] [nvarchar](250) NOT NULL,
	[PersonImageName] [nvarchar](50) NULL,
	[PersonImagePath] [nvarchar](250) NULL,
	[Status] [nvarchar](25) NULL,
	[Token] [nvarchar](500) NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUser] [uniqueidentifier] NULL,
	[EditDate] [datetime] NULL,
	[OCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_SSL_Vendor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SSL_Address] ON 

INSERT [dbo].[SSL_Address] ([Id], [CareOf], [Phone], [Division], [District], [Area], [Location], [Address], [UserId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, N'Subra Systems', N'01914141707', N'Dhaka', N'Dhaka', N'Shahbag', N'23.793956974588635,90.38943596184254', N'লালাসরাই স্কুলের পেছনের রাস্তা, Dhaka, Bangladesh', N'37481fbc-2395-4a88-abca-75858b4ad63e', N'37481fbc-2395-4a88-abca-75858b4ad63e', CAST(N'2021-04-28T21:42:48.623' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Address] ([Id], [CareOf], [Phone], [Division], [District], [Area], [Location], [Address], [UserId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, N'MASUM RANA', N'+8801613377238', N'Dhaka', N'Dhaka', N'Mohammadpur', N'23.785312285271704,90.37056125700475', N'Mita Kunjo (147/6 South Pirerbag. Mirpur. Dhaka. 1216), আমতলা মসজিদ রোড, Dhaka, Bangladesh', N'83089b52-6054-4267-b799-42d71717c52b', N'83089b52-6054-4267-b799-42d71717c52b', CAST(N'2021-04-28T21:59:50.707' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Address] ([Id], [CareOf], [Phone], [Division], [District], [Area], [Location], [Address], [UserId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, N'MASUM RANA', N'+8801613377238', N'Dhaka', N'Dhaka', N'Airport', N'23.785712657098795,90.37086300551891', N'Amtala Mosque Road, Dhaka, Bangladesh', N'7d111b31-681a-4e79-bead-aa272a3c3280', N'7d111b31-681a-4e79-bead-aa272a3c3280', CAST(N'2021-04-29T20:57:23.657' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_Address] OFF
GO
INSERT [dbo].[SSL_Authenticate] ([Id], [Username], [Password], [Role]) VALUES (N'17ee71bc-1f4f-4ef0-975a-337e7181d249', N'admin', N'admin', N'Admin')
INSERT [dbo].[SSL_Authenticate] ([Id], [Username], [Password], [Role]) VALUES (N'83089b52-6054-4267-b799-42d71717c52b', N'mk', N'123', N'Customer')
INSERT [dbo].[SSL_Authenticate] ([Id], [Username], [Password], [Role]) VALUES (N'37481fbc-2395-4a88-abca-75858b4ad63e', N'Subra', N'ssl@12345', N'Sales Partner')
INSERT [dbo].[SSL_Authenticate] ([Id], [Username], [Password], [Role]) VALUES (N'7d111b31-681a-4e79-bead-aa272a3c3280', N'M1', N'123456', N'Customer')
GO
SET IDENTITY_INSERT [dbo].[SSL_Brand] ON 

INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, 1, N'TVS Auto Bangladesh', N'TVS Auto Bangladesh Ltd is a joint venture between TVS & Sons and Rian Motors of Bangladesh.', N'IMG_20210605_144311.jpg', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, 4, N'BOROFONE - Fashionable Mobile Accessories', N'Fashion accessories brand. Full range of mobile phone accessories - audio, in-car, chargers, cables, mobile power banks and many other.', N'IMG_20210605_144312.jpg', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, 3, N'Nikon Corporation', N'U.S.A.. For detailed product information, please access the websites for your region shown below. Imaging Products. Nikon Inc.', N'IMG_20210605_144313.jpg', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, 2, N'Canon Inc.', N'We believe there are no limits to what an image can do. That''s why we''ve used our history of imaging expertise to drive innovation across new industries, all with', N'IMG_20210605_144314.jpg', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (5, 6, N'AKS Pharmacy', N'We believe there are no limits to what an image can do. That''s why we''ve used our history of imaging expertise to drive innovation across new industries, all with', N'IMG_20210605_144315.jpg', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (6, 5, N'Bullet Expess Wholesale Club', N'We believe there are no limits to what an image can do. That''s why we''ve used our history of imaging expertise to drive innovation across new industries, all with', N'IMG_20210605_144316.jpg', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (7, 5, N'Express Freshvaly', N'We believe there are no limits to what an image can do. That''s why we''ve used our history of imaging expertise to drive innovation across new industries, all with', N'IMG_20210605_144317.jpg', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (8, 5, N'Bullet Express Khaleque & Sons', N'We believe there are no limits to what an image can do. That''s why we''ve used our history of imaging expertise to drive innovation across new industries, all with', N'IMG_20210605_144318.png', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (9, 5, N'Bullet Express Little India', N'We believe there are no limits to what an image can do. That''s why we''ve used our history of imaging expertise to drive innovation across new industries, all with', N'IMG_20210605_144319.png', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (10, 5, N'Bullet Express Unimart', N'We believe there are no limits to what an image can do. That''s why we''ve used our history of imaging expertise to drive innovation across new industries, all with', N'IMG_20210605_144320.png', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (11, 5, N'Express Grocery', N'We believe there are no limits to what an image can do. That''s why we''ve used our history of imaging expertise to drive innovation across new industries, all with', N'IMG_20210605_144321.png', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (12, 5, N'Bullet Express Bengal Meat', N'We believe there are no limits to what an image can do. That''s why we''ve used our history of imaging expertise to drive innovation across new industries, all with', N'IMG_20210605_144322.png', N'/Uploads/IMG_20210604_154312.jpg', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (13, 9, N'Google', N'Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, a search engine, cloud computing, software, and hardware.', N'IMG_20210427_152246_399.jpg', N'/Uploads/', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-04-27T15:23:34.413' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Brand] ([Id], [CategoryId], [Name], [Description], [ImageName], [ImagePath], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (18, 3, N'Apple', N'Apple Inc. is an American multinational technology company headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software, and online services.', N'IMG_20210428_174559_240.jpg', N'/Uploads/', N'Available', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-04-28T17:46:17.653' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_BrandCategory] ON 

INSERT [dbo].[SSL_BrandCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, N'Automobile', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_BrandCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, N'Electronics ', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_BrandCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, N'Accessories', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_BrandCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (5, N'Grocery', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_BrandCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (6, N'Pharmacy', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_BrandCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (9, N'Fashion', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-04-27T15:22:41.583' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_BrandCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_CampaignBrand] ON 

INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, 5, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, 6, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, 7, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, 8, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (5, 9, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (6, 10, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (7, 11, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (8, 12, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (9, 1, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (10, 2, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (11, 3, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (12, 4, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (13, 1, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (14, 2, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (15, 3, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrand] ([Id], [BrandId], [CampBrandCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (16, 4, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_CampaignBrand] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_CampaignBrandCategory] ON 

INSERT [dbo].[SSL_CampaignBrandCategory] ([Id], [Name], [Description], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, N'Express', N'None', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignBrandCategory] ([Id], [Name], [Description], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, N'Shops - Cash on Delivery', N'None', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_CampaignBrandCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_CampaignProduct] ON 

INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, 3, 1, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, 4, 1, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, 5, 1, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, 6, 1, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (5, 7, 1, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (6, 3, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (7, 4, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (8, 5, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (9, 6, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (10, 7, 2, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (11, 3, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (12, 4, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (13, 5, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (14, 6, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (15, 7, 3, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (16, 3, 4, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (17, 4, 4, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (18, 5, 4, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (19, 6, 4, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProduct] ([Id], [ProductId], [CampProductCategoryId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (20, 7, 4, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_CampaignProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_CampaignProductCategory] ON 

INSERT [dbo].[SSL_CampaignProductCategory] ([Id], [Name], [Description], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, N'Flash Sale', N'Buy 1 Get 1 Deals and More', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProductCategory] ([Id], [Name], [Description], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, N'MEGA SME Deal', N'For SME Retailers', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProductCategory] ([Id], [Name], [Description], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, N'Mega Quick Deal', N'Exclusive Offers!', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignProductCategory] ([Id], [Name], [Description], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, N'Payment on Delivery', N'Guaranteed Delivery within 7 Days', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_CampaignProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_CampaignSlider] ON 

INSERT [dbo].[SSL_CampaignSlider] ([Id], [ImageName], [ImagePath], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, N'IMG_20210604_144312.jpg', N'~Uploads/IMG_20210604_144312.jpg', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignSlider] ([Id], [ImageName], [ImagePath], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, N'IMG_20210604_144313.jpg', N'~Uploads/IMG_20210604_144312.jpg', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_CampaignSlider] ([Id], [ImageName], [ImagePath], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, N'IMG_20210604_144314.jpg', N'~Uploads/IMG_20210604_144312.jpg', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_CampaignSlider] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_DeliveryType] ON 

INSERT [dbo].[SSL_DeliveryType] ([Id], [Name], [Cost], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, N'Home Delivery', CAST(50.00 AS Numeric(18, 2)), N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_DeliveryType] ([Id], [Name], [Cost], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, N'Delivery Point', CAST(0.00 AS Numeric(18, 2)), N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_DeliveryType] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_Description] ON 

INSERT [dbo].[SSL_Description] ([Id], [LabelName], [Description], [ProductId]) VALUES (1, N'ENGINE', N'Type: 4 stroke, air cooled, single cylinder OHC
Clyinder bore: 62 mm
Stroke: 52.5 mm
Piston displacement: 159.7 cc
Compression ratio: 9.5 : 1
Carburettor: Ucal BS-26
Air filter: Double Polyurethane foam filter element
Oil filter: Wire mesh and micronic paper filter
Lubrication system: Forced wet sump
Maximum power in kW: 11.19(15.2 bhp)@8500 rpm
Maximum torque in Nm: 13.1 @ 6000 rpm
Maximum speed: 118 km/hr
Engine idling rpm: 1400 ± 100 rpm
Starting system: Kick starter/Electric starter', 3)
INSERT [dbo].[SSL_Description] ([Id], [LabelName], [Description], [ProductId]) VALUES (4, N'TRANSMISSION', N'Clutch: Wet – Multi plate type
Gear shift pattern: 1 down and 4 up
Primary transmission: Helical gears
Secondary transmission: Chain and sprockets', 3)
INSERT [dbo].[SSL_Description] ([Id], [LabelName], [Description], [ProductId]) VALUES (5, N'DIMENSIONS', N'Overall length: 2085 mm
Overall width: 730 mm
Overall height: 1105 mm
Seat height: 790 mm
Ground clearance: 165 mm
Wheel base: 1300 mm
Kerb weight(with toolkit and 90% fuel): 137 kg
Pay load: 130 kg
Maximum laden weight: 267 kg
Steering angle: 36 Degree
Caster angle: 25.5 Degree', 3)
INSERT [dbo].[SSL_Description] ([Id], [LabelName], [Description], [ProductId]) VALUES (6, N'GEAR RATIOS', N'I gear: 2.917:1
II gear: 1.857:1
III gear: 1.333:1
IV gear: 1.050:1
V gear: 0.880:1
Primary reduction: 3.095:1
Final reduction: 3.385:1', 3)
INSERT [dbo].[SSL_Description] ([Id], [LabelName], [Description], [ProductId]) VALUES (10, N'Audio Option', N'Supported Audio Formats: HE-AAC, LC-AAC, MP3, Vorbis, WAV (LPCM), Opus, FLAC with support for high-resolution streams (24-bit/96KHz)
Speaker: High excursion speaker with 2” driver + dual 2” passive radiators
Far-field voice recognition supports hands-free use', 20)
INSERT [dbo].[SSL_Description] ([Id], [LabelName], [Description], [ProductId]) VALUES (11, N'Power', N'Required 16.5V, 2A included', 20)
INSERT [dbo].[SSL_Description] ([Id], [LabelName], [Description], [ProductId]) VALUES (12, N'Description', N'This device gets play songs, tackle your day, enjoy your entertainment and control your smart home using your voice, a total hands-free operation is possible with this google assistant. Entertainment will be everywhere on your command as you listen to music, shuffle playlists, audiobooks and more with Google Home’s high excursion speaker. Your whole day could be scheduled by personalizing your programs, reminders, calls, news, birthdays and more. This is also compatible with Chromecast, so you can bring down the whole world of entertainment such shows, movies and music on your TV or speakers. This smart gadget works with more than 5,000 smart home devices of over 150 brands. So there will be a great flexibility on every possibility with it.', 20)
SET IDENTITY_INSERT [dbo].[SSL_Description] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_OnlineBanking] ON 

INSERT [dbo].[SSL_OnlineBanking] ([Id], [IsMobile], [Name], [AccountNumber], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, 0, N'IFIC Bank', N'564564564564', N'37481fbc-2395-4a88-abca-75858b4ad63e', CAST(N'2021-04-12T09:56:44.057' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_OnlineBanking] ([Id], [IsMobile], [Name], [AccountNumber], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, 1, N'bKash', N'01914141707', N'37481fbc-2395-4a88-abca-75858b4ad63e', CAST(N'2021-04-12T09:59:06.857' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_OnlineBanking] ([Id], [IsMobile], [Name], [AccountNumber], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, 1, N'Rocket', N'01516186112', N'37481fbc-2395-4a88-abca-75858b4ad63e', CAST(N'2021-04-12T10:12:25.810' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_OnlineBanking] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_Order] ON 

INSERT [dbo].[SSL_Order] ([Id], [InvoiceNo], [UserId], [PaymentTypeId], [CouponId], [RefId], [Status], [IsPaid], [TotalAmount], [AddressId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, N'INV2021042821430077', N'37481fbc-2395-4a88-abca-75858b4ad63e', 7, 0, N'', N'Shipped', 0, CAST(120000.00 AS Numeric(18, 2)), 1, N'37481fbc-2395-4a88-abca-75858b4ad63e', CAST(N'2021-04-28T21:43:00.770' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Order] ([Id], [InvoiceNo], [UserId], [PaymentTypeId], [CouponId], [RefId], [Status], [IsPaid], [TotalAmount], [AddressId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, N'INV20210428220007195', N'83089b52-6054-4267-b799-42d71717c52b', 7, 0, N'', N'Cancelled', 0, CAST(32000.00 AS Numeric(18, 2)), 2, N'83089b52-6054-4267-b799-42d71717c52b', CAST(N'2021-04-28T22:00:07.197' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Order] ([Id], [InvoiceNo], [UserId], [PaymentTypeId], [CouponId], [RefId], [Status], [IsPaid], [TotalAmount], [AddressId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, N'INV20210429204338596', N'83089b52-6054-4267-b799-42d71717c52b', 7, 0, N'', N'Pending', 0, CAST(1200.00 AS Numeric(18, 2)), 2, N'83089b52-6054-4267-b799-42d71717c52b', CAST(N'2021-04-29T20:43:38.597' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Order] ([Id], [InvoiceNo], [UserId], [PaymentTypeId], [CouponId], [RefId], [Status], [IsPaid], [TotalAmount], [AddressId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, N'INV20210429205746848', N'7d111b31-681a-4e79-bead-aa272a3c3280', 7, 0, N'', N'Pending', 0, CAST(1200.00 AS Numeric(18, 2)), 3, N'7d111b31-681a-4e79-bead-aa272a3c3280', CAST(N'2021-04-29T20:57:46.847' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_Order] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_OrderDetail] ON 

INSERT [dbo].[SSL_OrderDetail] ([Id], [OrderId], [ProductId], [Qty], [UnitPrice], [TotalAmount], [UserId]) VALUES (1, 1, 3, 1, CAST(120000.00 AS Numeric(18, 2)), CAST(120000.00 AS Numeric(18, 2)), N'37481fbc-2395-4a88-abca-75858b4ad63e')
INSERT [dbo].[SSL_OrderDetail] ([Id], [OrderId], [ProductId], [Qty], [UnitPrice], [TotalAmount], [UserId]) VALUES (2, 2, 6, 1, CAST(32000.00 AS Numeric(18, 2)), CAST(32000.00 AS Numeric(18, 2)), N'83089b52-6054-4267-b799-42d71717c52b')
INSERT [dbo].[SSL_OrderDetail] ([Id], [OrderId], [ProductId], [Qty], [UnitPrice], [TotalAmount], [UserId]) VALUES (3, 3, 4, 1, CAST(1200.00 AS Numeric(18, 2)), CAST(1200.00 AS Numeric(18, 2)), N'83089b52-6054-4267-b799-42d71717c52b')
INSERT [dbo].[SSL_OrderDetail] ([Id], [OrderId], [ProductId], [Qty], [UnitPrice], [TotalAmount], [UserId]) VALUES (4, 4, 4, 1, CAST(1200.00 AS Numeric(18, 2)), CAST(1200.00 AS Numeric(18, 2)), N'7d111b31-681a-4e79-bead-aa272a3c3280')
SET IDENTITY_INSERT [dbo].[SSL_OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_PaymentHistory] ON 

INSERT [dbo].[SSL_PaymentHistory] ([Id], [OrderId], [InvoiceNo], [PaymentTypeId], [CouponId], [RefId], [TotalAmount], [AddressId], [UserId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, 1, N'INV2021042821430077', 7, 0, N'', CAST(120000.00 AS Numeric(18, 2)), 1, N'37481fbc-2395-4a88-abca-75858b4ad63e', N'37481fbc-2395-4a88-abca-75858b4ad63e', CAST(N'2021-04-28T21:43:10.477' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_PaymentHistory] ([Id], [OrderId], [InvoiceNo], [PaymentTypeId], [CouponId], [RefId], [TotalAmount], [AddressId], [UserId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, 2, N'INV20210428220007195', 7, 0, N'', CAST(32000.00 AS Numeric(18, 2)), 2, N'83089b52-6054-4267-b799-42d71717c52b', N'83089b52-6054-4267-b799-42d71717c52b', CAST(N'2021-04-28T22:00:19.057' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_PaymentHistory] ([Id], [OrderId], [InvoiceNo], [PaymentTypeId], [CouponId], [RefId], [TotalAmount], [AddressId], [UserId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, 3, N'INV20210429204338596', 7, 0, N'', CAST(1200.00 AS Numeric(18, 2)), 2, N'83089b52-6054-4267-b799-42d71717c52b', N'83089b52-6054-4267-b799-42d71717c52b', CAST(N'2021-04-29T20:43:47.500' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_PaymentHistory] ([Id], [OrderId], [InvoiceNo], [PaymentTypeId], [CouponId], [RefId], [TotalAmount], [AddressId], [UserId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, 4, N'INV20210429205746848', 7, 0, N'', CAST(1200.00 AS Numeric(18, 2)), 3, N'7d111b31-681a-4e79-bead-aa272a3c3280', N'7d111b31-681a-4e79-bead-aa272a3c3280', CAST(N'2021-04-29T20:57:52.640' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_PaymentHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_PaymentType] ON 

INSERT [dbo].[SSL_PaymentType] ([Id], [Name], [ImageName], [ImagePath], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, N'bKash', N'IMG_20210415_144309.jpg', NULL, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_PaymentType] ([Id], [Name], [ImageName], [ImagePath], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, N'Rocket', N'IMG_20210415_144310.jpg', NULL, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_PaymentType] ([Id], [Name], [ImageName], [ImagePath], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, N'Nagad', N'IMG_20210415_144312.jpg', NULL, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_PaymentType] ([Id], [Name], [ImageName], [ImagePath], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, N'Ucash', N'IMG_20210415_144313.jpg', NULL, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_PaymentType] ([Id], [Name], [ImageName], [ImagePath], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (5, N'Visa/Mastercard', N'IMG_20210415_144314.jpg', NULL, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_PaymentType] ([Id], [Name], [ImageName], [ImagePath], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (6, N'SSLCommerz', N'IMG_20210415_144315.jpg', NULL, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_PaymentType] ([Id], [Name], [ImageName], [ImagePath], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (7, N'Cash on Delivery', N'IMG_20210415_144316.jpg', NULL, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_Product] ON 

INSERT [dbo].[SSL_Product] ([Id], [CategoryId], [Name], [BrandId], [UnitPrice], [Quantity], [Discount], [TotalAmount], [ImageName], [ImagePath], [VendorId], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, 3, N'TVS Apache RTR 160 SD Racing Edition Glossy Motor Bike', 1, CAST(120000.00 AS Numeric(18, 2)), 10, CAST(0.00 AS Numeric(18, 2)), CAST(1200000.00 AS Numeric(18, 2)), N'IMG_20210604_154312.jpg', N'/Uploads/IMG_20210604_154312.jpg', 2, N'Approved', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Product] ([Id], [CategoryId], [Name], [BrandId], [UnitPrice], [Quantity], [Discount], [TotalAmount], [ImageName], [ImagePath], [VendorId], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, 1, N'Borofone BQ3 Preference Wireless Charger', 2, CAST(1200.00 AS Numeric(18, 2)), 6, CAST(0.00 AS Numeric(18, 2)), CAST(7200.00 AS Numeric(18, 2)), N'IMG_20210604_154313.jpg', N'/Uploads/IMG_20210604_154312.jpg', 2, N'Approved', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Product] ([Id], [CategoryId], [Name], [BrandId], [UnitPrice], [Quantity], [Discount], [TotalAmount], [ImageName], [ImagePath], [VendorId], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (5, 1, N'Borofone BT28 Power Bank - 10000mAh', 2, CAST(900.00 AS Numeric(18, 2)), 8, CAST(0.00 AS Numeric(18, 2)), CAST(7200.00 AS Numeric(18, 2)), N'IMG_20210604_154314.jpg', N'/Uploads/IMG_20210604_154312.jpg', 2, N'Approved', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Product] ([Id], [CategoryId], [Name], [BrandId], [UnitPrice], [Quantity], [Discount], [TotalAmount], [ImageName], [ImagePath], [VendorId], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (6, 2, N'Nikon D3300 Camera with Camera Accessories', 3, CAST(32000.00 AS Numeric(18, 2)), 5, CAST(0.00 AS Numeric(18, 2)), CAST(160000.00 AS Numeric(18, 2)), N'IMG_20210604_154315.jpg', N'/Uploads/IMG_20210604_154312.jpg', 2, N'Approved', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Product] ([Id], [CategoryId], [Name], [BrandId], [UnitPrice], [Quantity], [Discount], [TotalAmount], [ImageName], [ImagePath], [VendorId], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (7, 2, N'Canon IXUS 185 20.0 MP Digital Camera', 4, CAST(10000.00 AS Numeric(18, 2)), 2, CAST(0.00 AS Numeric(18, 2)), CAST(100000.00 AS Numeric(18, 2)), N'IMG_20210604_154316.jpg', N'/Uploads/IMG_20210604_154312.jpg', 2, N'Approved', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Product] ([Id], [CategoryId], [Name], [BrandId], [UnitPrice], [Quantity], [Discount], [TotalAmount], [ImageName], [ImagePath], [VendorId], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (20, 1, N'Google Home Smart Assistant & Smart Speaker', 13, CAST(12000.00 AS Numeric(18, 2)), 10, CAST(0.00 AS Numeric(18, 2)), CAST(120000.00 AS Numeric(18, 2)), N'IMG_20210429_150313_736.jpg', N'/Uploads/', 2, N'Approved', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-04-29T15:03:50.343' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_ProductCategory] ON 

INSERT [dbo].[SSL_ProductCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, N'Electronic Devices', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_ProductCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, N'Electronic Accessories', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_ProductCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, N'Automotive & Motorbike', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_ProductCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, N'Health & Beauty', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_ProductCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (5, N'Groceries', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_ProductCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (6, N'Women’s Fashion', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_ProductCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (7, N'Men’s Fashion', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_ProductCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (8, N'Furniture', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_ProductCategory] ([Id], [Name], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (12, N'Hardware', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-04-28T17:45:54.537' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_Reference] ON 

INSERT [dbo].[SSL_Reference] ([Id], [RefId], [Discount], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, N'20210604125906288', CAST(5.00 AS Numeric(18, 2)), N'37481fbc-2395-4a88-abca-75858b4ad63e', CAST(N'2021-04-12T11:46:38.790' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_Reference] OFF
GO
SET IDENTITY_INSERT [dbo].[SSL_Specification] ON 

INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (1, N'Main Product Type', N'Motor Bike', 3)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (2, N'Model', N'TVS Apache RTR 160 SD Racing Edition', 3)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (3, N'Engine Type', N'4 stroke, air cooled, single cylinder OHC', 3)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (4, N'Stroke', N'52.5 mm', 3)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (5, N'Piston displacement', N'159.7 cc', 3)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (6, N'Compression ratio', N'9.5 : 1', 3)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (7, N'Carburettor', N'Ucal BS-26', 3)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (8, N'Maximum power in kW', N'11.19(15.2 bhp)@8500 rpm', 3)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (9, N'Maximum torque in Nm', N'13.1 @ 6000 rpm', 3)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (10, N'Maximum Speed', N'118 km/hr', 3)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (11, N'Starting system', N'Kick starter/Electric starter', 3)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (14, N'Power', N'Required 16.5V, 2A included', 20)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (15, N'Color', N'Body: White
Base: Slate fabric', 20)
INSERT [dbo].[SSL_Specification] ([Id], [LabelName], [Specification], [ProductId]) VALUES (16, N'Weight', N'Device: 1.05 lbs (477 g)
Power adapter: 4.58 oz (130 g)', 20)
SET IDENTITY_INSERT [dbo].[SSL_Specification] OFF
GO
INSERT [dbo].[SSL_User] ([Id], [FirstName], [LastName], [PhoneNumber], [Gender], [BirthDate], [Email], [Division], [District], [PoliceStation], [Address], [Location], [ImageName], [ImagePath], [Token], [RefId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (N'17ee71bc-1f4f-4ef0-975a-337e7181d249', N'Admin', N'Admin', N'01914141707', N'Male', N'2021-04-27', N'admin@info.net', N'Dhaka', N'Dhaka', N'Shahbag', N'73, Plot No-3/D, 1st Floor, Kabbacosh Super Market, Dhaka 1215, Bangladesh', N'23.751428079697597,90.39426393806933', N'IMG_20200831_172211.jpg', NULL, NULL, N'20210427121436678', N'e75ed516-a4ba-414b-904c-2680acb9ba20', CAST(N'2021-04-27T12:14:36.680' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_User] ([Id], [FirstName], [LastName], [PhoneNumber], [Gender], [BirthDate], [Email], [Division], [District], [PoliceStation], [Address], [Location], [ImageName], [ImagePath], [Token], [RefId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (N'83089b52-6054-4267-b799-42d71717c52b', N'Mustofa', N'Kamal', N'+8801914141707', N'Male', N'10-10-1900', N'kamal@gmail.com', N'Dhaka', N'Dhaka', N'Dhaka Cantonment', N'Dhaka Cantonment, Dhaka -1206', N'23.822325984330135, 90.39277644616585', N'IMG_20200831_172211.jpg', N'/Uploads/IMG_20210604_154312.jpg', NULL, N'20210604125906287', N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_User] ([Id], [FirstName], [LastName], [PhoneNumber], [Gender], [BirthDate], [Email], [Division], [District], [PoliceStation], [Address], [Location], [ImageName], [ImagePath], [Token], [RefId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (N'37481fbc-2395-4a88-abca-75858b4ad63e', N'Subra', N'Systems Ltd.', N'02-9145938', N'Male', N'2021-04-11', N'subrainfo@info.net', N'Dhaka', N'Dhaka', N'Mirpur', N'Hasney Tower, Level 10, 3/A, Dhaka 1215', N'23.75155824455005,90.39485332826229', N'IMG_20200831_172211.jpg', N'okhttp3.ResponseBody$1@bba214a', NULL, N'20210604125906288', N'37481fbc-2395-4a88-abca-75858b4ad63e', CAST(N'2021-04-12T11:05:10.637' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_User] ([Id], [FirstName], [LastName], [PhoneNumber], [Gender], [BirthDate], [Email], [Division], [District], [PoliceStation], [Address], [Location], [ImageName], [ImagePath], [Token], [RefId], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (N'7d111b31-681a-4e79-bead-aa272a3c3280', N'MASUM', N'RANA', N'+8801613377238', N'Male', N'29-04-2021 20:58:59::528', N'my_masum@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'7d111b31-681a-4e79-bead-aa272a3c3280', CAST(N'2021-04-29T20:59:00.930' AS DateTime), NULL, NULL, N'8989')
GO
SET IDENTITY_INSERT [dbo].[SSL_Vendor] ON 

INSERT [dbo].[SSL_Vendor] ([Id], [Name], [ContactPerson], [PhoneNumber], [Email], [Division], [District], [PoliceStation], [Address], [Location], [ImageName], [ImagePath], [PersonImageName], [PersonImagePath], [Status], [Token], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (1, N'TVS Bangladesh', N'Zaman Uddin', N'+88029145938', N'mkelectronics@gmail.com', N'Dhaka', N'Dhaka', N'Karwan Bazar', N'Hasney Tower, Level 10, 3/A, Dhaka 1215', N'23.751705546096442, 90.39522883748366', N'IMG_20210605_144311.jpg', N'/Uploads/IMG_20210604_154312.jpg', N'IMG_20210427_134755_160.jpg', N'/Uploads/IMG_20210604_154312.jpg', N'Approved', NULL, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-06-04T12:59:06.287' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Vendor] ([Id], [Name], [ContactPerson], [PhoneNumber], [Email], [Division], [District], [PoliceStation], [Address], [Location], [ImageName], [ImagePath], [PersonImageName], [PersonImagePath], [Status], [Token], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (2, N'MK Electronics Ltd.', N'Mustofa Kamal', N'+8801914141707', N'mk@gmail.com', N'Dhaka', N'Dhaka', N'Shahbag', N'73, Plot No-3/D, 1st Floor, Kabbacosh Super Market, Dhaka 1215, Bangladesh', N'23.751428079697597,90.39426393806933', N'IMG_20200831_172210.png', N'/Uploads/', N'IMG_20210427_134755_160.jpg', N'/Uploads/', N'Approved', NULL, N'9d79cd29-086d-4b73-ab19-74612a2dd426', CAST(N'2021-04-27T13:48:51.547' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Vendor] ([Id], [Name], [ContactPerson], [PhoneNumber], [Email], [Division], [District], [PoliceStation], [Address], [Location], [ImageName], [ImagePath], [PersonImageName], [PersonImagePath], [Status], [Token], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (3, N'iCenter Store Ltd.', N'Shahid Khan', N'+8801914141707', N'icenter@gmail.com', N'Dhaka', N'Jhalokati', N'Bhashantek', N'73, Plot No-3/D, 1st Floor, Kabbacosh Super Market, Dhaka 1215, Bangladesh', N'23.751428079697597,90.39426393806933', N'IMG_20210428_174533_817.jpg', N'/Uploads/', NULL, N'/Uploads/', N'Approved', NULL, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-04-28T17:45:42.453' AS DateTime), NULL, NULL, N'8989')
INSERT [dbo].[SSL_Vendor] ([Id], [Name], [ContactPerson], [PhoneNumber], [Email], [Division], [District], [PoliceStation], [Address], [Location], [ImageName], [ImagePath], [PersonImageName], [PersonImagePath], [Status], [Token], [CreateUser], [CreateDate], [EditUser], [EditDate], [OCode]) VALUES (4, N'MASUM RANA', N'mmr', N'+8801613377238', N'masum.rana@subrasystems.com', N'Dhaka', N'Dhaka', N'Banani', N'73, Plot No-3/D, 1st Floor, Kabbacosh Super Market, Dhaka 1215, Bangladesh', N'23.751429614091194,90.39426393806933', N'IMG_20210429_142337_993.jpg', N'/Uploads/', NULL, N'/Uploads/', N'Approved', NULL, N'17ee71bc-1f4f-4ef0-975a-337e7181d249', CAST(N'2021-04-29T14:24:06.643' AS DateTime), NULL, NULL, N'8989')
SET IDENTITY_INSERT [dbo].[SSL_Vendor] OFF
GO
ALTER TABLE [dbo].[SSL_Authenticate] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[SSL_Brand] ADD  CONSTRAINT [DF_SSL_Brand_Status]  DEFAULT (N'Pending') FOR [Status]
GO
ALTER TABLE [dbo].[SSL_CampaignBrand] ADD  CONSTRAINT [DF_SSL_CampaignBrand_CampBrandCategoryId]  DEFAULT ((0)) FOR [CampBrandCategoryId]
GO
ALTER TABLE [dbo].[SSL_CampaignProduct] ADD  CONSTRAINT [DF_SSL_CampaignProduct_CampProductCategoryId]  DEFAULT ((0)) FOR [CampProductCategoryId]
GO
ALTER TABLE [dbo].[SSL_Coupon] ADD  CONSTRAINT [DF_SSL_Coupon_Discount]  DEFAULT ((0.0)) FOR [Discount]
GO
ALTER TABLE [dbo].[SSL_DeliveryType] ADD  CONSTRAINT [DF_SSL_DeliveryType_Discount]  DEFAULT ((0.0)) FOR [Cost]
GO
ALTER TABLE [dbo].[SSL_Order] ADD  CONSTRAINT [DF_SSL_Order_Status]  DEFAULT (N'Pending') FOR [Status]
GO
ALTER TABLE [dbo].[SSL_Order] ADD  CONSTRAINT [DF_SSL_Order_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[SSL_Order] ADD  CONSTRAINT [DF_SSL_Order_TotalAmount]  DEFAULT ((0.0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[SSL_OrderDetail] ADD  CONSTRAINT [DF_SSL_OrderProduct_Qty]  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[SSL_OrderDetail] ADD  CONSTRAINT [DF_SSL_OrderProduct_UnitPrice]  DEFAULT ((0.0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[SSL_OrderDetail] ADD  CONSTRAINT [DF_SSL_OrderProduct_TotalAmount]  DEFAULT ((0.0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[SSL_Product] ADD  CONSTRAINT [DF_SSL_Product_UnitPrice]  DEFAULT ((0.0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[SSL_Product] ADD  CONSTRAINT [DF_SSL_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[SSL_Product] ADD  CONSTRAINT [DF_SSL_Product_Discount]  DEFAULT ((0.0)) FOR [Discount]
GO
ALTER TABLE [dbo].[SSL_Product] ADD  CONSTRAINT [DF_SSL_Product_TotalAmount]  DEFAULT ((0.0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[SSL_Product] ADD  CONSTRAINT [DF_SSL_Product_Status]  DEFAULT (N'Pending') FOR [Status]
GO
ALTER TABLE [dbo].[SSL_Reference] ADD  CONSTRAINT [DF_SSL_Reference_Discount]  DEFAULT ((0.0)) FOR [Discount]
GO
ALTER TABLE [dbo].[SSL_ShoppingCart] ADD  CONSTRAINT [DF_SSL_ShoppingCart_Qty]  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[SSL_ShoppingCart] ADD  CONSTRAINT [DF_SSL_ShoppingCart_UnitPrice]  DEFAULT ((0.0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[SSL_ShoppingCart] ADD  CONSTRAINT [DF_SSL_ShoppingCart_TotalAmount]  DEFAULT ((0.0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[SSL_User] ADD  CONSTRAINT [DF__SSL_User__Id__2C3393D0]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[SSL_UserBalance] ADD  CONSTRAINT [DF_Table_1_UnitPrice]  DEFAULT ((0.0)) FOR [Balance]
GO
ALTER TABLE [dbo].[SSL_Vendor] ADD  CONSTRAINT [DF_SSL_Vendor_Status]  DEFAULT (N'Pending') FOR [Status]
GO
USE [master]
GO
ALTER DATABASE [SSL_Ecommerce] SET  READ_WRITE 
GO
