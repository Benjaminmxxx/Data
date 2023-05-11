USE adventureworks;

#1. Obtener un listado de contactos que hayan ordenado productos de la subcategoría "Mountain Bikes", 
#entre los años 2000 y 2003, cuyo método de envío sea "CARGO TRANSPORT 5".<br>

SELECT * FROM  salesorderheader s;

SELECT * FROM contact c;

SELECT * FROM salesorderdetail s;

SELECT * FROM product p ;

SELECT * FROM productsubcategory p ;

SELECT * FROM shipmethod s ;

SELECT DISTINCT CONCAT_WS(" ",c.FirstName, c.MiddleName  ,c.LastName) AS NOMBRE_COMPLETO, h.OrderDate
FROM salesorderheader h
	JOIN contact c 
		ON (h.ContactID  = c.ContactID)
	JOIN salesorderdetail d 
		ON (h.SalesOrderID = d.SalesOrderID)
	JOIN product p 
		ON (d.ProductID = p.ProductID)
	JOIN productsubcategory s 
		ON (p.ProductSubcategoryID = s.ProductCategoryID)
	JOIN shipmethod e 
		ON (h.ShipMethodID = e.ShipMethodID)
WHERE YEAR(h.OrderDate) BETWEEN 2000 AND 2003
AND s.Name = 'Mountain Bikes'
AND e.Name = 'CARGO TRANSPORT 5';



#2. Obtener un listado contactos que hayan ordenado productos de la subcategoría "Mountain Bikes", 
#entre los años 2000 y 2003 con la cantidad de productos adquiridos y ordenado por este valor, de forma descendente.<br>

SELECT * FROM salesorderdetail s;


SELECT CONCAT(c.FirstName,' ',c.LastName) AS NOMBRE, SUM(d.OrderQty) AS CANTIDAD, year(h.OrderDate) as anio
FROM salesorderheader h
	JOIN contact c 
		ON (h.ContactID  = c.ContactID)
	JOIN salesorderdetail d 
		ON (h.SalesOrderID = d.SalesOrderID)
	JOIN product p 
		ON (d.ProductID = p.ProductID)
	JOIN productsubcategory s 
		ON (p.ProductSubcategoryID = s.ProductCategoryID)
	JOIN shipmethod e 
		ON (h.ShipMethodID = e.ShipMethodID)
WHERE YEAR(h.OrderDate) BETWEEN 2000 AND 2003
AND s.Name = 'Mountain Bikes'
GROUP BY c.FirstName, c.LastName, YEAR(h.OrderDate)
ORDER BY CANTIDAD DESC;

#3. Obtener un listado de cual fue el volumen de compra (cantidad) por año y método de envío.<br> 

SELECT * FROM  salesorderheader s;
SELECT * FROM salesorderdetail s;
SELECT * FROM shipmethod s;


SELECT C.Name AS METODO_ENVIO ,YEAR(A.OrderDate) AS ANIO ,SUM(B.OrderQty) AS VOLUMEN_DE_COMPRA
FROM salesorderheader A
	JOIN salesorderdetail B ON A.SalesOrderID  = B.SalesOrderID 
	JOIN shipmethod C ON A.ShipMethodID = C.ShipMethodID
GROUP BY YEAR(A.OrderDate), C.Name
ORDER BY C.Name;


#4. Obtener un listado por categoría de productos, con el valor total de ventas y productos vendidos.<br>

SELECT * FROM product p;
SELECT * FROM salesorderdetail s;
SELECT * FROM productsubcategory p;
SELECT * FROM productcategory p ;

SELECT D.Name AS Categoria,SUM(B.OrderQty) AS Productos_Vendidos, ROUND(SUM(B.LineTotal),2) AS Total_Ventas
FROM product A
	LEFT JOIN salesorderdetail B ON A.ProductID = B.ProductID
	LEFT JOIN productsubcategory C ON A.ProductSubcategoryID = C.ProductSubcategoryID
	LEFT JOIN productcategory D ON C.ProductCategoryID = D.ProductCategoryID 
GROUP BY Categoria
ORDER BY 2 DESC;

#5. Obtener un listado por país (según la dirección de envío), con el valor total de ventas y productos vendidos, 
#sólo para aquellos países donde se enviaron más de 15 mil productos.<br>

SELECT s.ShipToAddressID  FROM salesorderheader s;
SELECT *  FROM address a ;
SELECT * FROM stateprovince s;
SELECT * FROM countryregion c;
SELECT * FROM salesorderdetail s;


SELECT D.Name, SUM(E.OrderQty) AS PRODUCTOS_VENDIDOS, ROUND(SUM(E.LineTotal),2) AS TOTAL_VENTAS
FROM salesorderheader A
	JOIN address B ON A.ShipToAddressID= B.AddressID 
	JOIN stateprovince C ON B.StateProvinceID = C.StateProvinceID 
	JOIN countryregion D ON C.CountryRegionCode = D.CountryRegionCode
	JOIN salesorderdetail E ON A.SalesOrderID = E.SalesOrderID
GROUP BY D.Name 
HAVING SUM(E.OrderQty) > 15000
ORDER BY 3 DESC;

