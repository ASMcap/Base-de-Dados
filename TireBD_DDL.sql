USE [master]
GO
/****** Object:  Database [TireDB]    Script Date: 18/06/2019 00:38:05 ******/
CREATE DATABASE [TireDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TireDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TireDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TireDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TireDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TireDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TireDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TireDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TireDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TireDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TireDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TireDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TireDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TireDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TireDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TireDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TireDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TireDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TireDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TireDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TireDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TireDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TireDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TireDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TireDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TireDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TireDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TireDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TireDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TireDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TireDB] SET  MULTI_USER 
GO
ALTER DATABASE [TireDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TireDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TireDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TireDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TireDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TireDB]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EcoValue]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EcoValue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](3) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[EcoValueTypeID] [int] NOT NULL,
 CONSTRAINT [PK_EcoValue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EcoValuePrice]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EcoValuePrice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EcoValueID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Price] [decimal](10, 2) NULL,
 CONSTRAINT [PK_EcoValuePrice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EcoValueType]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EcoValueType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](10) NOT NULL,
 CONSTRAINT [PK_EcoValueType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FileType]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FileType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Note] [varchar](200) NULL,
 CONSTRAINT [PK_FileType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogType]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Note] [varchar](100) NULL,
 CONSTRAINT [PK_LogType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tire]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tire](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TireWidthID] [int] NOT NULL,
	[TireAspectRatioID] [int] NOT NULL,
	[TireDiameterID] [int] NOT NULL,
 CONSTRAINT [PK_Tire] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TireAspectRatio]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TireAspectRatio](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_TireAspectRatio] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TireBrand]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TireBrand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TireBrand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TireDiameter]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TireDiameter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_TireDiameter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TireFileLayout]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TireFileLayout](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[TireSupplierID] [int] NOT NULL,
	[FileTypeID] [int] NOT NULL,
	[StartWidth] [int] NOT NULL,
	[EndWidth] [int] NULL,
	[StartAspectRatio] [int] NOT NULL,
	[EndAspectRatio] [int] NULL,
	[StartDiameter] [int] NOT NULL,
	[EndDiameter] [int] NULL,
	[StartLoad] [int] NOT NULL,
	[EndLoad] [int] NULL,
	[StartSpeed] [int] NOT NULL,
	[EndSpeed] [int] NULL,
	[StartNoise] [int] NOT NULL,
	[EndNoise] [int] NULL,
	[StartResistance] [int] NOT NULL,
	[EndResistance] [int] NULL,
	[StartGrip] [int] NOT NULL,
	[EndGrip] [int] NULL,
	[StartTaxCode] [int] NOT NULL,
	[EndTaxCode] [int] NULL,
	[StartPrice] [int] NOT NULL,
	[EndPrice] [int] NULL,
	[CharacterSeparator] [char](1) NOT NULL,
	[QtyDecimalPlaces] [int] NOT NULL,
	[ReplacementReferenceIdentifier] [varchar](70) NULL,
	[BeginDate] [date] NOT NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_TireFileLayout] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TireLoadIndex]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TireLoadIndex](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Index] [int] NOT NULL,
	[LoadKg] [decimal](10, 1) NOT NULL,
 CONSTRAINT [PK_TireLoadIndex] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TireLog]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TireLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TireFileLayoutID] [int] NOT NULL,
	[LogTypeID] [int] NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[StampDate] [date] NOT NULL,
	[StampUser] [int] NOT NULL,
 CONSTRAINT [PK_TireLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TirePrice]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TirePrice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TireID] [int] NOT NULL,
	[TireSupplierID] [int] NOT NULL,
	[TireBrandID] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[LoadIndexID] [int] NULL,
	[SpeedIndexID] [int] NULL,
	[RunFlat] [bit] NULL,
	[EcoValueID] [int] NULL,
	[Reference] [varchar](30) NULL,
	[Resistance] [nchar](1) NULL,
	[Grip] [nchar](1) NULL,
	[Noise] [int] NULL,
	[DatePrice] [datetime] NOT NULL,
	[StampDate] [date] NOT NULL,
	[TireSeasonID] [int] NULL,
	[NoiseCat] [int] NULL,
 CONSTRAINT [PK_TirePrice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TireSeason]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TireSeason](
	[ID] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TireSeason] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TireSpeedIndex]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TireSpeedIndex](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Index] [varchar](2) NOT NULL,
	[MaxSpeedKms] [int] NOT NULL,
 CONSTRAINT [PK_TireSpeedIndex] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TireSupplier]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TireSupplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](50) NULL,
	[ContactPerson] [varchar](50) NULL,
	[Status] [bit] NULL,
	[Address] [varchar](300) NOT NULL,
	[Locality] [varchar](200) NOT NULL,
	[PostalCode] [varchar](50) NOT NULL,
	[BeginDate] [date] NOT NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_TireSupplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TireWidth]    Script Date: 18/06/2019 00:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TireWidth](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_TireWidth] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[EcoValue]  WITH CHECK ADD  CONSTRAINT [FK_EcoValue_EcoValueType] FOREIGN KEY([EcoValueTypeID])
