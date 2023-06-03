/*
En DML veremos insert,update y delete

*/

USE gammer;

/*La mayoria de contrataciónes son por parte de esta parte del standar SQL
el DML


componentes:
* Insert: Agregar registros a una tabla
* update; Permite modificar o actualizar registros ya isnertados
* Delete: me permite eliminar registros de la tabla
* truncate: es un 4to componenete que se comporta bruscamente porque se encarga de eliminar toda la informacion dentro de una tabla a nivel de registro}
es una especio intermedia entre el drop y el delete

El drom elimina las cosas a nivel de estructura
el delete controlado, alimina los registros que yo le indico
EL truncate elimina todos los registros pero me mantiene la estrucutra de la tabla,
elimina todos los registros pero no la tabla

Para inserm, update y delete se tiene que hacer en un orden adecuado


¿Como se utiliza el insert?
INSERT INTO nombre_de_tabla (campo1,canpo2,campo3,canpo4)
VALUES(dato1,dato2,dato3m...);

¿Que es importantes para el insert?
Que los tipos de datos coincidan obviamente con los campos 


# Update
UPDATE nombre_de_tabla SET campo2 = 'dato2';

# Delete
DELETE FROM nomnre_tabla WHERE (campo = 'dato');

cd PneDrive/Escritorio/SQL
*/

-- Ejemplos en vivo
/*
TABLAS UTILIZADAS
STUDEDNTS
LIBROS
*/

-- SINTAXIS DEL INSERT
-- L que hace esta clausuka se que hace que todos los querys de UPDATE y DELETA tengan si o si una clausula WHERE
SET SQL_SAFE_UPDATES = 0;


INSERT INTO nombre_de_tabla (campo1,campo2,campo3)
VALUES(dato1,dato2,dato3);
/*Como buena practica, primero escribo los campos NOT NULL
para ordenar prioridades
*/
-- Ejemplo
INSERT INTO dml.students(StudedntId,FirstName,Class,Age)
VALUES                  (100,'luisa','rodriguez','java',44)


-- OTRA FORMA
INSERT INTO dml.students -- al dejar esto solo, hace referencia a que quiero insertar informacion a todas las columnas
VALUES                  (100,'luisa','rodriguez','java',44)
-- Inserts de manera masiva
INSERT INTO dml.students (StudedntId,FirstName,Class,Age)
VALUES                  (100,'luisa','rodriguez','java',19),
                        (101,'jorge','rodriguez','Python',21),
                        (102,'juan','rodriguez','java',20),
                        (103,'pepe','rodriguez','SQL',25)
-- de esta forma inserto 4 registros a una misma tabla
-- el ejemplo del insert masivo no lo puedo ejecutar dos veces
-- ya que va a imprimir un error porque no se puede tener ID duplicados

-- Hay herramientas que nos permiten tener un nivel más de seguridad
/*
update nombre_tabla set
columna_a_modificar = se_asigna_lo_queremos_que_lleve
where columna_a_buscar = se_asigna_lo_que_buscamos

*/

--EJEMPLO
UPDATE libros SET edicion = 'temporal',
editorial = 'carvajal sa',
autor = 'pedro juan'
WHERE cantidad is not null;

-- DELETE BUENAS PRACTICAS
-- CREO UNA TABLA BACKUP
CREATE TABLE BKP_libros AS
(SELECT * FROM WHERE 1 = 1);

DELETE FROM libros WHERE disponible = 1;

-- si ejecuto esto sin el where esta mal
DELETE FROM libros; -- Esto no se va a poder ejecutar su utilizo SQL_SAFE_UPDATES = 0;}
-- Ya que lo que hay que utilizazr es el TRUNCATE
TRUNCATE libros

-- Repoblamos la tabkla libros con el backup
INSERT INTO libros (SELECT * FROM BKP_libros);

-- DML 2
/*El DML nos permite eliminar agregar y modificar información a nivel ded datos y de tablas*/

-- EJEMPLO
-- Eliminar registros
DELETE FROM libros WHERE id = 101;
-- Eliminar registros masivos
DELETE FROM libros WHERE id in (101,102,103);
-- Eliminar registros masivos y eliminar registros masivos en otra tabla
DELETE FROM libros
WHERE id in (101,102,103)
AND id not in (101,102,103);
-- EJEMPLO
-- Modificar registros
UPDATE libros SET edicion = 'temporal',
editorial = 'carvajal sa',
autor = 'pedro juan'
WHERE cantidad is not null;

-- INSERTS de manera masiva usando subconsultas
-- Buena practica, siempre crear la tabla backup
CREATE TABLE BKP_libros AS
(SELECT * FROM WHERE 1 = 1);
INSERT INTO libros (SELECT * FROM BKP_libros);

