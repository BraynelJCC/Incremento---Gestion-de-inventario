-- Creación de la base de datos
CREATE DATABASE GestionProductos;

-- Usar la base de datos
USE GestionProductos;

-- Creación de la tabla "Productos"
CREATE TABLE Productos (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100),
  fecha DATE,
  precio DECIMAL(10, 2),
  cantidad INT
);
GO

select * from Productos

-- Creación del stored procedure para agregar un nuevo producto
CREATE PROCEDURE AgregarProducto
  @p_nombre VARCHAR(100),
  @p_fecha DATE,
  @p_precio DECIMAL(10, 2),
  @p_cantidad INT
AS
BEGIN
  INSERT INTO Productos (nombre, fecha, precio, cantidad)
  VALUES (@p_nombre, @p_fecha, @p_precio, @p_cantidad);
END;
GO

-- Creación del stored procedure para leer todos los productos
CREATE PROCEDURE LeerProductos
AS
BEGIN
  SELECT * FROM Productos;
END;
GO

-- Creación del stored procedure para actualizar un producto existente
CREATE PROCEDURE ActualizarProducto
  @p_id INT,
  @p_nombre VARCHAR(100),
  @p_fecha DATE,
  @p_precio DECIMAL(10, 2),
  @p_cantidad INT
AS
BEGIN
  UPDATE Productos SET nombre = @p_nombre, fecha = @p_fecha, precio = @p_precio, cantidad = @p_cantidad WHERE id = @p_id;
END;
GO


-- Creación del stored procedure para eliminar un producto
CREATE PROCEDURE EliminarProducto
  @p_id INT
AS
BEGIN
  DELETE FROM Productos WHERE id = @p_id;
END;
GO
