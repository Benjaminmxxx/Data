**Data Definition Laguage:**

Son sentencias que permiten definir la estructura de una base de datos, esta estructura esta compuesta por “objetos” (no confundir con POO en Python) que se desean gestionar. Los tipos de objetos que se pueden gestinar son: bases de datos, tablas, vistas o procedimientos. Las acciones que se pueden ejecutar son CREAR, MODIFICAR o ELIMINAR. <br>

### SENTENCÍAS:

CREATE permite crear objetos en la base de datos, incluyendo la base de datos en si misma. 

Crear base de datos

```SQL
CREATE DATABASE henry – Crear.
ALTER DATABASE henry – Modificar.
DROP DATABASE henry – Borrar.
```

Tablas

```SQL
CREATE TABLE alumno (
cedulaIdentidad INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(20),
apellido VARCHAR(20),
fechaInicio DATE,
PRIMARY KEY (cedulaIdentidad)
)


ALTER TABLE alumno 
ADDdireccion VARCHAR(20)


DROP TABLE alumno
```

Vistas

```SQL
CREATE VIEW datosAlumnos AS  
SELECT *
FROM alumnos

ALTER VIEW datosAlumnos

DROP VIEW datosAlumnos
```

Procedimientos

```SQL
CREATE PROCEDURE contarAlumnos (OUT param1 INT)
     BEGIN
       SELECT COUNT(*) INTO param1 FROM alumnos;
     END

ALTER PROCEDURE contarAlumnos (OUT param1 INT)
     BEGIN
       SELECT COUNT(*) INTO param1 FROM alumnos;
     END

DROP PROCEDURE contarAlumnos
```
