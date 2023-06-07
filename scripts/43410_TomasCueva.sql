DROP SCHEMA IF EXISTS RestAnalytics;
CREATE SCHEMA IF NOT EXISTS RestAnalytics;
USE RestAnalytics;

DROP TABLE IF EXISTS restaurants;
CREATE TABLE restaurants(
    id INT AUTO_INCREMENT,
    name_restaurant VARCHAR(75) NOT NULL,
    direction VARCHAR(75) NOT NULL,
    CEO VARCHAR(75),
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS sales;
CREATE TABLE sales(
    id INT AUTO_INCREMENT,
    date_time TIMESTAMP NOT NULL,
    type_consumption ENUM('delivery','restaurant') NOT NULL,
    direction_delivery VARCHAR(75), 
    total_price DECIMAL(10,2) NOT NULL,
    id_restaurant INT NOT NULL,
    FOREIGN KEY (id_restaurant) REFERENCES restaurants(id)
    ON DELETE RESTRICT,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS administratives;
CREATE TABLE administratives(
    id INT AUTO_INCREMENT,
    DNI INT NOT NULL,
    name_administrative VARCHAR(75),
    last_name VARCHAR(75) NOT NULL,
    email VARCHAR(120) NOT NULL,
    password_administratives VARCHAR(120) NOT NULL,
    id_restaurant INT NOT NULL,
    FOREIGN KEY (id_restaurant) REFERENCES restaurants(id)
    ON DELETE RESTRICT,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS dishes;
CREATE TABLE dishes(
    id INT AUTO_INCREMENT,
    name_dish VARCHAR(75) NOT NULL,
    description_dish VARCHAR(255) ,
    id_restaurant INT NOT NULL,
    category VARCHAR(75),
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_restaurant) REFERENCES restaurants(id)
    ON DELETE RESTRICT,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS dishes_per_sale;
CREATE TABLE dishes_per_sale(
    id INT AUTO_INCREMENT,
    id_dish INT NOT NULL,
    id_sale INT NOT NULL,
    FOREIGN KEY (id_dish) REFERENCES dishes(id) ON DELETE RESTRICT,
    FOREIGN KEY (id_sale) REFERENCES sales(id) ON DELETE RESTRICT,
    PRIMARY KEY(id)
);
