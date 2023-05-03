## Homework

USE henry;



#1. ¿Cuantas carreas tiene Henry?

SELECT COUNT(idCarrera)  FROM carrera;

-- 2

#2. ¿Cuantos alumnos hay en total?

SELECT COUNT(idAlumno) FROM alumno a;

-- 180

#3. ¿Cuantos alumnos tiene cada cohorte?

SELECT idCohorte ,COUNT(*) as cantidadAlumni FROM alumno a 
GROUP BY idCohorte;

-- 20 por cada cohorte

#4. Confecciona un listado de los alumnos ordenado por los últimos alumnos que ingresaron, 
#con nombre y apellido en un solo campo.

SELECT CONCAT(nombre," ",apellido) AS '[Nombre y Apellido]',fechaIngreso
FROM alumno
ORDER BY 2 DESC;

#5. ¿Cual es el nombre del primer alumno que ingreso a Henry?

SELECT CONCAT(nombre," ",apellido) AS '[Nombre y Apellido]',fechaIngreso
FROM alumno
ORDER BY 2 ASC
LIMIT 1;

-- Baverly Gardner

#6. ¿En que fecha ingreso?

-- 2019-12-04

#7. ¿Cual es el nombre del ultimo alumno que ingreso a Henry?

SELECT CONCAT(nombre," ",apellido) AS '[Nombre y Apellido]',fechaIngreso
FROM alumno
ORDER BY 2 DESC 
LIMIT 1;

-- Jason Harmon

#8. La función YEAR le permite extraer el año de un campo date, utilice esta función 
#y especifique cuantos alumnos ingresarona a Henry por año.

SELECT YEAR(fechaIngreso),COUNT(*) AS CantidadAlum FROM alumno
GROUP BY YEAR (fechaIngreso)
ORDER BY 1 ASC;

-- 2019/13
-- 2020/27
-- 2021/72
-- 2022/68

#9. ¿Cuantos alumnos ingresaron por semana a henry?, indique también el año. WEEKOFYEAR()

SELECT YEAR(fechaIngreso),WEEKOFYEAR(fechaIngreso),COUNT(*) AS CantidadAlum FROM alumno
GROUP BY YEAR (fechaIngreso),WEEKOFYEAR(fechaIngreso)
ORDER BY 1 ASC;

-- SON 63 RESULTADOS 

#10. ¿En que años ingresaron más de 20 alumnos?

SELECT YEAR(fechaIngreso),COUNT(*) AS CantidadAlum FROM alumno
GROUP BY YEAR (fechaIngreso)
HAVING COUNT(*) > 20 
ORDER BY 1 ASC;

-- 2020,2021,2022

#11. Investigue las funciones TIMESTAMPDIFF() y CURDATE().
#¿Podría utilizarlas para saber cual es la edad de los instructores?.

SELECT * FROM instructor i;

SELECT CONCAT(nombre," ",apellido) AS '[Nombre y Apellido]',TIMESTAMPDIFF (YEAR  ,fechaNacimiento,CURDATE()) as Años
FROM instructor i;

#¿Como podrías verificar si la función cálcula años completos? Utiliza DATE_ADD().

SELECT CONCAT(nombre," ",apellido) AS '[Nombre y Apellido]',TIMESTAMPDIFF (YEAR  ,fechaNacimiento,CURDATE()) as Años,
DATE_ADD(fechaNacimiento,INTERVAL TIMESTAMPDIFF (YEAR  ,fechaNacimiento,CURDATE()) year) as Verificacion, fechaNacimiento  
FROM instructor i;

#12. Cálcula:<br>
#            - La edad de cada alumno.<br>
SELECT * FROM alumno a;

SELECT CONCAT(nombre," ",apellido) AS '[Nombre y Apellido]', TIMESTAMPDIFF(YEAR,fechaNacimiento,CURDATE()) AS EDAD
FROM alumno a;

#            - La edad promedio de los alumnos de henry.<br>


SELECT AVG(TIMESTAMPDIFF(YEAR,fechaNacimiento,CURDATE())) AS EDAD_PROMEDIO
FROM alumno a;


#            - La edad promedio de los alumnos de cada cohorte.<br>

SELECT * FROM alumno a;
SELECT * FROM cohorte c ;

SELECT c2.nombre as Carrera, a.idCohorte ,AVG(TIMESTAMPDIFF(YEAR,fechaNacimiento,CURDATE())) AS EDAD_PROMEDIO
FROM alumno a
JOIN cohorte c ON c.idCohorte = a.idCohorte
JOIN carrera c2 ON c2.idCarrera = c.idCarrera 
GROUP BY idCohorte;


#13. Elabora un listado de los alumnos que superan la edad promedio de Henry.

SELECT CONCAT(nombre," ",apellido) AS '[Nombre y Apellido]', TIMESTAMPDIFF(YEAR,fechaNacimiento,CURDATE()) AS EDAD
FROM alumno a
WHERE TIMESTAMPDIFF(YEAR,a.fechaNacimiento,CURDATE()) >
 	  (SELECT AVG(TIMESTAMPDIFF(YEAR,fechaNacimiento,CURDATE())) AS EDAD_PROMEDIO
		FROM alumno a)
ORDER BY 2;


