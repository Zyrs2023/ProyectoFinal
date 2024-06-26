USE [PuntoDeVenta]
GO
/****** Object:  User [BUILTIN\Users]    Script Date: 27/3/2024 21:37:01 ******/
CREATE USER [BUILTIN\Users] FOR LOGIN [BUILTIN\Users]
GO
/****** Object:  User [NT Service\MSSQLSERVER]    Script Date: 27/3/2024 21:37:02 ******/
CREATE USER [NT Service\MSSQLSERVER] FOR LOGIN [NT Service\MSSQLSERVER] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [powerby]    Script Date: 27/3/2024 21:37:02 ******/
CREATE USER [powerby] FOR LOGIN [powerby] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[IdCargo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [nvarchar](15) NULL,
	[Apellidos] [nvarchar](100) NULL,
	[Nombres] [nvarchar](100) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Telefono] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitario] [decimal](10, 2) NULL,
	[SubTotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [nvarchar](15) NULL,
	[Apellidos] [nvarchar](100) NULL,
	[Nombres] [nvarchar](100) NULL,
	[Sexo] [char](1) NULL,
	[FechaNacimiento] [date] NULL,
	[Direccion] [nvarchar](255) NULL,
	[EstadoCivil] [char](1) NULL,
	[Imagen] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NULL,
	[Nombre] [nvarchar](100) NULL,
	[Marca] [nvarchar](100) NULL,
	[Stock] [int] NULL,
	[PrecioCompra] [decimal](10, 2) NULL,
	[PrecioVenta] [decimal](10, 2) NULL,
	[FechaVencimiento] [date] NULL,
	[Imagen] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NULL,
	[Correo] [nvarchar](255) NOT NULL,
	[Contrasena] [nvarchar](255) NOT NULL,
	[TokenCambioContrasena] [nvarchar](255) NULL,
	[TokenExpiracion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Usuario_Correo] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NULL,
	[IdCliente] [int] NULL,
	[Serie] [nvarchar](5) NULL,
	[NumeroDocumento] [nvarchar](10) NULL,
	[TipoDocumento] [char](1) NULL,
	[FechaVenta] [date] NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
/****** Object:  StoredProcedure [dbo].[AgregarCategoria]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarCategoria]
    @Descripcion nvarchar(100)
AS
BEGIN
    INSERT INTO [dbo].[Categoria] (Descripcion)
    VALUES (@Descripcion);
    
    SELECT SCOPE_IDENTITY() AS 'NewID';
END;
GO
/****** Object:  StoredProcedure [dbo].[AgregarCliente]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarCliente]
    @DNI NVARCHAR(15),
    @Apellidos NVARCHAR(100),
    @Nombres NVARCHAR(100),
    @Direccion NVARCHAR(255),
    @Telefono NVARCHAR(20)
AS
BEGIN
    INSERT INTO Cliente (DNI, Apellidos, Nombres, Direccion, Telefono)
    VALUES (@DNI, @Apellidos, @Nombres, @Direccion, @Telefono);
    SELECT SCOPE_IDENTITY() AS IdCliente; -- Devuelve el ID del cliente recién agregado
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarEmpleado]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarEmpleado]
    @DNI NVARCHAR(15),
    @Apellidos NVARCHAR(100),
    @Nombres NVARCHAR(100),
    @Sexo CHAR(1),
    @FechaNacimiento DATE,
    @Direccion NVARCHAR(255),
    @EstadoCivil CHAR(1),
    @Imagen VARBINARY(MAX)
AS
BEGIN
    INSERT INTO [dbo].[Empleado] (DNI, Apellidos, Nombres, Sexo, FechaNacimiento, Direccion, EstadoCivil, Imagen)
    VALUES (@DNI, @Apellidos, @Nombres, @Sexo, @FechaNacimiento, @Direccion, @EstadoCivil, @Imagen);
    
    -- Devuelve el ID del empleado recién insertado
    SELECT SCOPE_IDENTITY() AS 'NewIDEmpleado';
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarProducto]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarProducto]
    @IdCategoria int,
    @Nombre nvarchar(100),
    @Marca nvarchar(100),
    @Stock int,
    @PrecioCompra decimal(10, 2),
    @PrecioVenta decimal(10, 2),
    @FechaVencimiento date,
    @Imagen varbinary(max)
AS
BEGIN
    INSERT INTO [dbo].[Producto](IdCategoria, Nombre, Marca, Stock, PrecioCompra, PrecioVenta, FechaVencimiento, Imagen)
    VALUES (@IdCategoria, @Nombre, @Marca, @Stock, @PrecioCompra, @PrecioVenta, @FechaVencimiento, @Imagen)
    
    SELECT SCOPE_IDENTITY() AS 'NewID';
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCategoriaPorID]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarCategoriaPorID]
    @IdCategoria int
AS
BEGIN
    SELECT IdCategoria, Descripcion
    FROM [dbo].[Categoria]
    WHERE IdCategoria = @IdCategoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarClientePorId]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarClientePorId]
    @IdCliente INT
AS
BEGIN
    SELECT *
    FROM Cliente
    WHERE IdCliente = @IdCliente;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEmpleadoPorID]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarEmpleadoPorID]
    @IdEmpleado INT
AS
BEGIN
    SELECT * FROM Empleado WHERE IdEmpleado = @IdEmpleado;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProductoPorID]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarProductoPorID]
    @IdProducto int
AS
BEGIN
    SELECT * FROM [dbo].[Producto]
    WHERE IdProducto = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTodosClientes]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarTodosClientes]
AS
BEGIN
    SELECT *
    FROM Cliente;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTodosEmpleados]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarTodosEmpleados]
AS
BEGIN
    SELECT * FROM Empleado;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTodosLosProductos]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarTodosLosProductos]
AS
BEGIN
    SELECT 
        IdProducto, 
        IdCategoria, 
        Nombre, 
        Marca, 
        Stock, 
        PrecioCompra, 
        PrecioVenta, 
        FechaVencimiento,
        Imagen
    FROM 
        [dbo].[Producto];
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarCategoria]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarCategoria]
    @IdCategoria int
AS
BEGIN
    DELETE FROM [dbo].[Categoria]
    WHERE IdCategoria = @IdCategoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarCliente]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarCliente]
    @IdCliente INT
AS
BEGIN
    DELETE FROM Cliente
    WHERE IdCliente = @IdCliente;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarEmpleado]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarEmpleado]
    @IdEmpleado INT
AS
BEGIN
    DELETE FROM Empleado WHERE IdEmpleado = @IdEmpleado;
END

GO
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarProducto]
    @IdProducto int
AS
BEGIN
    DELETE FROM [dbo].[Producto]
    WHERE IdProducto = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarCategoria]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarCategoria]
    @IdCategoria int,
    @Descripcion nvarchar(100)
AS
BEGIN
    UPDATE [dbo].[Categoria]
    SET Descripcion = @Descripcion
    WHERE IdCategoria = @IdCategoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[ModificarCliente]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarCliente]
    @IdCliente INT,
    @DNI NVARCHAR(15),
    @Apellidos NVARCHAR(100),
    @Nombres NVARCHAR(100),
    @Direccion NVARCHAR(255),
    @Telefono NVARCHAR(20)
AS
BEGIN
    UPDATE Cliente
    SET DNI = @DNI,
        Apellidos = @Apellidos,
        Nombres = @Nombres,
        Direccion = @Direccion,
        Telefono = @Telefono
    WHERE IdCliente = @IdCliente;
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarEmpleado]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarEmpleado]
    @IdEmpleado INT,
    @DNI NVARCHAR(15),
    @Apellidos NVARCHAR(100),
    @Nombres NVARCHAR(100),
    @Sexo CHAR(1),
    @FechaNacimiento DATE,
    @Direccion NVARCHAR(255),
    @EstadoCivil CHAR(1),
    @Imagen VARBINARY(MAX)
AS
BEGIN
    UPDATE Empleado
    SET DNI = @DNI,
        Apellidos = @Apellidos,
        Nombres = @Nombres,
        Sexo = @Sexo,
        FechaNacimiento = @FechaNacimiento,
        Direccion = @Direccion,
        EstadoCivil = @EstadoCivil,
        Imagen = @Imagen
    WHERE IdEmpleado = @IdEmpleado;
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarProducto]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ModificarProducto]
    @IdProducto int,
    @IdCategoria int,
    @Nombre nvarchar(100),
    @Marca nvarchar(100),
    @Stock int,
    @PrecioCompra decimal(10, 2),
    @PrecioVenta decimal(10, 2),
    @FechaVencimiento date,
    @Imagen varbinary(max)
AS
BEGIN
    UPDATE [dbo].[Producto]
    SET 
        IdCategoria = @IdCategoria,
        Nombre = @Nombre,
        Marca = @Marca,
        Stock = @Stock,
        PrecioCompra = @PrecioCompra,
        PrecioVenta = @PrecioVenta,
        FechaVencimiento = @FechaVencimiento,
        Imagen = @Imagen
    WHERE IdProducto = @IdProducto;
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarCargo]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarCargo]
    @Descripcion NVARCHAR(100)
AS
BEGIN
    INSERT INTO Cargo (Descripcion)
    VALUES (@Descripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarUsuario]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarUsuario]
    @IdEmpleado INT,
    @Correo NVARCHAR(255),
    @Clave NVARCHAR(255) -- Este debe ser el hash de la contraseña, no la contraseña en texto plano
AS
BEGIN
    -- Primero verificamos que no exista un usuario con el mismo correo electrónico
    IF NOT EXISTS(SELECT 1 FROM Usuario WHERE Correo = @Correo)
    BEGIN
        -- Si no existe, insertamos el nuevo usuario
        INSERT INTO Usuario (IdEmpleado, Correo, Contrasena)
        VALUES (@IdEmpleado, @Correo, @Clave)
    END
    ELSE
    BEGIN
        -- Aquí puedes manejar el error como prefieras, por ejemplo, levantando un error.
        THROW 50001, 'Ya existe un usuario con el correo proporcionado.', 1;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarUsuarioConToken]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarUsuarioConToken]
    @IdEmpleado INT,
    @Correo NVARCHAR(255),
    @Clave NVARCHAR(255),
    @TokenCambioContrasena NVARCHAR(255),
    @TokenExpiracion DATETIME
AS
BEGIN
    INSERT INTO Usuario (IdEmpleado, Correo, Contrasena, TokenCambioContrasena, TokenExpiracion)
    VALUES (@IdEmpleado, @Correo, @Clave, @TokenCambioContrasena, @TokenExpiracion)
END
GO
/****** Object:  StoredProcedure [dbo].[spCambiarContrasenaPorToken]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCambiarContrasenaPorToken]
    @Correo NVARCHAR(255),
    @NuevaContrasenaHash NVARCHAR(255)
AS
BEGIN
    -- Verifica si el correo y el token son válidos y no han expirado
    IF EXISTS (
        SELECT 1
        FROM Usuario
        WHERE Correo = @Correo
            AND TokenExpiracion > GETUTCDATE()
    )
    BEGIN
        -- Si el correo y el token son válidos, actualiza la contraseña
        UPDATE Usuario
        SET Contrasena = @NuevaContrasenaHash,
            TokenCambioContrasena = NULL,
            TokenExpiracion = NULL
        WHERE Correo = @Correo;
        
        -- Retorna 1 para indicar que la contraseña fue cambiada con éxito
        SELECT 1;
    END
    ELSE
    BEGIN
        -- Retorna 0 para indicar que el correo o el token son inválidos o han expirado
        SELECT 0;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCargo]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarCargo]
    @IdCargo INT
AS
BEGIN
    SELECT * FROM Cargo
    WHERE IdCargo = @IdCargo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTodosLosCargos]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarTodosLosCargos]
AS
BEGIN
    SELECT * FROM Cargo
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarCargo]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarCargo]
    @IdCargo INT
AS
BEGIN
    DELETE FROM Cargo
    WHERE IdCargo = @IdCargo
END
GO
/****** Object:  StoredProcedure [dbo].[spModificarCargo]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModificarCargo]
    @IdCargo INT,
    @Descripcion NVARCHAR(100)
AS
BEGIN
    UPDATE Cargo
    SET Descripcion = @Descripcion
    WHERE IdCargo = @IdCargo
END
GO
/****** Object:  StoredProcedure [dbo].[spValidarLogin]    Script Date: 27/3/2024 21:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spValidarLogin]
    @Correo NVARCHAR(255),
    @ContrasenaHash NVARCHAR(255),
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Inicializa el resultado como falso (0).
    SET @Resultado = 0

    -- Verifica si existe un usuario con el correo y la contraseña proporcionados.
    IF EXISTS(SELECT 1 FROM Usuario WHERE Correo = @Correo AND Contrasena = @ContrasenaHash)
    BEGIN
        -- Si existe, establece el resultado como verdadero (1).
        SET @Resultado = 1
    END
END
GO
