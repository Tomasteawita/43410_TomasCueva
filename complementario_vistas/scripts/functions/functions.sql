USE restanalytics;



DROP FUNCTION IF EXISTS FN_GET_TOTAL_SPENT;
DELIMITER $$
CREATE FUNCTION FN_GET_TOTAL_SPENT(sale_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_spent INT;
    SET total_spent = (
        SELECT s.id AS sale_id, SUM(d.price * dps.quantity) AS total_amount
        FROM dishes_per_sale dps
        LEFT JOIN sales s ON s.id = dps.id_sale
        LEFT JOIN dishes d ON dps.id_dish = d.id
        WHERE s.id = sale_id
        GROUP BY s.id
    )
    RETURN total_spent;
END$$
DELIMITER;


DROP FUNCTION IF EXISTS FN_GET_SALES_BY_CATEGORY;
DELIMITER //
CREATE FUNCTION FN_GET_SALES_BY_CATEGORY(restaurant_id INT)
RETURNS TABLE(category VARCHAR(75), total_sales INT)
BEGIN
    DECLARE category_name VARCHAR(75);
    DECLARE sales_count INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR
        SELECT category, COUNT(*) AS total
        FROM dishes_per_sale dps
        INNER JOIN sales s ON dps.id_sale = s.id
        INNER JOIN dishes d ON dps.id_dish = d.id 
        WHERE s.id_restaurant = restaurant_id
        GROUP BY category;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_sales_by_category (
        category VARCHAR(75),
        total_sales INT
    );
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO category_name, sales_count;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        INSERT INTO temp_sales_by_category (category, total_sales)
        VALUES (category_name, sales_count);
    END LOOP;
    CLOSE cur;
    
    RETURN (
        SELECT *
        FROM temp_sales_by_category
    );
END //
DELIMITER;
