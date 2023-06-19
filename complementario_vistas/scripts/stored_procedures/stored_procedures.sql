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

--SP para insertar datos de ventas en la base de datos
/*
Primera es recomendable utilizar el proceso SP_GET_RESTAURANT_DISHES para saber que platos son del
restaurante del que realizo la venta.
Posteriormente se pasa a llenar los parametros solicidados de la siguiente forma

IN costumer_id: Un id de costumer
IN restaurant_id: Un id de costumer
IN ids_dishes: Se debe pasar una lista de IDs separado por comas (",") y  sin espacios, ejemplo : "1,2,30,31"
IN quantity_dihes: Se debe pasar una lista de numeros(que representa la cantidad de cada plato) en el orden 
de acuerdo al orden en el que se presentan los platos en el parametro anterior, ejemplo:
Si se pasa "1,2,30,31", el parametro quantity_dihes deberia recibir "2,1,1,3" que corresponde a:
id plato 1 cantidad 2
id plato 2 cantidad 1
id plato 30 cantidad 1
id plato 31 cantidad 3
IN consumption: solo puede recibir "delivery" o "restaurant"
*/
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
/*La idea inicial de este procedimiento es que una vez que se guarden los datos de la venta de la linea 100 a la 101,
comienze una secuencia para poder guardar los datos en la tabla transaccional "dishes_per_sale" con los parametros
ids_dishes y quantity_dishes, sin embargo no logre que se guarden los datos dentro de la tabla dishes_per_sale
por alguna razon guarda los datos de la venta (sale) pero no de los platos por venta (dishes_per_sale)*/
