USE [PuntoDeVenta]

CREATE TABLE [dbo].[Cargo](
	[IdCargo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[Linea] [int] NULL,
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[IdCargo] [int] NULL,
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
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT FK_Empleado_Cargo FOREIGN KEY (IdCargo) REFERENCES Cargo(IdCargo);
/****** Object:  Table [dbo].[Producto]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NULL,
	[IdEmpleado] [int] NULL,
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
/****** Object:  Table [dbo].[Producto_Bitacora]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_Bitacora](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[NombreProducto] [nvarchar](100) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Operacion] [nvarchar](100) NOT NULL,
	[NombreEmpleado] [nvarchar](100) NULL,
 CONSTRAINT [PK_Producto_Bitacora] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  Table [dbo].[Venta]    Script Date: 5/4/2024 18:00:45 ******/
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
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Cargo] FOREIGN KEY([IdCargo])
REFERENCES [dbo].[Cargo] ([IdCargo])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Cargo]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Empleado]
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
/****** Object:  StoredProcedure [dbo].[AgregarCategoria]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarCliente]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarEmpleado]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarEmpleado]
	@IdCargo INT,
    @DNI NVARCHAR(15),
    @Apellidos NVARCHAR(100),
    @Nombres NVARCHAR(100),
    @Sexo CHAR(1),
    @FechaNacimiento DATE,
    @Direccion NVARCHAR(255),
    @EstadoCivil CHAR(1),
    @Imagen VARBINARY(MAX),
    
AS
BEGIN
    DECLARE @NewIDEmpleado INT;

    -- Inserta el empleado en la tabla Empleado
    INSERT INTO [dbo].[Empleado] (IdCargo, DNI, Apellidos, Nombres, Sexo, FechaNacimiento, Direccion, EstadoCivil, Imagen)
    VALUES (@IdCargo, @DNI, @Apellidos, @Nombres, @Sexo, @FechaNacimiento, @Direccion, @EstadoCivil, @Imagen);
    
    -- Obtiene el ID del empleado recién insertado
    SET @NewIDEmpleado = SCOPE_IDENTITY();

    -- Devuelve el ID del empleado recién insertado
    SELECT @NewIDEmpleado AS 'NewIDEmpleado';
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarProducto]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarProducto]
    @IdCategoria INT,
    @Nombre NVARCHAR(100),
    @Marca NVARCHAR(100),
    @Stock INT,
    @PrecioCompra DECIMAL(10, 2),
    @PrecioVenta DECIMAL(10, 2),
    @FechaVencimiento DATE,
    @Imagen VARBINARY(MAX),
    @IdEmpleado INT  -- Agregar parámetro para el IdEmpleado
AS
BEGIN
    INSERT INTO Producto (IdCategoria, Nombre, Marca, Stock, PrecioCompra, PrecioVenta, FechaVencimiento, Imagen, IdEmpleado)
    VALUES (@IdCategoria, @Nombre, @Marca, @Stock, @PrecioCompra, @PrecioVenta, @FechaVencimiento, @Imagen, @IdEmpleado);

    SELECT SCOPE_IDENTITY();  -- Devuelve el nuevo IdProducto insertado
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCategoriaPorID]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarClientePorId]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarEmpleadoPorID]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarProductoPorId]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarProductoPorId]
    @IdProducto INT
AS
BEGIN
    SELECT * FROM Producto WHERE IdProducto = @IdProducto;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTodosClientes]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarTodosEmpleados]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarTodosLosProductos]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarTodosLosProductos]
AS
BEGIN
    SELECT IdProducto, IdCategoria, Nombre, Marca, Stock, PrecioCompra, PrecioVenta, FechaVencimiento, Imagen, IdEmpleado
    FROM Producto
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarCategoria]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarCliente]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarEmpleado]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarProducto]
    @IdProducto INT,
    @IdEmpleado INT
AS
BEGIN
    DECLARE @NombreProducto NVARCHAR(100);
    DECLARE @NombreEmpleado NVARCHAR(100);

    -- Obtener el nombre del producto
    SELECT @NombreProducto = Nombre
    FROM Producto
    WHERE IdProducto = @IdProducto;

    -- Obtener el nombre del empleado
    SELECT @NombreEmpleado = Nombres + ' ' + Apellidos
    FROM Empleado
    WHERE IdEmpleado = @IdEmpleado;

    -- Insertar en la tabla de bitácora antes de eliminar
    INSERT INTO Producto_Bitacora (IdProducto, NombreProducto, IdEmpleado, NombreEmpleado, Fecha, Operacion)
    VALUES (@IdProducto, @NombreProducto, @IdEmpleado, @NombreEmpleado, GETDATE(), 'Borrado');

    -- Eliminar el producto
    DELETE FROM Producto
    WHERE IdProducto = @IdProducto;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarProductoPorId]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarProductoPorId]
    @IdProducto INT
AS
BEGIN
    DELETE FROM Producto WHERE IdProducto = @IdProducto;
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarCategoria]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[ModificarCliente]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[ModificarEmpleado]    Script Date: 5/4/2024 18:00:45 ******/
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
    @Imagen VARBINARY(MAX),
    @IdCargo INT -- Nuevo parámetro para el ID del cargo
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualiza los datos del empleado
        UPDATE [dbo].[Empleado]
        SET
            DNI = @DNI,
            Apellidos = @Apellidos,
            Nombres = @Nombres,
            Sexo = @Sexo,
            FechaNacimiento = @FechaNacimiento,
            Direccion = @Direccion,
            EstadoCivil = @EstadoCivil,
            Imagen = @Imagen,
            IdCargo = @IdCargo -- Se actualiza el campo IdCargo
        WHERE
            IdEmpleado = @IdEmpleado;

        COMMIT TRANSACTION;

        -- Devuelve un mensaje de éxito
        SELECT 'Empleado modificado correctamente.' AS [Message];
    END TRY
    BEGIN CATCH
        -- En caso de error, se realiza un rollback de la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Se devuelve el mensaje de error
        THROW;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarProducto]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarProducto]
    @IdProducto INT,
    @IdCategoria INT,
    @Nombre NVARCHAR(100),
    @Marca NVARCHAR(100),
    @Stock INT,
    @PrecioCompra DECIMAL(10, 2),
    @PrecioVenta DECIMAL(10, 2),
    @FechaVencimiento DATE,
    @Imagen VARBINARY(MAX),
    @IdEmpleado INT
