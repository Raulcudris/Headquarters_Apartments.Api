USE [master]
GO
/****** Object:  Database [Prueba_MainSoft]    Script Date: 24/03/2022 8:58:27 a. m. ******/
CREATE DATABASE [Prueba_MainSoft]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prueba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prueba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prueba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prueba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Prueba_MainSoft] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prueba_MainSoft].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prueba_MainSoft] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prueba_MainSoft] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prueba_MainSoft] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Prueba_MainSoft] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prueba_MainSoft] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET RECOVERY FULL 
GO
ALTER DATABASE [Prueba_MainSoft] SET  MULTI_USER 
GO
ALTER DATABASE [Prueba_MainSoft] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prueba_MainSoft] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prueba_MainSoft] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prueba_MainSoft] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prueba_MainSoft] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prueba_MainSoft] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Prueba_MainSoft', N'ON'
GO
ALTER DATABASE [Prueba_MainSoft] SET QUERY_STORE = OFF
GO
USE [Prueba_MainSoft]
GO
/****** Object:  Table [dbo].[Alojamiento]    Script Date: 24/03/2022 8:58:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alojamiento](
	[Id_Alo] [varchar](50) NOT NULL,
	[Id_Sede] [varchar](50) NOT NULL,
	[Tipo_Alojamiento] [varchar](50) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Numeracion] [varchar](50) NOT NULL,
	[Numero_Habitacion] [int] NOT NULL,
	[Capacidad] [int] NOT NULL,
	[Id_LTO] [varchar](50) NOT NULL,
	[Id_LTE] [varchar](50) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[Servicios] [varchar](50) NULL,
 CONSTRAINT [PK_ALOJAMIENTOS] PRIMARY KEY CLUSTERED 
(
	[Id_Alo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Habitacion]    Script Date: 24/03/2022 8:58:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Habitacion](
	[Id_Estado] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estado_Habitacion] PRIMARY KEY CLUSTERED 
(
	[Id_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Liquidacion_Tarifa_Extra]    Script Date: 24/03/2022 8:58:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Liquidacion_Tarifa_Extra](
	[Id_LTE] [varchar](50) NOT NULL,
	[Tipo_Tarifa] [varchar](50) NOT NULL,
	[Sede] [varchar](50) NOT NULL,
	[Numeracion] [varchar](50) NOT NULL,
	[Temporada] [varchar](50) NOT NULL,
	[Persona] [int] NOT NULL,
	[Valor_Persona] [float] NOT NULL,
 CONSTRAINT [PK_Liquidacion_Tarifa_Extra] PRIMARY KEY CLUSTERED 
(
	[Id_LTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Liquidacion_Tarifa_Ordinaria]    Script Date: 24/03/2022 8:58:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Liquidacion_Tarifa_Ordinaria](
	[Id_LTO] [varchar](50) NOT NULL,
	[Tipo_Tarifa] [varchar](50) NOT NULL,
	[Sede] [varchar](50) NOT NULL,
	[Numeracion] [varchar](50) NOT NULL,
	[Temporada] [varchar](50) NOT NULL,
	[Rango_Personas] [int] NOT NULL,
	[Valor] [float] NOT NULL,
 CONSTRAINT [PK_Liquidacion_Tarifa_Ordinaria] PRIMARY KEY CLUSTERED 
(
	[Id_LTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Otros_Servicios]    Script Date: 24/03/2022 8:58:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Otros_Servicios](
	[Id_OTS] [varchar](50) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Valor] [float] NULL,
 CONSTRAINT [PK_OTROS_SERVICIOS] PRIMARY KEY CLUSTERED 
(
	[Id_OTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 24/03/2022 8:58:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[Id_Reserva] [varchar](50) NOT NULL,
	[Id_Sede] [varchar](50) NOT NULL,
	[Fecha_Inicial] [date] NOT NULL,
	[Fecha_Final] [date] NOT NULL,
	[Num_Personas] [int] NOT NULL,
	[Num_Habitaciones] [int] NOT NULL,
	[Valor_Reserva] [float] NOT NULL,
	[Estado_Reserva] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[Id_Reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sedes]    Script Date: 24/03/2022 8:58:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sedes](
	[Id_Sede] [varchar](50) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Ubicación] [varchar](50) NOT NULL,
	[Capacidad] [int] NOT NULL,
 CONSTRAINT [PK_SEDES] PRIMARY KEY CLUSTERED 
(
	[Id_Sede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temporadas]    Script Date: 24/03/2022 8:58:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temporadas](
	[Id_Temporada] [varchar](50) NOT NULL,
	[Fecha_Inicial] [date] NOT NULL,
	[Fecha_Final] [date] NOT NULL,
	[Tipo_Temporada] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Temporadas] PRIMARY KEY CLUSTERED 
(
	[Id_Temporada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Alojamiento]    Script Date: 24/03/2022 8:58:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Alojamiento](
	[Id_TA] [varchar](50) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Tipo_Alojamiento] PRIMARY KEY CLUSTERED 
(
	[Id_TA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 24/03/2022 8:58:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Documento] [varchar](50) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Fecha_Nacimiento] [date] NOT NULL,
	[Celular] [varchar](50) NOT NULL,
	[Correo_Electronico] [varchar](250) NOT NULL,
	[Departamento] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
	[Barrio] [varchar](250) NOT NULL,
	[Direccion] [varchar](250) NOT NULL,
	[Telefono_Fijo] [varchar](50) NULL,
	[Clave] [varchar](250) NOT NULL,
	[Confirmar_Clave] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Numero_Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Alojamiento] ([Id_Alo], [Id_Sede], [Tipo_Alojamiento], [Descripcion], [Numeracion], [Numero_Habitacion], [Capacidad], [Id_LTO], [Id_LTE], [Estado], [Servicios]) VALUES (N'ALO001
', N'SED001
', N'TA02', N'la alcoba tiene una cama doble y un camarote, baño, nevera, televisor y terraza cubierta.
', N'Habitacion 1
', 1, 4, N'LTO001', N'LTE001', N'ES001', N'OS008')
INSERT [dbo].[Alojamiento] ([Id_Alo], [Id_Sede], [Tipo_Alojamiento], [Descripcion], [Numeracion], [Numero_Habitacion], [Capacidad], [Id_LTO], [Id_LTE], [Estado], [Servicios]) VALUES (N'ALO002
', N'SED001
', N'TA02', N'la alcoba tiene una cama doble y un camarote, baño, nevera, televisor y terraza cubierta.', N'Habitacion 2
', 1, 4, N'LTO002', N'LTE002', N'ES001', N'OS008')
INSERT [dbo].[Alojamiento] ([Id_Alo], [Id_Sede], [Tipo_Alojamiento], [Descripcion], [Numeracion], [Numero_Habitacion], [Capacidad], [Id_LTO], [Id_LTE], [Estado], [Servicios]) VALUES (N'ALO003', N'SED001
', N'TA01', N'la alcoba tiene una cama doble y un camarote, baño, nevera, televisor y terraza cubierta.', N'Habitacion 3
', 1, 4, N'LTO003', N'LTE003', N'ES001', N'OS009')
INSERT [dbo].[Alojamiento] ([Id_Alo], [Id_Sede], [Tipo_Alojamiento], [Descripcion], [Numeracion], [Numero_Habitacion], [Capacidad], [Id_LTO], [Id_LTE], [Estado], [Servicios]) VALUES (N'ALO004', N'SED001', N'TA01', N'la alcoba tiene una cama doble y un camarote, baño, nevera, televisor y terraza cubierta.', N'Habitacion 4
', 1, 4, N'LTO004', N'LTE004', N'ES001', N'OS009')
INSERT [dbo].[Alojamiento] ([Id_Alo], [Id_Sede], [Tipo_Alojamiento], [Descripcion], [Numeracion], [Numero_Habitacion], [Capacidad], [Id_LTO], [Id_LTE], [Estado], [Servicios]) VALUES (N'ALO005', N'SED001', N'TA01', N'la alcoba tiene una cama doble y un camarote, baño, nevera, televisor y terraza cubierta', N'Habitacion 5', 1, 4, N'LTO005', N'LTE005', N'ES001', N'OS009')
INSERT [dbo].[Alojamiento] ([Id_Alo], [Id_Sede], [Tipo_Alojamiento], [Descripcion], [Numeracion], [Numero_Habitacion], [Capacidad], [Id_LTO], [Id_LTE], [Estado], [Servicios]) VALUES (N'ALO006', N'SED001', N'TA01', N'la alcoba tiene una cama doble y un camarote, baño, nevera, televisor y terraza cubierta.', N'Habitacion 6', 1, 4, N'LTO006', N'LTE006', N'ES001', N'OS009')
INSERT [dbo].[Alojamiento] ([Id_Alo], [Id_Sede], [Tipo_Alojamiento], [Descripcion], [Numeracion], [Numero_Habitacion], [Capacidad], [Id_LTO], [Id_LTE], [Estado], [Servicios]) VALUES (N'ALO007', N'SED001', N'TA01', N'la alcoba tiene una cama doble y un camarote, baño, nevera, televisor y terraza cubierta.', N'Habitacion 7
', 1, 4, N'LTO007', N'LTE007', N'ES001', N'OS009')
INSERT [dbo].[Alojamiento] ([Id_Alo], [Id_Sede], [Tipo_Alojamiento], [Descripcion], [Numeracion], [Numero_Habitacion], [Capacidad], [Id_LTO], [Id_LTE], [Estado], [Servicios]) VALUES (N'ALO008', N'SED001', N'TA01', N'la alcoba tiene una cama doble y un camarote, baño, nevera, televisor y terraza cubierta.', N'Habitacion 8
', 1, 4, N'LTO008', N'LTE008', N'ES001', N'OS009')
GO
INSERT [dbo].[Estado_Habitacion] ([Id_Estado], [Descripcion]) VALUES (N'ES001', N'Buen estado')
INSERT [dbo].[Estado_Habitacion] ([Id_Estado], [Descripcion]) VALUES (N'ES002', N'Mal estado')
INSERT [dbo].[Estado_Habitacion] ([Id_Estado], [Descripcion]) VALUES (N'ES003', N'Mantenimiento')
INSERT [dbo].[Estado_Habitacion] ([Id_Estado], [Descripcion]) VALUES (N'ES004', N'Otros')
GO
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE001', N'Tarifa Extra', N'SED001', N'Habitacion 1', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE002', N'Tarifa Extra', N'SED001', N'Habitacion 2', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE003', N'Tarifa Extra', N'SED001', N'Habitacion 3', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE004', N'Tarifa Extra', N'SED001', N'Habitacion 4', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE005', N'Tarifa Extra', N'SED001', N'Habitacion 5', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE006', N'Tarifa Extra', N'SED001', N'Habitacion 6', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE007', N'Tarifa Extra', N'SED001', N'Habitacion 7', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE008', N'Tarifa Extra', N'SED001', N'Habitacion 8', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE009', N'Tarifa Extra', N'SED002', N'Numero 3', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE010', N'Tarifa Extra', N'SED002', N'Cabaña 5', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE011', N'Tarifa Extra', N'SED002', N'Cabaña 6', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE012', N'Tarifa Extra', N'SED002', N'Cabaña 7', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE013', N'Tarifa Extra', N'SED002', N'Cabaña 8', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE014', N'Tarifa Extra', N'SED003', N'Numero 4', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE015', N'Tarifa Extra', N'SED003', N'Alojamiento 5', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE016', N'Tarifa Extra', N'SED003', N'Alojamiento 6', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE017', N'Tarifa Extra', N'SED004', N'Numero 1', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE018', N'Tarifa Extra', N'SED004', N'Numero 2', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE019', N'Tarifa Extra', N'SED004', N'Numero 3', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE020', N'Tarifa Extra', N'SED004', N'Numero 4', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE021', N'Tarifa Extra', N'SED005', N'Cabaña 5', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE022', N'Tarifa Extra', N'SED005', N'Cabaña 6', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE023', N'Tarifa Extra', N'SED005', N'Cabaña 7', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE024', N'Tarifa Extra', N'SED005', N'Cabaña 8', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE025', N'Tarifa Extra', N'SED006', N'Habitacion 1', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE026', N'Tarifa Extra', N'SED006', N'Habitacion 2', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE027', N'Tarifa Extra', N'SED006', N'Habitacion 3', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE028', N'Tarifa Extra', N'SED006', N'Habitacion 4', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE029', N'Tarifa Extra', N'SED006', N'Habitacion 5', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE030', N'Tarifa Extra', N'SED006', N'Habitacion 6', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE031', N'Tarifa Extra', N'SED006', N'Habitacion 7', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE032', N'Tarifa Extra', N'SED006', N'Habitacion 8', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE033', N'Tarifa Extra', N'SED007', N'Habitacion 1', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE034', N'Tarifa Extra', N'SED007', N'Habitacion 2', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE035', N'Tarifa Extra', N'SED007', N'Habitacion 3', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE036', N'Tarifa Extra', N'SED007', N'Habitacion 4', N'TE002', 1, 16000)
INSERT [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Persona], [Valor_Persona]) VALUES (N'LTE037', N'Tarifa Extra', N'SED007', N'Habitacion 5', N'TE002', 1, 16000)
GO
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO001', N'Tarifa Ordinaria', N'SED001', N'Habitacion 1', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO002', N'Tarifa Ordinaria', N'SED001', N'Habitacion 2', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO003', N'Tarifa Ordinaria', N'SED001', N'Habitacion 3', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO004', N'Tarifa Ordinaria', N'SED001', N'Habitacion 4', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO005', N'Tarifa Ordinaria', N'SED001', N'Habitacion 5', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO006', N'Tarifa Ordinaria', N'SED001', N'Habitacion 6', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO007', N'Tarifa Ordinaria', N'SED001', N'Habitacion 7', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO008', N'Tarifa Ordinaria', N'SED001', N'Habitacion 8', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO009', N'Tarifa Ordinaria', N'SED002', N'Numero 3', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO010', N'Tarifa Ordinaria', N'SED002', N'Cabaña 5', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO011', N'Tarifa Ordinaria', N'SED002', N'Cabaña 6', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO012', N'Tarifa Ordinaria', N'SED002', N'Cabaña 7', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO013', N'Tarifa Ordinaria', N'SED002', N'Cabaña 8', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO014', N'Tarifa Ordinaria', N'SED003', N'Numero 4', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO015', N'Tarifa Ordinaria', N'SED003', N' Alojamiento 5 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO016', N'Tarifa Ordinaria', N'SED003', N' Alojamiento 6 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO017', N'Tarifa Ordinaria', N'SED004', N' Numero 1 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO018', N'Tarifa Ordinaria', N'SED004', N' Numero 2 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO019', N'Tarifa Ordinaria', N'SED004', N' Numero 3 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO020', N'Tarifa Ordinaria', N'SED004', N' Numero 4 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO021', N'Tarifa Ordinaria', N'SED005', N' Cabaña 5 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO022', N'Tarifa Ordinaria', N'SED005', N' Cabaña 6 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO023', N'Tarifa Ordinaria', N'SED005', N' Cabaña 7 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO024', N'Tarifa Ordinaria', N'SED005', N' Cabaña 8 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO025', N'Tarifa Ordinaria', N'SED006', N' Habitacion 1 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO026', N'Tarifa Ordinaria', N'SED006', N' Habitacion 2 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO027', N'Tarifa Ordinaria', N'SED006', N' Habitacion 3 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO028', N'Tarifa Ordinaria', N'SED006', N' Habitacion 4 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO029', N'Tarifa Ordinaria', N'SED006', N' Habitacion 5 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO030', N'Tarifa Ordinaria', N'SED006', N' Habitacion 6 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO031', N'Tarifa Ordinaria', N'SED006', N' Habitacion 7 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO032', N'Tarifa Ordinaria', N'SED006', N' Habitacion 8 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO033', N'Tarifa Ordinaria', N'SED007', N' Habitacion 1 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO034', N'Tarifa Ordinaria', N'SED007', N' Habitacion 2 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO035', N'Tarifa Ordinaria', N'SED007', N' Habitacion 3 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO036', N'Tarifa Ordinaria', N'SED007', N' Habitacion 4 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO037', N'Tarifa Ordinaria', N'SED007', N' Habitacion 5 ', N'TE002', 4, 70000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO038', N'Tarifa Ordinaria', N'SED002', N' Numero 1 ', N'TE002', 4, 90000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO039', N'Tarifa Ordinaria', N'SED002', N' Numero 2 ', N'TE002', 4, 90000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO040', N'Tarifa Ordinaria', N'SED002', N' Numero 4 ', N'TE002', 4, 90000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO041', N'Tarifa Ordinaria', N'SED003', N' Numero 1 ', N'TE002', 4, 90000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO042', N'Tarifa Ordinaria', N'SED003', N' Numero 2 ', N'TE002', 4, 90000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO043', N'Tarifa Ordinaria', N'SED003', N' Alojamiento 5 ', N'TE002', 4, 90000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO044', N'Tarifa Ordinaria', N'SED003', N' Alojamiento 6 ', N'TE002', 4, 90000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO045', N'Tarifa Ordinaria', N'SED004', N' Numero 4 ', N'TE002', 4, 90000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO046', N'Tarifa Ordinaria', N'SED008', N'Apartamento 301', N'TE002', 4, 90000)
INSERT [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO], [Tipo_Tarifa], [Sede], [Numeracion], [Temporada], [Rango_Personas], [Valor]) VALUES (N'LTO047', N'Tarifa Ordinaria', N'SED008', N'Apartamento 401', N'TE002', 4, 90000)
GO
INSERT [dbo].[Otros_Servicios] ([Id_OTS], [Descripcion], [Valor]) VALUES (N'OS001', N'Salas de música y video, lectura', 0)
INSERT [dbo].[Otros_Servicios] ([Id_OTS], [Descripcion], [Valor]) VALUES (N'OS002', N'Cafetería y sala socia', 0)
INSERT [dbo].[Otros_Servicios] ([Id_OTS], [Descripcion], [Valor]) VALUES (N'OS003', N'Billar y juegos de mesa', 0)
INSERT [dbo].[Otros_Servicios] ([Id_OTS], [Descripcion], [Valor]) VALUES (N'OS004', N'Gimnasio sala de masajes', 0)
INSERT [dbo].[Otros_Servicios] ([Id_OTS], [Descripcion], [Valor]) VALUES (N'OS005', N'Zona húmeda: Baño turco, sauna, jacuzzi, baños y vestieres', 0)
INSERT [dbo].[Otros_Servicios] ([Id_OTS], [Descripcion], [Valor]) VALUES (N'OS006', N'Ejercicios: Bicicleta estática, Aerobicos, Pilates Y Rumba tropical (Lunes a viernes 5:30 a 6:30 p.m.)', 0)
INSERT [dbo].[Otros_Servicios] ([Id_OTS], [Descripcion], [Valor]) VALUES (N'OS007', N'Cuenta con 4 habitaciones para alojamiento de los asociados.', 0)
INSERT [dbo].[Otros_Servicios] ([Id_OTS], [Descripcion], [Valor]) VALUES (N'OS008', N'Servicios Lavanderia', 18000)
INSERT [dbo].[Otros_Servicios] ([Id_OTS], [Descripcion], [Valor]) VALUES (N'OS009', N'Ningun Servicio', 0)
GO
INSERT [dbo].[Reserva] ([Id_Reserva], [Id_Sede], [Fecha_Inicial], [Fecha_Final], [Num_Personas], [Num_Habitaciones], [Valor_Reserva], [Estado_Reserva]) VALUES (N'R001', N'SED001', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date), 5, 6, 5000, N'pRUEBA')
GO
INSERT [dbo].[Sedes] ([Id_Sede], [Nombre], [Tipo], [Ubicación], [Capacidad]) VALUES (N'SED001', N' Villeta', N' Recreativa', N'Cundinamarca', 32)
INSERT [dbo].[Sedes] ([Id_Sede], [Nombre], [Tipo], [Ubicación], [Capacidad]) VALUES (N'SED002', N'El placer ', N' Recreativa', N'Fusagasugá', 34)
INSERT [dbo].[Sedes] ([Id_Sede], [Nombre], [Tipo], [Ubicación], [Capacidad]) VALUES (N'SED003', N'Gonzalo Morante ', N' Recreativa', N'Chinchiná', 30)
INSERT [dbo].[Sedes] ([Id_Sede], [Nombre], [Tipo], [Ubicación], [Capacidad]) VALUES (N'SED004', N'Tablones', N' Recreativa', N'Palmira', 24)
INSERT [dbo].[Sedes] ([Id_Sede], [Nombre], [Tipo], [Ubicación], [Capacidad]) VALUES (N'SED005', N'Manguruma', N' Recreativa', N'Santa fe de Antioquia ', 46)
INSERT [dbo].[Sedes] ([Id_Sede], [Nombre], [Tipo], [Ubicación], [Capacidad]) VALUES (N'SED006', N'Federman ', N' Recreativa', N'Bogotá', 46)
INSERT [dbo].[Sedes] ([Id_Sede], [Nombre], [Tipo], [Ubicación], [Capacidad]) VALUES (N'SED007
', N'Suramericana', N'Apartamento', N'Medellín', 9)
INSERT [dbo].[Sedes] ([Id_Sede], [Nombre], [Tipo], [Ubicación], [Capacidad]) VALUES (N'SED008', N'El Rodadero', N'Apartamento', N'Santa Marta', 20)
GO
INSERT [dbo].[Temporadas] ([Id_Temporada], [Fecha_Inicial], [Fecha_Final], [Tipo_Temporada]) VALUES (N'TE001', CAST(N'2021-12-01' AS Date), CAST(N'2022-03-30' AS Date), N'ALTA')
INSERT [dbo].[Temporadas] ([Id_Temporada], [Fecha_Inicial], [Fecha_Final], [Tipo_Temporada]) VALUES (N'TE002', CAST(N'2022-04-01' AS Date), CAST(N'2022-06-30' AS Date), N'BAJA')
INSERT [dbo].[Temporadas] ([Id_Temporada], [Fecha_Inicial], [Fecha_Final], [Tipo_Temporada]) VALUES (N'TE003', CAST(N'2022-07-01' AS Date), CAST(N'2022-08-30' AS Date), N'ALTA')
INSERT [dbo].[Temporadas] ([Id_Temporada], [Fecha_Inicial], [Fecha_Final], [Tipo_Temporada]) VALUES (N'TE004', CAST(N'2022-09-01' AS Date), CAST(N'2022-11-30' AS Date), N'BAJA
')
INSERT [dbo].[Temporadas] ([Id_Temporada], [Fecha_Inicial], [Fecha_Final], [Tipo_Temporada]) VALUES (N'TE005', CAST(N'2022-01-01' AS Date), CAST(N'2022-12-12' AS Date), N'NA')
GO
INSERT [dbo].[Tipo_Alojamiento] ([Id_TA], [Descripcion]) VALUES (N'TA01', N'APARTAMENTO')
INSERT [dbo].[Tipo_Alojamiento] ([Id_TA], [Descripcion]) VALUES (N'TA02', N'HABITACION')
INSERT [dbo].[Tipo_Alojamiento] ([Id_TA], [Descripcion]) VALUES (N'TA03', N'CASA')
INSERT [dbo].[Tipo_Alojamiento] ([Id_TA], [Descripcion]) VALUES (N'TA04', N'KIOSCO')
INSERT [dbo].[Tipo_Alojamiento] ([Id_TA], [Descripcion]) VALUES (N'TA05', N'CABAÑA')
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Numero_Documento], [Nombre], [Fecha_Nacimiento], [Celular], [Correo_Electronico], [Departamento], [Municipio], [Barrio], [Direccion], [Telefono_Fijo], [Clave], [Confirmar_Clave]) VALUES (3, N'1065808524', N'Raul Cudris  Sinning', CAST(N'1994-06-24' AS Date), N'3006338759', N'RaulCudriz@hotmail.com', N'Cesar', N'Valledupar', N'Los Fundadores', N'Diag 18b 25 A 55', N'5847394', N'21232f297a57a5a743894a0e4a801fc3', N'21232f297a57a5a743894a0e4a801fc3')
INSERT [dbo].[Usuario] ([Id], [Numero_Documento], [Nombre], [Fecha_Nacimiento], [Celular], [Correo_Electronico], [Departamento], [Municipio], [Barrio], [Direccion], [Telefono_Fijo], [Clave], [Confirmar_Clave]) VALUES (4, N'1065808698', N'Jorge Luis Garcia', CAST(N'1980-06-20' AS Date), N'3216337759', N'JorgeGarcia@hotmail.com', N'Cesar', N'Codazi', N'Los Angeles', N'calle 18b 25 A 33', N'5787394', N'21232f297a57a5a743894a0e4a801fc3', N'21232f297a57a5a743894a0e4a801fc3')
INSERT [dbo].[Usuario] ([Id], [Numero_Documento], [Nombre], [Fecha_Nacimiento], [Celular], [Correo_Electronico], [Departamento], [Municipio], [Barrio], [Direccion], [Telefono_Fijo], [Clave], [Confirmar_Clave]) VALUES (2, N'789566552', N'Angie Paredes Sierra', CAST(N'1990-07-30' AS Date), N'3105689696', N'angiesierra@hotmail.com', N'Magdalena', N'Dificil', N'El progreso', N'Calle 15c 56-96', N'5886968', N'21232f297a57a5a743894a0e4a801fc3', N'21232f297a57a5a743894a0e4a801fc3')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Alojamiento]  WITH CHECK ADD  CONSTRAINT [FK_Alojamiento_Estado_Habitacion] FOREIGN KEY([Estado])
REFERENCES [dbo].[Estado_Habitacion] ([Id_Estado])
GO
ALTER TABLE [dbo].[Alojamiento] CHECK CONSTRAINT [FK_Alojamiento_Estado_Habitacion]
GO
ALTER TABLE [dbo].[Alojamiento]  WITH CHECK ADD  CONSTRAINT [FK_Alojamiento_Liquidacion_Tarifa_Extra1] FOREIGN KEY([Id_LTE])
REFERENCES [dbo].[Liquidacion_Tarifa_Extra] ([Id_LTE])
GO
ALTER TABLE [dbo].[Alojamiento] CHECK CONSTRAINT [FK_Alojamiento_Liquidacion_Tarifa_Extra1]
GO
ALTER TABLE [dbo].[Alojamiento]  WITH CHECK ADD  CONSTRAINT [FK_Alojamiento_Liquidacion_Tarifa_Ordinaria1] FOREIGN KEY([Id_LTO])
REFERENCES [dbo].[Liquidacion_Tarifa_Ordinaria] ([Id_LTO])
GO
ALTER TABLE [dbo].[Alojamiento] CHECK CONSTRAINT [FK_Alojamiento_Liquidacion_Tarifa_Ordinaria1]
GO
ALTER TABLE [dbo].[Alojamiento]  WITH CHECK ADD  CONSTRAINT [FK_Alojamiento_Otros_Servicios] FOREIGN KEY([Servicios])
REFERENCES [dbo].[Otros_Servicios] ([Id_OTS])
GO
ALTER TABLE [dbo].[Alojamiento] CHECK CONSTRAINT [FK_Alojamiento_Otros_Servicios]
GO
ALTER TABLE [dbo].[Alojamiento]  WITH CHECK ADD  CONSTRAINT [FK_Alojamiento_Tipo_Alojamiento1] FOREIGN KEY([Tipo_Alojamiento])
REFERENCES [dbo].[Tipo_Alojamiento] ([Id_TA])
GO
ALTER TABLE [dbo].[Alojamiento] CHECK CONSTRAINT [FK_Alojamiento_Tipo_Alojamiento1]
GO
ALTER TABLE [dbo].[Liquidacion_Tarifa_Extra]  WITH CHECK ADD  CONSTRAINT [FK_Liquidacion_Tarifa_Extra_Temporadas1] FOREIGN KEY([Temporada])
REFERENCES [dbo].[Temporadas] ([Id_Temporada])
GO
ALTER TABLE [dbo].[Liquidacion_Tarifa_Extra] CHECK CONSTRAINT [FK_Liquidacion_Tarifa_Extra_Temporadas1]
GO
ALTER TABLE [dbo].[Liquidacion_Tarifa_Ordinaria]  WITH CHECK ADD  CONSTRAINT [FK_Liquidacion_Tarifa_Ordinaria_Temporadas] FOREIGN KEY([Temporada])
REFERENCES [dbo].[Temporadas] ([Id_Temporada])
GO
ALTER TABLE [dbo].[Liquidacion_Tarifa_Ordinaria] CHECK CONSTRAINT [FK_Liquidacion_Tarifa_Ordinaria_Temporadas]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Sedes] FOREIGN KEY([Id_Sede])
REFERENCES [dbo].[Sedes] ([Id_Sede])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Sedes]
GO
USE [master]
GO
ALTER DATABASE [Prueba_MainSoft] SET  READ_WRITE 
GO
