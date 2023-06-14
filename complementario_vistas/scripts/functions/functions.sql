USE restanalytics;

SELECT COUNT(*) FROM restaurants; --10
SELECT COUNT(*) FROM dishes; -- 71
SELECT COUNT(*) FROM sales; -- 10.000
SELECT COUNT(*) FROM dishes_per_sale; -- 16999

-- Monto total por ventas del día actual de un restaurante (id)
SELECT s.date_time ,s.id AS sale_id, SUM(d.price * dps.quantity) AS total_amount
FROM dishes_per_sale dps
LEFT JOIN sales s ON s.id = dps.id_sale
LEFT JOIN dishes d ON dps.id_dish = d.id
WHERE (s.id_restaurant = 5) 
AND (DAY(s.date_time) = 10)
GROUP BY 1,2;



DROP FUNCTION IF EXISTS FN_TOTAL_REVENUE;
DELIMITER $$
CREATE FUNCTION FN_TOTAL_REVENUE(
    restaurant INT,
    day_selected INT
) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_revenue DECIMAL(10,2);
    DECLARE current_year INT; 
    SET current_year = YEAR(CURDATE());
    SELECT SUM(d.price * dps.quantity) INTO total_revenue
    FROM dishes_per_sale dps
    LEFT JOIN sales s ON s.id = dps.id_sale
    LEFT JOIN dishes d ON dps.id_dish = d.id
    WHERE s.id_restaurant = restaurant 
    AND YEAR(s.date_time) = current_year 
    AND DAY(s.date_time) = day_selected;
    
    RETURN total_revenue;
END$$
DELIMITER;
-- Invoco la funcion
SELECT restanalytics.FN_TOTAL_REVENUE(1, 5) AS restaurante;


-- Plato más vendido de un restaurante
-- Resuelvo consulta
SELECT d.name_dish
FROM dishes_per_sale dps
LEFT JOIN sales s ON dps.id_sale = s.id 
LEFT JOIN dishes d ON d.id = dps.id_dish
WHERE s.id_restaurant = 5
GROUP BY d.id
ORDER BY SUM(dps.quantity) DESC
LIMIT 1;

-- Creo la funcion
DROP FUNCTION IF EXISTS FN_TOP_DISH_SELLING;
DELIMITER $$
CREATE FUNCTION FN_TOP_DISH_SELLING(
    restaurant_id INT
) 
RETURNS VARCHAR(75)
DETERMINISTIC
BEGIN
    DECLARE top_dish VARCHAR(75);
    
    SELECT d.name_dish INTO top_dish
    FROM dishes d
    INNER JOIN dishes_per_sale dps ON dps.id_dish = d.id
    INNER JOIN sales s ON s.id = dps.id_sale
    WHERE s.id_restaurant = restaurant_id
    GROUP BY d.id
    HAVING SUM(dps.quantity) = (
        SELECT MAX(total_quantity)
        FROM (
            SELECT SUM(dps.quantity) AS total_quantity
            FROM dishes_per_sale dps
            INNER JOIN sales s ON s.id = dps.id_sale
            WHERE s.id_restaurant = restaurant_id
            GROUP BY dps.id_dish
        ) AS t
    );
    
    RETURN top_dish;
END$$
DELIMITER ;

/*Decidí optar por el uso del HAVING ya que no me parecia muy bien utilizar
el LIMIT 1 para forzar a que de un solo resultado a través del LIMIT*/