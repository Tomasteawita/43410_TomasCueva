USE RestAnalytics;

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


-- Función para devolver el monto total recaudado utilizando una fecha especifica armada desde los parametros de la funcion
DROP FUNCTION IF EXISTS FN_TOTAL_REVENUE;
DELIMITER $$
CREATE FUNCTION FN_TOTAL_REVENUE( restaurant INT, day_selected INT, month_selected INT, year_selected INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_revenue DECIMAL(10,2);
    SELECT SUM(d.price * dps.quantity) INTO total_revenue
    FROM dishes_per_sale dps
    INNER JOIN sales s ON s.id = dps.id_sale
    INNER JOIN dishes d ON dps.id_dish = d.id
    WHERE s.id_restaurant = restaurant 
    AND YEAR(s.date_time) = year_selected
    AND MONTH(s.date_time) = month_selected 
    AND DAY(s.date_time) = day_selected;
    
    RETURN total_revenue;
END$$
DELIMITER ;

-- Invoco la funcion
SELECT restanalytics.FN_TOTAL_REVENUE(1, 13,6,2023) AS restaurante;
SELECT * FROM sales;

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

-- Devuelve el plato más vendido historicamente del restaurante pasado por parametro
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
    FROM (
        SELECT dps.id_dish, SUM(dps.quantity) AS total_quantity
        FROM dishes_per_sale dps
        INNER JOIN sales s ON s.id = dps.id_sale
        WHERE s.id_restaurant = restaurant_id
        GROUP BY dps.id_dish
        ORDER BY total_quantity DESC
        LIMIT 1
    ) AS t
    INNER JOIN dishes d ON d.id = t.id_dish;
    
    RETURN top_dish;
END$$
DELIMITER ;

SELECT RestAnalytics.FN_TOP_DISH_SELLING(1) AS best_dish;