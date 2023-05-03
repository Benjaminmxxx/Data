
CREATE DATABASE TEST;

USE TEST;

CREATE TABLE oferta_gastronomica(
	id_local INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR (50) NOT NULL,
	categoria VARCHAR (50) NOT NULL,
	direccion VARCHAR (50) NOT NULL,
	barrio VARCHAR (50) NOT NULL,
	comuna INT NOT NULL,
	PRIMARY KEY (id_local)
);

SELECT * FROM oferta_gastronomica og ;

UPDATE oferta_gastronomica
SET barrio = 'Nuñez'
WHERE barrio = 'NuÃƒÂ±ez';


--- a) ¿Cuál es el barrio con mayor cantidad de Pubs?

SELECT COUNT(*), og.barrio,categoria  FROM oferta_gastronomica og
GROUP BY barrio,categoria
HAVING categoria = 'PUB'
ORDER BY 1 DESC;

--- RECOLETA


--- b) Obtener la cantidad de locales por categoría

SELECT * FROM oferta_gastronomica og ;

SELECT COUNT(*) , categoria  FROM oferta_gastronomica og
GROUP BY categoria
ORDER BY 1 DESC;

--- c) Obtener la cantidad de restaurantes por comuna

SELECT * FROM oferta_gastronomica og ;

SELECT comuna,categoria,COUNT(*)FROM oferta_gastronomica og
GROUP BY categoria,comuna 
HAVING categoria = 'RESTAURANTE'
ORDER BY 1;












