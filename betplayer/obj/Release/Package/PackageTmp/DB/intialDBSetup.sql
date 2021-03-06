USE [master]
GO
/****** Object:  Database [BetPlayer]    Script Date: 08-Mar-18 9:00:59 PM ******/
CREATE DATABASE [BetPlayer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BetPlayer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BetPlayer.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BetPlayer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BetPlayer_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BetPlayer] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BetPlayer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BetPlayer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BetPlayer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BetPlayer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BetPlayer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BetPlayer] SET ARITHABORT OFF 
GO
ALTER DATABASE [BetPlayer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BetPlayer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BetPlayer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BetPlayer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BetPlayer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BetPlayer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BetPlayer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BetPlayer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BetPlayer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BetPlayer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BetPlayer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BetPlayer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BetPlayer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BetPlayer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BetPlayer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BetPlayer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BetPlayer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BetPlayer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BetPlayer] SET  MULTI_USER 
GO
ALTER DATABASE [BetPlayer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BetPlayer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BetPlayer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BetPlayer] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BetPlayer]
GO
/****** Object:  Table [dbo].[ClientMaster]    Script Date: 08-Mar-18 9:01:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientMaster](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Contact_No] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Client_limit] [varchar](50) NULL,
	[Agent_limit] [varchar](50) NULL,
	[Agent_Share] [varchar](50) NULL,
	[Client_Share] [varchar](50) NULL,
	[Session_Commision_Type] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_ClientMaster] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CollectionMaster]    Script Date: 08-Mar-18 9:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CollectionMaster](
	[CollectionID] [int] NULL,
	[Name] [varchar](50) NULL,
	[AccountNo] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[ContactNo] [varchar](50) NULL,
	[GroupName] [varchar](50) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClientMaster] ON 

INSERT [dbo].[ClientMaster] ([ClientID], [Name], [Contact_No], [Password], [Client_limit], [Agent_limit], [Agent_Share], [Client_Share], [Session_Commision_Type], [Status]) VALUES (1, N'shubham agrawal', N'8319058205', N'50', N'50', N'50', N'50', N'50', N'No Commission', N'active')
INSERT [dbo].[ClientMaster] ([ClientID], [Name], [Contact_No], [Password], [Client_limit], [Agent_limit], [Agent_Share], [Client_Share], [Session_Commision_Type], [Status]) VALUES (2, N'lokesh', N'9074521930', N'515', N'50', N'50', N'50', N'50', N'No Commission', N'active')
INSERT [dbo].[ClientMaster] ([ClientID], [Name], [Contact_No], [Password], [Client_limit], [Agent_limit], [Agent_Share], [Client_Share], [Session_Commision_Type], [Status]) VALUES (3, N'Lala', N'8484888888', N'888', N'850', N'55', N'05', N'5', N'Bet By Bet', N'active')
INSERT [dbo].[ClientMaster] ([ClientID], [Name], [Contact_No], [Password], [Client_limit], [Agent_limit], [Agent_Share], [Client_Share], [Session_Commision_Type], [Status]) VALUES (4, N'Poonam agrawal', N'9039687526', N'44', N'50', N'50', N'50', N'50', N'No Commission', N'inactive')
INSERT [dbo].[ClientMaster] ([ClientID], [Name], [Contact_No], [Password], [Client_limit], [Agent_limit], [Agent_Share], [Client_Share], [Session_Commision_Type], [Status]) VALUES (5, N'shubham agrawal', N'8319058205', N'smYl9hO8', N'2.0', N'', N'', N'', N'No Commission', N'active')
INSERT [dbo].[ClientMaster] ([ClientID], [Name], [Contact_No], [Password], [Client_limit], [Agent_limit], [Agent_Share], [Client_Share], [Session_Commision_Type], [Status]) VALUES (6, N'Lokesh', N'9074521930', N'77SdzGFm', N'2.6', N'', N'50.00', N'0', N'No Commission', N'active')
INSERT [dbo].[ClientMaster] ([ClientID], [Name], [Contact_No], [Password], [Client_limit], [Agent_limit], [Agent_Share], [Client_Share], [Session_Commision_Type], [Status]) VALUES (7, N'lala', N'56584561', N'ZbBT0AEXD', N'0.0', N'', N'50.00', N'0.', N'No Commission', N'active')
SET IDENTITY_INSERT [dbo].[ClientMaster] OFF
USE [master]
GO
ALTER DATABASE [BetPlayer] SET  READ_WRITE 
GO
