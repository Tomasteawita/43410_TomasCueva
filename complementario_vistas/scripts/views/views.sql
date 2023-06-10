USE restanalytics;

CREATE OR REPLACE VIEW VW_PLAY_GAME_COMPLETED_OK AS (
	SELECT g.* -- Esto trae todas las columna de la tabla game
	FROM play AS p JOIN game AS g -- Utilizo apodos para acortar la sintaxis
	ON p.id_game = g.id_game 
	WHERE p.completed = 1
	GROUP BY 1,2,3,4,5
);


SELECT COUNT(*) FROM customers;

/*
Opciones:
- total a pagar por venta

- Cantidad de ordenes por cliente, mostrando el nombre del cliente
- Cantidad de ventas por restaurante
- el monto total por venta
- Preferencia de clientes
- Restaurantes con más ventas

*/

-- TOTAL POR VENTA
-- dishes_per_sale -- id_sale QUANTITY
-- dishes price

SELECT COUNT(*) FROM dishes_per_sale; -- 16999
SELECT COUNT(*) FROM sales; -- 10000
SELECT COUNT(*) FROM dishes; -- 71

SELECT s.id AS sale_id, SUM(d.price * dps.quantity) AS total_amount
FROM sales AS s
JOIN dishes_per_sale AS dps ON s.id = dps.id_sale
JOIN dishes AS d ON dps.id_dish = d.id
GROUP BY s.id, s.date_time, s.type_consumption, s.id_restaurant, s.id_customer;

SELECT id_sale, id_dish FROM dishes_per_sale LIMIT 10;

SELECT dps.id_sale, dps.id_dish, d.price 
FROM dishes AS d 
JOIN dishes_per_sale AS dps ON dps.id_dish = d.id;