USE RestAnalytics;
SELECT * FROM dishes;

DROP TABLE IF EXISTS auditorie;
CREATE TABLE auditorie (
    id INT PRIMARY KEY AUTO_INCREMENT,
    operation_type ENUM('INSERT', 'UPDATE', 'DELETE'),
    table_name VARCHAR(50),
    column_name VARCHAR(50),
    old_value VARCHAR(255),
    user VARCHAR(100),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS TRG_AUDITORIE_DISHES;
-- Este trigger esta inclompleto, debe tener todos los campos dentro de los ifs
CREATE TRIGGER TRG_AUDITORIE_DISHES
AFTER UPDATE ON dishes
FOR EACH ROW
BEGIN
    DECLARE column_name VARCHAR(50);
    DECLARE old_value VARCHAR(255);
    
    IF (NEW.name_dish <> OLD.name_dish) THEN
        SET column_name = 'name_dish';
        SET old_value = OLD.name_dish;
    ELSEIF (NEW.category <> OLD.category) THEN
        SET column_name = 'category';
        SET old_value = OLD.category;
    ELSEIF (NEW.price <> OLD.price) THEN
        SET column_name = 'price';
        SET old_value = CAST(OLD.price AS CHAR);
    END IF;
    
    -- Registro en la tabla "auditorie"
    INSERT INTO auditorie (operation_type, table_name, column_name, old_value, user)
    VALUES ('UPDATE', 'dishes', column_name, old_value, CURRENT_USER());
END;

UPDATE dishes
SET price = 10
WHERE name_dish = "Classic Burger";

SELECT * FROM auditorie;

-- -------------------------------------

DROP TRIGGER IF EXISTS TRG_AUDITORIE_CUSTOMERS;

DELIMITER $$
CREATE TRIGGER TRG_AUDITORIE_CUSTOMERS
BEFORE DELETE  ON customers
FOR EACH ROW
BEGIN
    INSERT INTO auditorie(operation_type, table_name, old_value, user)
    VALUES("DELETE", "customers",CONCAT("id: ", OLD.id, "DNI: ", OLD.DNI, "last name: ", OLD.last_name), CURRENT_USER());
END;$$
DELIMITER ;



ALTER TABLE sales
MODIFY id_customer INT NULL;

ALTER TABLE sales
DROP FOREIGN KEY `sales_ibfk_2`,
ADD CONSTRAINT `sales_ibfk_3`
FOREIGN KEY (id_customer)
REFERENCES customers(id)
ON DELETE SET NULL;

DELETE FROM customers
WHERE customers.id = 1

ALTER TABLE sales
DROP FOREIGN KEY `sales_ibfk_3`;

ALTER TABLE sales
ADD CONSTRAINT `sales_ibfk_2`
FOREIGN KEY (id_customer)
REFERENCES customers(id)
ON DELETE RESTRICT;

SELECT * FROM customers;

SELECT * FROM auditorie;