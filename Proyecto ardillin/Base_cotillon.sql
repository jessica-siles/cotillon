USE [master]
GO
/****** Object:  Database [Base_Cotillon]    Script Date: 16/11/2020 17:19:33 ******/
CREATE DATABASE [Base_Cotillon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Base_Cotillon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL14\MSSQL\DATA\Base_Cotillon.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Base_Cotillon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL14\MSSQL\DATA\Base_Cotillon_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Base_Cotillon] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Base_Cotillon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Base_Cotillon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Base_Cotillon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Base_Cotillon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Base_Cotillon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Base_Cotillon] SET ARITHABORT OFF 
GO
ALTER DATABASE [Base_Cotillon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Base_Cotillon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Base_Cotillon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Base_Cotillon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Base_Cotillon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Base_Cotillon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Base_Cotillon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Base_Cotillon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Base_Cotillon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Base_Cotillon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Base_Cotillon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Base_Cotillon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Base_Cotillon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Base_Cotillon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Base_Cotillon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Base_Cotillon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Base_Cotillon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Base_Cotillon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Base_Cotillon] SET  MULTI_USER 
GO
ALTER DATABASE [Base_Cotillon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Base_Cotillon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Base_Cotillon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Base_Cotillon] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Base_Cotillon] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Base_Cotillon]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 16/11/2020 17:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulos](
	[id_articulo] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio_Unitario] [money] NOT NULL,
	[cantidad_Pack] [int] NOT NULL,
	[foto] [image] NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 16/11/2020 17:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[id_pedido] [int] NOT NULL,
	[calle] [nvarchar](150) NOT NULL,
	[localidad] [varchar](150) NOT NULL,
	[provincia] [varchar](150) NOT NULL,
	[telefono] [numeric](18, 0) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 16/11/2020 17:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedidos](
	[id_pedido] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_total] [money] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 16/11/2020 17:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](50) NOT NULL,
	[contraseña] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Pedidos] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[Pedidos] ([id_pedido])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Pedidos]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Clientes]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Pedidos] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulos] ([id_articulo])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Pedidos]
GO
USE [master]
GO
ALTER DATABASE [Base_Cotillon] SET  READ_WRITE 
GO
