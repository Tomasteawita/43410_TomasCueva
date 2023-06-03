-- Buena practica para la creación de bases de datos
DROP DATABASE IF EXISTS alumnos; -- Schema o database es lo mismo en las bases de datos
CREATE DATABASE IF NOT EXISTS alumnos;

USE alumnos;

DROP TABLE IF EXISTS CARRERA;
CREATE TABLE IF NOT EXISTS CARRERA(
	id INT NOT NULL AUTO_INCREMENT,
    nombreCarrera VARCHAR(150) NOT NULL,
    duracionCarrera CHAR(5) NOT NULL,
    PRIMARY KEY(id)
);
DROP TABLE IF EXISTS ALUMNO;
CREATE TABLE IF NOT EXISTS ALUMNO(
	id INT NOT NULL AUTO_INCREMENT,
    nombre varchar(60) not null,
    edad int not null,
    semestre varchar(60) not null,
    genero ENUM('M','F','O'),
    idCarrera int not null,
    -- El constraint me permite poner el nombre que yo prefiera a la foreing key
    constraint fk_alumno_carrera foreign key (idCarrera) REFERENCES CARRERA(id),
	PRIMARY KEY(id)
) ENGINE = Innob;


DROP TABLE IF EXISTS ;
CREATE TABLE IF NOT EXISTS (
	id INT NOT NULL AUTO_INCREMENT,
    
	PRIMARY KEY(id)
);
-- Me piden encontrar toda la informacion de la carrera que puede seguir un estudiante

select alumno.nombre, carrera.duracionCarrera,carrera.nombreCarrera
from alumno
on alumno.idCarrera = carrera.id
-- Este es el nombre de la tabla en la cual se encuentra la foreign key
order by 2 desc -- 2 hace referencia a la columna "carrera.duracionCarrera"

-- Genero que mas se repite materias
select genero, count(*) as materias_reprobadas
from alumno group by 1;

select alumno.nombre, becas.tipoBeca, 
