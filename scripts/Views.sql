USE GAMMER;
SHOW TABLES;

SHOW FULL TABLES;
-- Voy vamos a ver vistas
-- Creo una vista
-- estructura: esquema.VW_NOMBRE_QUE_QUIERA
CREATE OR REPLACE VIEW gammer.VW_SYSTEM_USER_NAME_LAST_NAME AS (
	SELECT first_name,last_name
	FROM system_user
	WHERE lower(email) LIKE '%webnode.com%'
);
-- Llamo a una vista
SELECT * FROM VW_SYSTEM_USER_NAME_LAST_NAME;


-- RESPUESTA DE LA CLASE
select count(*) FROM game; -- 100
SELECT COUNT(*) FROM play; -- 977
-- Primero me fijo la tabla con más registros y utilizo esa a la izquierda del JOIN
SELECT g.* -- Esto trae todas las columna de la tabla game
FROM play AS p JOIN game AS g -- Utilizo apodos para acortar la sintaxis
ON p.id_game = g.id_game 
WHERE p.completed = 1
GROUP BY 1,2,3,4,5;-- Reemplazo el DISTINTC por esta sintaxis que es más eficiente a nivel de velocidad

-- Segundo hago la vista
CREATE OR REPLACE VIEW VW_PLAY_GAME_COMPLETED_OK AS (
	SELECT g.* -- Esto trae todas las columna de la tabla game
	FROM play AS p JOIN game AS g -- Utilizo apodos para acortar la sintaxis
	ON p.id_game = g.id_game 
	WHERE p.completed = 1
	GROUP BY 1,2,3,4,5
);
