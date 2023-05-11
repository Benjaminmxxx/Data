## Homework

#Ejecutar el script AdventureWorks.sql para cargar las tablas y sus registros.

USE adventureworks;

#1. Crear un procedimiento que recibe como parametro una fecha y muestre la cantidad de ordenes ingresadas en esa fecha.

SELECT COUNT(salesorderid) FROM salesorderheader
WHERE DATE(orderdate)= '2002-04-01'; -- Quary simple

SELECT * FROM salesorderheader;

DROP PROCEDURE totalOrdenes;

DELIMITER //
CREATE PROCEDURE totalOrdenes (IN fechaOrden DATE)
BEGIN
	SELECT
	count(salesorderid)
	FROM
	salesorderheader
	WHERE
	date(orderdate) = fechaOrden;
END //
DELIMITER ;

CALL totalOrdenes('2002-03-01');

#2. Crear una función que calcule el valor nominal de un margen bruto determinado por el usuario a partir del precio de lista 
#de los productos.

#SET GLOBAL log_bin_trust_function_creators = 1; #A veces se usa

DROP FUNCTION margenBruto;

DELIMITER $$
CREATE FUNCTION margenBruto(precio DECIMAL(15,3), margen DECIMAL (9,2)) RETURNS DECIMAL (15,3)
BEGIN
	DECLARE margenBruto DECIMAL (15,3);
    
    SET margenBruto = precio * margen;
    
    RETURN margenBruto;
END$$

DELIMITER ;

-- APLICAR FUNCION (1)

Select margenBruto(100.50, 1.2);

-- APLICAR FUNCION A UNA LISTA (2) 

SELECT 
name, 
listprice, 
margenBruto (listprice,1.5) as PrecioBruto
from product
WHERE listprice>0;

#3. Obtner un listado de productos en orden alfabético que muestre cuál debería ser el valor de precio de lista, si se quiere 
#aplicar un margen bruto del 20%, utilizando la función creada en el punto 2, sobre el campo StandardCost. 
#Mostrando tambien el campo ListPrice y la diferencia con el nuevo campo creado.

#(1):
SELECT
name,
listprice,
margenBruto(listPrice, 1.2) as precioBruto,
standardcost,
ROUND(margenBruto(listPrice, 1.2) - standardcost,2) as diferencia
from
product
WHERE 
listprice > 0;

#(2):
SELECT 	ProductID,
		Name,
        ProductNumber,
        ListPrice,
        margenBruto(StandardCost, 1.2) as ListPriceMargenPropuesto,
        ListPrice - margenBruto(StandardCost, 1.2) as Diferencia
FROM product
ORDER BY Name;

#4. Crear un procedimiento que reciba como parámetro una fecha desde y una hasta, y muestre un listado con los Id de los diez 
#Clientes que más costo de transporte tienen entre esas fechas (campo Freight).

DROP PROCEDURE gastoTransporte;

DELIMITER $$
CREATE PROCEDURE gastoTransporte(IN fechaDesde DATE, IN fechaHasta DATE)
BEGIN
	SELECT CustomerID, SUM(Freight) AS TotalTransporte
	FROM salesorderheader
	WHERE OrderDate BETWEEN fechaDesde AND fechaHasta
    GROUP BY CustomerID
    ORDER BY TotalTransporte DESC
    LIMIT 10;
END $$

DELIMITER ;

CALL gastoTransporte('2002-01-01','2002-01-31');

#5. Crear un procedimiento que permita realizar la insercción de datos en la tabla shipmethod.<br>

DELIMITER //
CREATE PROCEDURE cargarDatos(IN nombre VARCHAR(100), IN base FLOAT, IN rate FLOAT)
BEGIN
	INSERT INTO shipmethod (Name,ShipBase, ShipRate, ModifiedDate)
	VALUES(nombre,base, rate, NOW());
END //
-- Ejecutar
DELIMITER ;
CALL cargarDatos('NuevoShipMethod',4.5,0.5);
-- Validar
SELECT * FROM shipmethod;

#Origen del Dataset: https://learn.microsoft.com/en-us/previous-versions/sql/sql-server-2008/ms124597(v=sql.100)
#Diccionario de Datos: AdventureWorks_DataDictionary
#En el script "AWBackup.sql" se encuentra todas las tablas del juego de datos.