CREATE DATABASE henry;
USE henry;

-- Carrea: ID, Nombre.<br>

CREATE TABLE carrera (
	idCarrera int not null auto_increment,
    nombre VARCHAR(50) NOT NULL,
	PRIMARY KEY (idCarrera)
);

-- Instructores: ID, Cédula de identidad, Nombre, Apellido, Fecha de Nacimiento, Fecha de Incorporación.<br>

CREATE TABLE instructor (
	idInstructor int not null auto_increment,
    cedulaIdentidad VARCHAR (30) NOT NULL,
    nombre VARCHAR (20) NOT NULL,
    apellido VARCHAR (20) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    fechaIncorporacion DATE,
    
	PRIMARY KEY (idInstructor)
);

-- Cohorte: ID, Código, Carrera, Fecha de Inicio, Fecha de Finalización, Instructor.<br>

CREATE TABLE cohorte(
	idCohorte int not null auto_increment,
    codigo varchar (40) not null,
    idCarrera int not null not null,
    idInstructor INT NOT NULL,
    fechaInicio DATE,
    fechaFinalizacion DATE,
    
    PRIMARY KEY (idCohorte),
    FOREIGN KEY (idCarrera) REFERENCES carrera(idCarrera),
    FOREIGN KEY (idInstructor) REFERENCES instructor(idInstructor)
);

-- Alumnos: ID, Cédula de identidad, Nombre, Apellido, Fecha de Nacimiento, Fecha de Ingreso, Cohorte.<br>

CREATE TABLE alumno (
	
    idAlumno INT NOT NULL AUTO_INCREMENT,
    cedulaIdentidad VARCHAR (40) NOT NULL,
    nombre VARCHAR (40) NOT NULL,
    apellido VARCHAR (20) NOT NULL,
    fechaNacimiento DATE,
    fechaIngreso DATE,
    idCohorte INT NOT NULL,
    PRIMARY KEY (idAlumno),
    FOREIGN KEY (idCohorte) REFERENCES cohorte(idCohorte)
);

SELECT * FROM alumno;


