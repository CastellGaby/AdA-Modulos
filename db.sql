USE [master]
GO
/****** Object:  Database [dbAnalisis]    Script Date: 03/14/2016 11:09:16 AM ******/
CREATE DATABASE [dbAnalisis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbAnalisis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbAnalisis.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbAnalisis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbAnalisis_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbAnalisis] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbAnalisis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbAnalisis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbAnalisis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbAnalisis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbAnalisis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbAnalisis] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbAnalisis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbAnalisis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbAnalisis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbAnalisis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbAnalisis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbAnalisis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbAnalisis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbAnalisis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbAnalisis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbAnalisis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbAnalisis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbAnalisis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbAnalisis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbAnalisis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbAnalisis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbAnalisis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbAnalisis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbAnalisis] SET RECOVERY FULL 
GO
ALTER DATABASE [dbAnalisis] SET  MULTI_USER 
GO
ALTER DATABASE [dbAnalisis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbAnalisis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbAnalisis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbAnalisis] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbAnalisis] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbAnalisis', N'ON'
GO
USE [dbAnalisis]
GO
/****** Object:  Table [dbo].[ApplicationClients]    Script Date: 03/14/2016 11:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationClients](
	[Id] [nvarchar](128) NOT NULL,
	[Secret] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ApplicationType] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[RefreshTokenLifeTime] [int] NOT NULL,
	[AllowedOrigin] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.ApplicationClients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AvailableSchedule]    Script Date: 03/14/2016 11:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvailableSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HourId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_AvailableSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 03/14/2016 11:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hour]    Script Date: 03/14/2016 11:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hour](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Hour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Person]    Script Date: 03/14/2016 11:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[SecondName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Role] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 03/14/2016 11:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[Id] [nvarchar](128) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[ClientId] [nvarchar](50) NOT NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL,
	[ProtectedTicket] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 03/14/2016 11:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Section]    Script Date: 03/14/2016 11:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[HourId] [int] NOT NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SectionStudents]    Script Date: 03/14/2016 11:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionStudents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Semester] [int] NOT NULL,
	[Module] [int] NOT NULL,
 CONSTRAINT [PK_SectionStudents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 03/14/2016 11:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[Username] [nvarchar](256) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[Enabled] [bit] NOT NULL CONSTRAINT [DF_User_Enable]  DEFAULT ((1)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 03/14/2016 11:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_Role]  DEFAULT ((0)) FOR [Role]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_User_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[AvailableSchedule]  WITH CHECK ADD  CONSTRAINT [FK_AvailableSchedule_Hour] FOREIGN KEY([HourId])
REFERENCES [dbo].[Hour] ([Id])
GO
ALTER TABLE [dbo].[AvailableSchedule] CHECK CONSTRAINT [FK_AvailableSchedule_Hour]
GO
ALTER TABLE [dbo].[AvailableSchedule]  WITH CHECK ADD  CONSTRAINT [FK_AvailableSchedule_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[AvailableSchedule] CHECK CONSTRAINT [FK_AvailableSchedule_Person]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Class]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Hour] FOREIGN KEY([HourId])
REFERENCES [dbo].[Hour] ([Id])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Hour]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Person] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Person]
GO
ALTER TABLE [dbo].[SectionStudents]  WITH CHECK ADD  CONSTRAINT [FK_SectionStudents_Person] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[SectionStudents] CHECK CONSTRAINT [FK_SectionStudents_Person]
GO
ALTER TABLE [dbo].[SectionStudents]  WITH CHECK ADD  CONSTRAINT [FK_SectionStudents_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([Id])
GO
ALTER TABLE [dbo].[SectionStudents] CHECK CONSTRAINT [FK_SectionStudents_Section]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Role]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_User]
GO
USE [master]
GO
ALTER DATABASE [dbAnalisis] SET  READ_WRITE 
GO
