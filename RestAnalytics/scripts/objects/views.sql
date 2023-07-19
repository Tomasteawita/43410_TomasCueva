USE RestAnalytics;


CREATE OR REPLACE VIEW VW_TOTAL_SALES_MOUNT AS(
SELECT s.id AS sale_id, SUM(d.price * dps.quantity) AS total_amount
FROM dishes_per_sale dps
LEFT JOIN sales s ON s.id = dps.id_sale
LEFT JOIN dishes d ON dps.id_dish = d.id
GROUP BY s.id);

SELECT * FROM VW_TOTAL_SALES_MOUNT;


CREATE OR REPLACE VIEW VW_ORDERS_PER_CUSTOMER AS(
SELECT c.name_customer, c.last_name, c.DNI, COUNT(s.id) AS order_count
FROM sales s
JOIN customers c ON s.id_customer = c.id 
GROUP BY c.id
ORDER BY order_count DESC);

SELECT * FROM VW_ORDERS_PER_CUSTOMER;

CREATE OR REPLACE VIEW VW_TOTAL_COLLECTED_RESTAURANTS AS(
SELECT r.name_restaurant, COALESCE(SUM(subquery.total_amount), 0) AS total_collected_amount
FROM (
    SELECT s.id_restaurant, SUM(d.price * dps.quantity) AS total_amount
    FROM dishes_per_sale dps
    JOIN sales s ON s.id = dps.id_sale
    JOIN dishes d ON dps.id_dish = d.id
    GROUP BY s.id_restaurant
) AS subquery
JOIN restaurants r ON r.id = subquery.id_restaurant
GROUP BY r.name_restaurant
ORDER BY total_collected_amount DESC);

SELECT * FROM VW_TOTAL_COLLECTED_RESTAURANTS;

CREATE OR REPLACE VIEW VW_ORDERS_BY_RESTAURANTS AS(
SELECT r.name_restaurant, 
       COUNT(CASE WHEN s.type_consumption = 'delivery' THEN 1 END) AS delivery_orders,
       COUNT(CASE WHEN s.type_consumption = 'restaurant' THEN 1 END) AS restaurant_orders
FROM sales s
JOIN restaurants r ON s.id_restaurant = r.id
GROUP BY r.name_restaurant);

SELECT * FROM VW_ORDERS_BY_RESTAURANTS;

CREATE OR REPLACE VIEW VW_TOTAL_SPENT_PER_CUSTOMER AS(
SELECT c.name_customer, 
       c.last_name, 
       SUM(d.price * dps.quantity) AS total_spent
FROM dishes_per_sale dps
JOIN sales s ON dps.id_sale = s.id
JOIN dishes d ON dps.id_dish = d.id
JOIN customers c ON s.id_customer = c.id
GROUP BY c.name_customer, c.last_name
ORDER BY total_spent DESC);

SELECT * FROM VW_TOTAL_SPENT_PER_CUSTOMER;