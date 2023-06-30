USE sys; --Cambia a la base de datos llamada "sys".

SHOW TABLES;
SELECT * FROM sys_config; /*Selecciona todos los registros de la tabla "sys_config" en la base de datos actual ("sys").*/
SELECT * FROM session; /*Selecciona todos los registros de la tabla "session" en la base de datos actual ("sys"). 
Esta tabla puede contener información sobre los usuarios conectados en ese momento, tiempos de consulta, etc.*/
SELECT * FROM version; /*Selecciona todos los registros de la tabla "version" en la base de datos actual ("sys"). 
Esta tabla puede contener información sobre la versión del sistema, detalles de la instalación, etc.*/

USE mysql; -- Cambia a la base de datos llamada "mysql".
SHOW TABLES;
SELECT * FROM db; /* Selecciona todos los registros de la tabla "db" en la base de datos actual ("mysql"). 
Esta tabla contiene información sobre las bases de datos existentes en el servidor MySQL.*/

SELECT * FROM user; /*Selecciona todos los registros de la tabla "user" en la base de datos actual ("mysql"). 
Esta tabla contiene información sobre los usuarios y los permisos asociados en el servidor MySQL.*/
SELECT * FROM server_cost; /*Selecciona todos los registros de la tabla "server_cost" en la base de datos actual ("mysql"). Esta tabla puede 
contener información sobre los costos del servidor y la configuración de recursos.*/

create user if not exists 'CuevaTomas'@'localhost' identified by 'TomasteawitaProyecta2002!'; /*Crea un usuario llamado 'CuevaTomas' con la contraseña especificada en el host 'localhost' 
si el usuario no existe previamente*/
create user if not exists 'AgustinCastillo'@'localhost' identified by 'Capy78f8d76@e112@@'; /*Crea un usuario llamado 'AgustinCastillo' con la contraseña especificada en el host 'localhost'
 si el usuario no existe previamente.*/
create user if not exists 'CarlosSaul'@'localhost' identified by 'f56d7sf56sd7a78f5fsda@';
create user if not exists 'DamiandPared'@'localhost' IDENTIFIED BY 'f7d73h29@d8d!fsfes';
create user if not exists 'IgnacioZurdo'@'localhost' IDENTIFIED BY 'f8d4j023f4!8few@9fwe';

GRANT SELECT ON RestAnalytics.* TO 'CuevaTomas'@'localhost'; --  Otorga el permiso SELECT en todas las tablas del esquema "RestAnalytics" al usuario 'CuevaTomas' en el host 'localhost'.

GRANT SELECT, INSERT, UPDATE ON RestAnalytics.* TO 'AgustinCastillo'@'localhost'; --Otorga los permisos SELECT, INSERT y UPDATE en todas las tablas del esquema "RestAnalytics" al usuario 'AgustinCastillo' en el host 'localhost'.

GRANT SELECT ON RestAnalytics.sales TO 'CarlosSaul'@'localhost'; -- Otorga el permiso SELECT en la tabla "sales" del esquema "RestAnalytics" al usuario 'CarlosSaul' en el host 'localhost'.
GRANT SELECT ON RestAnalytics.customers TO 'CarlosSaul'@'localhost'; -- Otorga el permiso SELECT en la tabla "customers" del esquema "RestAnalytics" al usuario 'CarlosSaul' en el host 'localhost'.
GRANT SELECT ON RestAnalytics.dishes TO 'CarlosSaul'@'localhost';
GRANT SELECT ON RestAnalytics.dishes_per_sale TO 'CarlosSaul'@'localhost';

GRANT SELECT, INSERT, UPDATE ON RestAnalytics.sales TO 'DamiandPared'@'localhost';
GRANT SELECT, INSERT, UPDATE ON RestAnalytics.customers TO 'DamiandPared'@'localhost';
GRANT SELECT, INSERT, UPDATE ON RestAnalytics.dishes TO 'DamiandPared'@'localhost';
GRANT SELECT, INSERT, UPDATE ON RestAnalytics.dishes_per_sale TO 'DamiandPared'@'localhost';

GRANT SELECT ON RestAnalytics.* TO 'IgnacioZurdo'@'localhost'; -- Otorga el permiso SELECT en todas las tablas del esquema "RestAnalytics" al usuario 'IgnacioZurdo' en el host 'localhost'.

