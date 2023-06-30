-- Verificar el valor de la variable @@autocommit (siempre es 1)
SELECT @@autocommit;

-- Cambiar el valor de la variable @autocommit a 1 y luego a 0¿
SET @autocommit = 0;

-- Seleccionar registros de varias tablas
USE RestAnalytics;
SELECT * FROM restaurants;
SELECT * FROM administratives;
SELECT * FROM sales;
SELECT * FROM dishes;
SELECT * FROM dishes_per_sale LIMIT 5;

-- Iniciar una transacción
START TRANSACTION;

-- Actualizar precios de platos de un restaurante específico (id 5 - Pizzalicius)
-- Mostrar los precios actuales antes de la actualización
SELECT price, name_dish, id_restaurant FROM dishes
WHERE id_restaurant = 5;

-- Actualizar precios multiplicándolos por 1.2
UPDATE dishes
SET price = price * 1.2
WHERE id_restaurant = 5;

-- Hacer un rollback de la transacción
ROLLBACK;

-- Hacer un commit de la transacción
COMMIT;

-- Borrar información de un restaurante específico
SAVEPOINT sp0;
SHOW CREATE TABLE dishes_per_sale;

-- Modificar restricciones de llaves foráneas
ALTER TABLE dishes_per_sale
DROP FOREIGN KEY `dishes_per_sale_ibfk_2`,
ADD CONSTRAINT `dishes_per_sale_ibfk_3`
FOREIGN KEY (id_sale)
REFERENCES sales(id)
ON DELETE CASCADE;

ALTER TABLE dishes_per_sale
DROP FOREIGN KEY `dishes_per_sale_ibfk_1`,
ADD CONSTRAINT `dishes_per_sale_ibfk_4`
FOREIGN KEY (id_dish)
REFERENCES dishes(id)
ON DELETE CASCADE;

DELETE FROM sales
WHERE id_restaurant = 5;

DELETE FROM administratives
WHERE id_restaurant = 5;

DELETE FROM dishes
WHERE id_restaurant = 5;

DELETE FROM restaurants
WHERE id = 5;

-- Restaurar restricciones de llaves foráneas
ALTER TABLE dishes_per_sale
DROP FOREIGN KEY `dishes_per_sale_ibfk_3`,
ADD CONSTRAINT `dishes_per_sale_ibfk_2`
FOREIGN KEY (id_sale)
REFERENCES sales(id)
ON DELETE RESTRICT;

ALTER TABLE dishes_per_sale
DROP FOREIGN KEY `dishes_per_sale_ibfk_4`,
ADD CONSTRAINT `dishes_per_sale_ibfk_1`
FOREIGN KEY (id_dish)
REFERENCES dishes(id)
ON DELETE RESTRICT;

-- Hacer un rollback al punto de guardado (savepoint) sp0
ROLLBACK TO sp0;

-- Hacer un commit de la transacción
COMMIT;

-- Crear un punto de guardado (savepoint) sp1 y luego hacer un rollback
SAVEPOINT sp1;
INSERT INTO restaurants (name_restaurant, direction, CEO)
VALUES('Carmelos tacos', 'Fronteriz 943', 'Gabriela Gomez');

ROLLBACK TO sp1;

-- Hacer un commit de la transacción
COMMIT;