-- Crearemos una nueva tabla ADVERGAME
CREATE TABLE IF NOT EXISTS ADVERGAME(
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- game.id_game
    nombre VARCHAR(50) NOT NULL, --game.name
    nivel VARCHAR(50) NOT NULL, -- level_game.description
    descripcion VARCHAR(50) NOT NULL, -- game.description
    dificultad_juego VARCHAR(50) NOT NULL, -- play.completed
    precio NUMERIC(8,2) NOT NULL, 
    disponible INTEGER NOT NULL,
    fecha DATE NOT NULL, -- comment.first_date
    imagen VARCHAR(20) NOT NULL, 
    empresa_desarrolladora VARCHAR(50) NOT NULL,
    tiempo_de_juego TIME,
    clasificacion_juego VARCHAR(50) NOT NULL, -- commentary.commentary
    id_level INT, -- game.id_level
    id_class INT, -- game.id_class
    PRIMARY KEY (id)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- BUENA PRACTICA:
-- nos fijamos que tablas tienen más registros
SELECT COUNT(*) FROM game; -- 992
SELECT COUNT(*) FROM level_game; -- 800
SELECT COUNT(*) FROM play; -- 500
SELECT COUNT(*) FROM comment; -- 400
SELECT COUNT(*) FROM commentary; --120

-- Create a query with necessarys fields
SELECT game.id_game, game.name, game.descripcion, game.id_level,
        game.id_class, level_game.description, play.completed.
        comment.first_DATE
-- join tables to descending order
from game join level_game join play join comment
on
    game.id_game = play.id_game
    and game.id_level = level_game.id_level
    and comment.id_game = game.id_game
; --When execute this query, it return all registers of the query   
-- Then, we create a table using the above query as a subquery

CREATE TABLE IF NOT EXISTS ADVERGAME AS (
    SELECT game.id_game, game.name, game.descrition, game.id_level,
        game.id_class, level_game.description as descripcion, play.completed.
        comment.first_DATE
    from game join level_game join play join comment
    on
        game.id_game = play.id_game
        and game.id_level = level_game.id_level
        and comment.id_game = game.id_game
    
);
-- Finally, add the missing fields 
ALTER TABLE ADD PRIMARY KEY (id);
ALTER TABLE ADVERGAME ADD COLUMN precio NUMERIC(8,2) NOT NULL;



-- we do the same but with a view

CREATE OR REPLACE VIEW VW_ADVERGAME AS (
    SELECT game.id_game, game.name, game.descrition, game.id_level,
        game.id_class, level_game.description as descripcion, play.completed.
        comment.first_DATE
    from game join level_game join play join comment
    on
        game.id_game = play.id_game
        and game.id_level = level_game.id_level
        and comment.id_game = game.id_game
    
);

-- Another way to create a new table with available information is the next:
CREATE TABLE IF NOT EXISTS ADVERGAME(
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    nombre VARCHAR(50) NOT NULL, 
    nivel VARCHAR(50) NOT NULL, 
    descripcion VARCHAR(50) NOT NULL, 
    dificultad_juego VARCHAR(50) NOT NULL, 
    precio NUMERIC(8,2) NOT NULL, 
    disponible INTEGER NOT NULL,
    fecha DATE NOT NULL, 
    imagen VARCHAR(20) NOT NULL, 
    empresa_desarrolladora VARCHAR(50) NOT NULL,
    tiempo_de_juego TIME,
    clasificacion_juego VARCHAR(50) NOT NULL, 
    id_level INT, 
    id_class INT, 
    PRIMARY KEY (id)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- finally, insert information with the above query  
INSERT INTO ADVERGAME (id,nombre,nivel,descripcion,nivel,dificultad_juego,precio,disponible,fecha,
                        imagen,empresa_desarrolladora,tiempo_de_juego,clasificacion_juego,id_level,id_class)
            (SELECT game.id_game, game.name, game.descrition, game.id_level,
        game.id_class, level_game.description as descripcion, play.completed.
        comment.first_DATE
    from game join level_game join play join comment
    on
        game.id_game = play.id_game
        and game.id_level = level_game.id_level
        and comment.id_game = game.id_game)


--Crearemos a continuacaion 5 juegos en la tabla ADVERGAME
INSERT INTO ADVERGAME (nombre,descripcion,precio,disponible,fecha,imagen)
VALUES ('juego 1','juego 1 descripcion',100,1,'2020-01-01', 'juego 1 imagen'),
('juego 2','juego 2 descripcion',200,1,'2020-01-01', 'juego 2 imagen'),
('juego 3','juego 3 descripcion',300,1,'2020-01-01', 'juego 3 imagen'),
('juego 4','juego 4 descripcion',400,1,'2020-01-01', 'juego 4 imagen'),
('juego 5','juego 5 descripcion',500,1,'2020-01-01', 'juego 5 imagen');


-- Final, insertaremos los registros

