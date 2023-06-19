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
DROP PROCEDURE IF EXISTS SP_ORDER_TABLE;
DELIMITER $$
CREATE PROCEDURE SP_ORDER_TABLE(
    IN entity VARCHAR(100),
    IN field VARCHAR(100),
    IN order_value CHAR(4) DEFAULT 'ASC'
)
BEGIN
    -- Construye una consulta dinámica utilizando el nombre de la tabla proporcionado
    SET @query = CONCAT('SELECT * FROM ',entity ,' ORDER BY ',field,' ',order_value,';');
    
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$
DELIMITER ;


-- SP para insertar un nuevo restaurante
DROP PROCEDURE IF EXISTS SP_ADD_RESTAURANT;
DELIMITER $$
CREATE PROCEDURE SP_ADD_RESTAURANT(
    IN restaurant_name VARCHAR(75),
    IN localization VARCHAR(75),
    IN ceo VARCHAR(75)
)
BEGIN
    INSERT INTO restaurants(name_restaurant, direction. CEO)
    VALUES (restaurant_name, localization, ceo)
END$$
DELIMITER;


-- SP de una consulta para conocer los platos de un restaurante

DROP PROCEDURE IF EXISTS SP_GET_RESTAURANT_DISHES;
DELIMITER $$
CREATE PROCEDURE SP_GET_RESTAURANT_DISHES(
    IN restaurant_id INT
)
BEGIN
    SELECT id, name_dish 
    FROM dishes
    WHERE id_restaurant = restaurant_id;
END$$
DELIMITER;

--SP para insertar datos en la base de datos
DROP PROCEDURE IF EXISTS SP_ADD_COMPLETE_SALE;
DELIMITER $$
CREATE PROCEDURE SP_ADD_COMPLETE_SALE(
    IN customer_id INT,
    IN restaurant_id INT,
    IN ids_dishes VARCHAR(20),
    IN quantity_dishes VARCHAR(20),
    IN consumption CHAR(11)
)
BEGIN
    DECLARE sale_id INT;
    DECLARE length_ids_dishes INT;
    DECLARE length_quantity_dishes INT;
    DECLARE value_dish INT;
    DECLARE value_quantity INT;

    IF consumption IS NULL THEN
        SET consumption = 'restaurant';
    END IF;

    INSERT INTO sales (date_time, type_consumption, id_restaurant, id_customer)
    VALUES (NOW(), consumption, restaurant_id, customer_id);
    
    SET sale_id = LAST_INSERT_ID();
    SET length_ids_dishes = 1;
    SET length_quantity_dishes = 1;
    SET @dishes = ids_dishes;
    SET @quantities = quantity_dishes;
    
    WHILE length_ids_dishes > 0 DO
        SET length_ids_dishes = FIND_IN_SET(',', @dishes);
        SET length_quantity_dishes = FIND_IN_SET(',', @quantities);
        
        IF length_ids_dishes > 0 THEN
            SET value_dish = TRIM(SUBSTRING(@dishes, 1, length_ids_dishes - 1));
            SET @dishes = SUBSTRING(@dishes, length_ids_dishes + 1);

            SET value_quantity = TRIM(SUBSTRING(@quantities, 1, length_quantity_dishes - 1));
            SET @quantities = SUBSTRING(@quantities, length_quantity_dishes + 1);

            INSERT INTO dishes_per_sale(id_dish, id_sale, quantity)
            VALUES (value_dish, sale_id, value_quantity);
        END IF;
    END WHILE;
END$$
DELIMITER ;
