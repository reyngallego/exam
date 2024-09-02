USE [master]
GO
/****** Object:  Database [RecyclingDB]    Script Date: 9/3/2024 12:37:57 AM ******/
CREATE DATABASE [RecyclingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RecyclingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RecyclingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RecyclingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RecyclingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RecyclingDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RecyclingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RecyclingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RecyclingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RecyclingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RecyclingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RecyclingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RecyclingDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RecyclingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RecyclingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RecyclingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RecyclingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RecyclingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RecyclingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RecyclingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RecyclingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RecyclingDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RecyclingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RecyclingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RecyclingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RecyclingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RecyclingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RecyclingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RecyclingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RecyclingDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RecyclingDB] SET  MULTI_USER 
GO
ALTER DATABASE [RecyclingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RecyclingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RecyclingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RecyclingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RecyclingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RecyclingDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RecyclingDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [RecyclingDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RecyclingDB]
GO
/****** Object:  Table [dbo].[RecyclableItem]    Script Date: 9/3/2024 12:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecyclableItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecyclableTypeId] [int] NULL,
	[Weight] [decimal](18, 2) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[ComputedRate]  AS ([Rate]*[Weight]),
	[ItemDescription] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecyclableType]    Script Date: 9/3/2024 12:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecyclableType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[MinKg] [decimal](18, 2) NOT NULL,
	[MaxKg] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecyclableItem]  WITH CHECK ADD FOREIGN KEY([RecyclableTypeId])
REFERENCES [dbo].[RecyclableType] ([Id])
GO
USE [master]
GO
ALTER DATABASE [RecyclingDB] SET  READ_WRITE 
GO