REFERENCES [dbo].[EcoValueType] ([ID])
GO
ALTER TABLE [dbo].[EcoValue] CHECK CONSTRAINT [FK_EcoValue_EcoValueType]
GO
ALTER TABLE [dbo].[EcoValuePrice]  WITH CHECK ADD  CONSTRAINT [FK_EcoValuePrice_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[EcoValuePrice] CHECK CONSTRAINT [FK_EcoValuePrice_Country]
GO
ALTER TABLE [dbo].[EcoValuePrice]  WITH CHECK ADD  CONSTRAINT [FK_EcoValuePrice_EcoValue] FOREIGN KEY([EcoValueID])
REFERENCES [dbo].[EcoValue] ([ID])
GO
ALTER TABLE [dbo].[EcoValuePrice] CHECK CONSTRAINT [FK_EcoValuePrice_EcoValue]
GO
ALTER TABLE [dbo].[Tire]  WITH CHECK ADD  CONSTRAINT [FK_Tire_TireAspectRatio] FOREIGN KEY([TireAspectRatioID])
REFERENCES [dbo].[TireAspectRatio] ([ID])
GO
ALTER TABLE [dbo].[Tire] CHECK CONSTRAINT [FK_Tire_TireAspectRatio]
GO
ALTER TABLE [dbo].[Tire]  WITH CHECK ADD  CONSTRAINT [FK_Tire_TireDiameter] FOREIGN KEY([TireDiameterID])
REFERENCES [dbo].[TireDiameter] ([ID])
GO
ALTER TABLE [dbo].[Tire] CHECK CONSTRAINT [FK_Tire_TireDiameter]
GO
ALTER TABLE [dbo].[Tire]  WITH CHECK ADD  CONSTRAINT [FK_Tire_TireWidth] FOREIGN KEY([TireWidthID])
REFERENCES [dbo].[TireWidth] ([ID])
GO
ALTER TABLE [dbo].[Tire] CHECK CONSTRAINT [FK_Tire_TireWidth]
GO
ALTER TABLE [dbo].[TireFileLayout]  WITH CHECK ADD  CONSTRAINT [FK_TireFileLayout_FileType] FOREIGN KEY([FileTypeID])
REFERENCES [dbo].[FileType] ([ID])
GO
ALTER TABLE [dbo].[TireFileLayout] CHECK CONSTRAINT [FK_TireFileLayout_FileType]
GO
ALTER TABLE [dbo].[TireFileLayout]  WITH CHECK ADD  CONSTRAINT [FK_TireFileLayout_TireSupplier] FOREIGN KEY([TireSupplierID])
REFERENCES [dbo].[TireSupplier] ([ID])
GO
ALTER TABLE [dbo].[TireFileLayout] CHECK CONSTRAINT [FK_TireFileLayout_TireSupplier]
GO
ALTER TABLE [dbo].[TireLog]  WITH CHECK ADD  CONSTRAINT [FK_TireLog_LogType] FOREIGN KEY([LogTypeID])
REFERENCES [dbo].[LogType] ([ID])
GO
ALTER TABLE [dbo].[TireLog] CHECK CONSTRAINT [FK_TireLog_LogType]
GO
ALTER TABLE [dbo].[TireLog]  WITH CHECK ADD  CONSTRAINT [FK_TireLog_TireFileLayout] FOREIGN KEY([TireFileLayoutID])
REFERENCES [dbo].[TireFileLayout] ([ID])
GO
ALTER TABLE [dbo].[TireLog] CHECK CONSTRAINT [FK_TireLog_TireFileLayout]
GO
ALTER TABLE [dbo].[TirePrice]  WITH CHECK ADD  CONSTRAINT [FK_TirePrice_EcoValue] FOREIGN KEY([EcoValueID])
REFERENCES [dbo].[EcoValue] ([ID])
GO
ALTER TABLE [dbo].[TirePrice] CHECK CONSTRAINT [FK_TirePrice_EcoValue]
GO
ALTER TABLE [dbo].[TirePrice]  WITH CHECK ADD  CONSTRAINT [FK_TirePrice_Tire] FOREIGN KEY([TireID])
REFERENCES [dbo].[Tire] ([ID])
GO
ALTER TABLE [dbo].[TirePrice] CHECK CONSTRAINT [FK_TirePrice_Tire]
GO
ALTER TABLE [dbo].[TirePrice]  WITH CHECK ADD  CONSTRAINT [FK_TirePrice_TireBrand] FOREIGN KEY([TireBrandID])
REFERENCES [dbo].[TireBrand] ([ID])
GO
ALTER TABLE [dbo].[TirePrice] CHECK CONSTRAINT [FK_TirePrice_TireBrand]
GO
ALTER TABLE [dbo].[TirePrice]  WITH CHECK ADD  CONSTRAINT [FK_TirePrice_TireLoadIndex] FOREIGN KEY([LoadIndexID])
REFERENCES [dbo].[TireLoadIndex] ([ID])
GO
ALTER TABLE [dbo].[TirePrice] CHECK CONSTRAINT [FK_TirePrice_TireLoadIndex]
GO
ALTER TABLE [dbo].[TirePrice]  WITH CHECK ADD  CONSTRAINT [FK_TirePrice_TireSeason] FOREIGN KEY([TireSeasonID])
REFERENCES [dbo].[TireSeason] ([ID])
GO
ALTER TABLE [dbo].[TirePrice] CHECK CONSTRAINT [FK_TirePrice_TireSeason]
GO
ALTER TABLE [dbo].[TirePrice]  WITH CHECK ADD  CONSTRAINT [FK_TirePrice_TireSpeedIndex] FOREIGN KEY([SpeedIndexID])
REFERENCES [dbo].[TireSpeedIndex] ([ID])
GO
ALTER TABLE [dbo].[TirePrice] CHECK CONSTRAINT [FK_TirePrice_TireSpeedIndex]
GO
ALTER TABLE [dbo].[TirePrice]  WITH CHECK ADD  CONSTRAINT [FK_TirePrice_TireSupplier] FOREIGN KEY([TireSupplierID])
REFERENCES [dbo].[TireSupplier] ([ID])
GO
ALTER TABLE [dbo].[TirePrice] CHECK CONSTRAINT [FK_TirePrice_TireSupplier]
GO
USE [master]
GO
ALTER DATABASE [TireDB] SET  READ_WRITE 
GO
