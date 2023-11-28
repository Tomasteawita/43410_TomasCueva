# Practica con este proyecto brindados por ChatGPT

¡Por supuesto! Aquí tienes algunos ejercicios que puedes practicar:

Realizar consultas simples (WHERE, ORDER BY):

Encuentra todos los platos que cuestan más de 10.00 y ordénalos por precio en orden descendente.
Realizar consultas complejas (GROUP BY, JOIN, UNION, Subconsultas):

Encuentra el total de ventas por cada tipo de consumo ('delivery', 'restaurant').
Une las tablas sales y customers para obtener una lista de ventas junto con la información del cliente.
Encuentra todos los platos que no se han vendido nunca.
Implementar al menos una función:

Crea una función para calcular el total de ventas de un plato específico.
Crear dos Vistas de datos (CREATE VIEW):

Crea una vista que muestre la información de los platos junto con el nombre del restaurante.
Crea una vista que muestre el total de ventas por plato.
Eliminar una tabla y/o sus datos cargados (DROP TABLE o TRUNCATE):

Elimina la tabla administratives.
Elimina todos los datos de la tabla sales.
Por favor, asegúrate de tener una copia de seguridad de tus datos antes de realizar operaciones de eliminación o truncamiento.

```SQL
USE RestAnalytics;


-- Encuentra todos los platos que cuestan más de 10.00 y ordénalos por percio en orden descendiente.
SELECT * 
FROM dishes
WHERE price > 10.00
ORDER BY price DESC;


SELECT * FROM sales;
SELECT * FROM dishes;
SELECT * FROM dishes_per_sale;


-- Encontrar el total $$$ de ventas por cada tipo de consumo ('delivery', 'restaurant').
SELECT dishes.price , dishes_per_sale.quantity
FROM dishes_per_sale
LEFT JOIN dishes
ON dishes.id = dishes_per_sale.id_dish
WHERE ; 
```