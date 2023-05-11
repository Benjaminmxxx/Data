SHOW VARIABLES LIKE 'local_infile';

-- Base de Datos

CREATE DATABASE henryM3;
USE henryM3;

-- Crear Tabla GASTO
CREATE TABLE IF NOT EXISTS gasto(

idGasto INT,
idSucursal INT,
idTipoGasto INT,
fecha DATE,
monto DECIMAL(10,2)
);

LOAD DATA LOCAL INFILE '/Users/alejandrobenjaminnunezguzman/Desktop/M3_2/Clase 04/Homework/Gasto.csv'
INTO TABLE gasto
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1
LINES (idGasto,idSucursal,idTipoGasto,fecha,monto);

SELECT * FROM gasto;

-- Crear Tabla COMPRA

CREATE TABLE IF NOT EXISTS compra(
idCompra INT,
fecha DATE,
idProducto INT,
cantidad INT,
precio DECIMAL(10,2),
idProveedor INT
);

LOAD DATA LOCAL INFILE '/Users/alejandrobenjaminnunezguzman/Desktop/M3_2/Clase 04/Homework/Compra.csv'
INTO TABLE compra
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1
LINES (idCompra,fecha,idProducto,cantidad,precio,idProveedor);

SELECT * FROM compra;

##DROP TABLE venta;

-- Crear Tabla VENTA

CREATE TABLE IF NOT EXISTS venta(
idVenta INT,
fecha DATE,
fechaEntrega DATE,
idCanal INT,
idCliente INT,
idSucursal INT,
idEmpleado INT,
idProducto INT,
precio VARCHAR(50),
cantidad VARCHAR(50)
);

LOAD DATA LOCAL INFILE '/Users/alejandrobenjaminnunezguzman/Desktop/M3_2/Clase 04/Homework/Venta.csv'
INTO TABLE venta
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1
LINES (idVenta,fecha,fechaEntrega,idCanal,idCliente,idSucursal,idEmpleado,idProducto,precio,cantidad);

SELECT * FROM venta;

-- Crear Tabla SUCURSALES

CREATE TABLE IF NOT EXISTS sucursales(
id INT,
sucursal VARCHAR(100),
direccion VARCHAR(100),
localidad VARCHAR(100),
provincia VARCHAR(100),
latitud VARCHAR(100),
longitud VARCHAR(100)
);

LOAD DATA LOCAL INFILE '/Users/alejandrobenjaminnunezguzman/Desktop/M3_2/Clase 04/Homework/Sucursales.csv'
INTO TABLE sucursales
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1
LINES;

SELECT * FROM sucursales;

-- Crear Tabla CLIENTES

CREATE TABLE IF NOT EXISTS clientes(
id INT,
provincia VARCHAR(100),
nombre_apellido VARCHAR(100),
domicilio VARCHAR(200),
telefono VARCHAR(100),
edad VARCHAR (100),
localidad VARCHAR(100),
X VARCHAR(100),
Y VARCHAR(100),
fecha_alta DATE,
usuario_alta VARCHAR(100),
fecha_ultima_modificacion DATE,
usuario_ultima_modificacion VARCHAR(100),
marca_baja tinyint,
col10 VARCHAR(5)
);

LOAD DATA LOCAL INFILE '/Users/alejandrobenjaminnunezguzman/Desktop/M3_2/Clase 04/Homework/Clientes.csv'
INTO TABLE clientes
CHARACTER SET latin1
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1
LINES;

SELECT * FROM clientes;

-- Crear Tabla CANAL_VENTA

CREATE TABLE IF NOT EXISTS canal_venta(
idcanal INT,
canal VARCHAR(100)
);

LOAD DATA LOCAL INFILE '/Users/alejandrobenjaminnunezguzman/Desktop/M3_2/Clase 04/Homework/CanalDeVenta.csv'
INTO TABLE canal_venta
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1
LINES;

SELECT * FROM canal_venta;

-- Crear Tabla TIPO_GASTO

CREATE TABLE IF NOT EXISTS tipo_gasto(
idTipoGasto INT,
descripcion VARCHAR(100),
donto_Aproximado INT
);

LOAD DATA LOCAL INFILE '/Users/alejandrobenjaminnunezguzman/Desktop/M3_2/Clase 04/Homework/TiposDeGasto.csv'
INTO TABLE tipo_gasto
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1
LINES;

SELECT * FROM tipo_gasto;

-- Crear Tabla PROVEEDORES

CREATE TABLE IF NOT EXISTS provedores(
idProveedor INT,
nombre VARCHAR(100),
domicilio VARCHAR(200),
ciudad VARCHAR(100),
provincia VARCHAR(50),
pais VARCHAR(100),
departamento VARCHAR(100)
);

LOAD DATA LOCAL INFILE '/Users/alejandrobenjaminnunezguzman/Desktop/M3_2/Clase 04/Homework/Proveedores.csv'
INTO TABLE provedores
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1
LINES;

SELECT * FROM provedores;

#DROP TABLE producto;

-- Crear Tabla PRODUCTOS

CREATE TABLE IF NOT EXISTS productos(
id_producto INT,
concepto VARCHAR(100),
tipo VARCHAR(50),
Precio VARCHAR(100)
);

LOAD DATA LOCAL INFILE '/Users/alejandrobenjaminnunezguzman/Desktop/M3_2/Clase 04/Homework/PRODUCTOS.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1
LINES;

SELECT * FROM productos;

-- Crear Tabla EMPLEADOS

CREATE TABLE IF NOT EXISTS empleados(
id_empleado INT,
apellido VARCHAR(100),
nombre VARCHAR(199),
sucursal VARCHAR(100),
sector VARCHAR(100),
cargo VARCHAR(100),
salario DECIMAL (10,2)
);

LOAD DATA LOCAL INFILE '/Users/alejandrobenjaminnunezguzman/Desktop/M3_2/Clase 04/Homework/Empleados.csv'
INTO TABLE empleados
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1
LINES;

SELECT * FROM empleados;