AS
BEGIN
    UPDATE Producto
    SET IdCategoria = @IdCategoria,
        Nombre = @Nombre,
        Marca = @Marca,
        Stock = @Stock,
        PrecioCompra = @PrecioCompra,
        PrecioVenta = @PrecioVenta,
        FechaVencimiento = @FechaVencimiento,
        Imagen = @Imagen,
        IdEmpleado = @IdEmpleado
    WHERE IdProducto = @IdProducto;
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarCargo]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarCargo]
    @Descripcion NVARCHAR(100),
    @NewId INT OUTPUT
AS
BEGIN
    -- Insertar el nuevo cargo
    INSERT INTO Cargo (Descripcion)
    VALUES (@Descripcion)

    -- Obtener el nuevo ID generado
    SET @NewId = SCOPE_IDENTITY()
END
/****** Object:  StoredProcedure [dbo].[spAgregarUsuario]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[spAgregarUsuarioConToken]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[spCambiarContrasenaPorToken]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[spConsultarCargo]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[spConsultarTodosLosCargos]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[spEliminarCargo]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[spModificarCargo]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[spValidarLogin]    Script Date: 5/4/2024 18:00:45 ******/
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
/****** Object:  StoredProcedure [dbo].[spValidarUsuario]    Script Date: 5/4/2024 18:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spValidarUsuario]
    @Correo NVARCHAR(255),
    @Contrasena NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Intentar encontrar un usuario que coincida con el correo y la contraseña proporcionados
    SELECT u.Correo, e.Nombres, e.Apellidos, e.Imagen
    FROM Usuario u
    INNER JOIN Empleado e ON u.IdEmpleado = e.IdEmpleado
    WHERE u.Correo = @Correo AND u.Contrasena = @Contrasena;
END
GO

----------------------------
--Procedures para no usar codigo SQL--
----------------------------


--CambioContrasenaManager Line 166
---------------------------

CREATE PROCEDURE [ObtenerCorreoPorToken]
    @Token NVARCHAR(255)
AS
BEGIN
    SELECT Correo
    FROM Usuario
    WHERE TokenCambioContrasena = @Token
END

--CargoDAL Line 124
---------------------------

CREATE PROCEDURE ConsultarTodosLosCargos
AS
BEGIN
    SELECT IdCargo, Descripcion FROM Cargo;
END

--CategoriaDAL Line 121
---------------------------

CREATE PROCEDURE ConsultarTodasCategorias
AS
BEGIN
    SELECT IdCategoria, Descripcion FROM Categoria;
END

--Procedure para perfil
---------------------------
CREATE PROCEDURE ObtenerDatosEmpleadoPorCorreo
    @Correo VARCHAR(100)
AS
BEGIN
    SELECT 
        e.IdEmpleado, 
        e.DNI, 
        e.Nombres, 
        e.Apellidos, 
		c.Descripcion,
        u.Correo, 
        e.Direccion
    FROM 
        Empleado e 
    INNER JOIN 
        Usuario u ON e.IdEmpleado = u.IdEmpleado 
    INNER JOIN 
        Cargo c ON e.IdCargo = c.IdCargo 
    WHERE 
        u.Correo = @Correo;
END

----------------------------
--Procedures para facturacion
----------------------------

create procedure selecproducto
@IdProducto int
as 
 begin 
 select IdCategoria, Nombre, Marca, Stock, PrecioCompra, PrecioVenta, FechaVencimiento, Imagen, IdEmpleado from Producto where IdProducto = @IdProducto
 end

exec selecproducto 6

Create procedure MaeFatura
 
  @IdEmpleado int,
  @IdCliente int,
  @Serie nvarchar(5),
  @NumeroDocumento nvarchar(10),
  @TipoDocumento char(1),
  @Total decimal (10, 2)
  as 

  begin
  DECLARE @FechaVenta date
  SET @FechaVenta = GETDATE()
    insert into Venta(IdEmpleado,IdCliente,Serie,NumeroDocumento,TipoDocumento,FechaVenta,Total) values (@IdEmpleado,@IdCliente,@Serie,@NumeroDocumento,@TipoDocumento,@FechaVenta,@Total)
  
  end

create procedure DetFactura

  @Linea int,
  @IdProducto int,
  @Cantidad int,
  @PrecioUnitario decimal (10, 2),
  @SubTotal decimal (10, 2)

  as 

  begin
    Declare @IdVenta int
	set @IdVenta = (select top 1 IdVenta from Venta order by IdVenta desc)
    insert into DetalleVenta(Linea,IdVenta,IdProducto,Cantidad,PrecioUnitario,SubTotal) values (@Linea,@IdVenta,@IdProducto,@Cantidad,@PrecioUnitario,@SubTotal)
  
  end
  
CREATE PROCEDURE ObtenerDetallesVentaPorNumeroFactura
    @NumeroDocumento NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DV.*
    FROM DetalleVenta DV
    WHERE DV.IdVenta = (SELECT V.IdVenta FROM Venta V WHERE V.NumeroDocumento = @NumeroDocumento)
END

----------------------------
--Procedures para usuario
----------------------------  

  CREATE PROCEDURE spAgregarUsuarioFromCatalogo
    @NuevoIdEmpleado INT,
    @NuevoCorreo NVARCHAR(100),
    @NuevaContrasena NVARCHAR(100)
AS
BEGIN
    -- Insertar un nuevo usuario
    INSERT INTO Usuario (IDEmpleado, Correo, Contrasena)
    VALUES (@NuevoIdEmpleado, @NuevoCorreo, @NuevaContrasena);

    -- Devolver el ID del usuario recién insertado
    SELECT SCOPE_IDENTITY() AS NuevoIDUsuario;
END 

CREATE PROCEDURE spConsultarUsuario
    @IdUsuario INT
AS
BEGIN
    -- Consultar los datos del usuario según el IDUsuario
    SELECT IDUsuario, IDEmpleado, Correo, Contrasena
    FROM Usuario
    WHERE IDUsuario = @IdUsuario;
END

CREATE PROCEDURE spEliminarUsuario
    @IdUsuario INT
AS
BEGIN
    -- Eliminar el usuario según el IDUsuario proporcionado
    DELETE FROM Usuario WHERE IDUsuario = @IdUsuario;
END

CREATE PROCEDURE spModificarUsuario
    @IdUsuario INT,
    @NuevoIdEmpleado INT,
    @NuevoCorreo NVARCHAR(100),
    @NuevaContrasena NVARCHAR(100)
AS
BEGIN
    -- Modificar los datos del usuario según el IDUsuario proporcionado
    UPDATE Usuario 
    SET IDEmpleado = @NuevoIdEmpleado, 
        Correo = @NuevoCorreo, 
        Contrasena = @NuevaContrasena 
    WHERE IDUsuario = @IdUsuario;
END

