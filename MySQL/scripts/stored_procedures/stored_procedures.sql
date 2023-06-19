USE restanalytics;

/*El primer S.P. debe permitir indicar a traves de un parametro
el campo de ordenamiento de un atabla y mediante un segundo parametro, si el
orden es descendente o ascendente*/

/*El otro S.P. que creares, puede
1. Insertar registros en una tabla de tu proueecto
2: Elmiminat algun registro especifico de una tabla de tu proyecto

Agregar documentación
*/

-- SP para ordenar
DROP PROCEDURE IF EXISTS SP_ORDER_BY;




--SP para insertar datos en la base de datos
DROP PROCEDURE IF EXISTS SP_ADD_ORDER;
DELIMITER $$
CREATE PROCEDURE SP_ADD_ORDER(
    IN entity VARCHAR(100),
    IN order CHAR(4)
)
BEGIN
    -- Construye una consulta dinámica utilizando el nombre de la tabla proporcionado
    SET @consulta = CONCAT('UPDATE ', tabla_nombre, ' SET columna = valor WHERE condicion;');
    
    -- Ejecuta la consulta dinámica
    PREPARE stmt FROM @consulta;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$
DELIMITER ;
