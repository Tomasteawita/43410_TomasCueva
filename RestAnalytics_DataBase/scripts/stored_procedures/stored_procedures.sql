USE restanalytics;

-- SP para ordenar
DROP PROCEDURE IF EXISTS SP_ORDER_TABLE;
DELIMITER $$
CREATE PROCEDURE SP_ORDER_TABLE(
    IN entity VARCHAR(100),
    IN field VARCHAR(100),
    IN order_value CHAR(4)
)
BEGIN
    SET @query = CONCAT('SELECT * FROM ',entity ,' ORDER BY ',field,' ',order_value,';');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$
DELIMITER;


-- SP para insertar un nuevo restaurante
DROP PROCEDURE IF EXISTS SP_ADD_RESTAURANT;
DELIMITER $$
CREATE PROCEDURE SP_ADD_RESTAURANT(
    IN restaurant_name VARCHAR(75),
    IN localization VARCHAR(75),
    IN ceo VARCHAR(75)
)
BEGIN
    INSERT INTO restaurants(name_restaurant, direction, CEO)
    VALUES (restaurant_name, localization, ceo);
END$$
DELIMITER;

CALL SP_ADD_RESTAURANT("Carpinchos asaderia", "Calle 51 1890", "Carlos Altamiranda")
SELECT * FROM restaurants;

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

CALL SP_GET_RESTAURANT_DISHES(10);
