docker exec -it mysql-coder mysql -uroot -p --local-infile=1
# ingresamos contraseña cuando se nos pida

SET GLOBAL local_infile=1;

LOAD DATA LOCAL INFILE '/home/app/csv/restaurants.csv'
INTO TABLE restaurants
FIELDS TERMINATED BY ';'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/app/csv/administratives.csv'
INTO TABLE administratives
FIELDS TERMINATED BY ';'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/app/csv/dishes.csv'
INTO TABLE dishes
FIELDS TERMINATED BY ';'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/app/csv/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ';'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/app/csv/sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ';'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/app/csv/dishes_per_sale.csv'
INTO TABLE dishes_per_sale
FIELDS TERMINATED BY ';'
IGNORE 1 LINES;