USE [master]
GO
/****** Object:  Database [FitCard]    Script Date: 27/03/2017 04:26:10 ******/
CREATE DATABASE [FitCard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FitCard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\FitCard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FitCard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\FitCard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FitCard] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FitCard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FitCard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FitCard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FitCard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FitCard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FitCard] SET ARITHABORT OFF 
GO
ALTER DATABASE [FitCard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FitCard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FitCard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FitCard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FitCard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FitCard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FitCard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FitCard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FitCard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FitCard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FitCard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FitCard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FitCard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FitCard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FitCard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FitCard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FitCard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FitCard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FitCard] SET  MULTI_USER 
GO
ALTER DATABASE [FitCard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FitCard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FitCard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FitCard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FitCard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FitCard] SET QUERY_STORE = OFF
GO
USE [FitCard]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FitCard]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 27/03/2017 04:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[CAT_ID] [int] IDENTITY(1,1) NOT NULL,
	[CAT_NOME] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CAT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ESTABELECIMENTO]    Script Date: 27/03/2017 04:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTABELECIMENTO](
	[EST_ID] [int] IDENTITY(1,1) NOT NULL,
	[EST_NOME] [varchar](255) NULL,
	[EST_NOME_FANTASIA] [varchar](500) NULL,
	[EST_CNPJ] [int] NULL,
	[EST_EMAIL] [varchar](255) NULL,
	[EST_TELEFONE] [int] NULL,
	[CAT_ID] [int] NULL,
	[EST_STATUS] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[EST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ESTABELECIMENTO]  WITH CHECK ADD  CONSTRAINT [FK_CAT_ID] FOREIGN KEY([CAT_ID])
REFERENCES [dbo].[CATEGORIA] ([CAT_ID])
GO
ALTER TABLE [dbo].[ESTABELECIMENTO] CHECK CONSTRAINT [FK_CAT_ID]
GO
USE [master]
GO
ALTER DATABASE [FitCard] SET  READ_WRITE 
GO
