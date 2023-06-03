-- Insercion masiva de datos
/*
Habitualmente y lastimosamente vamos a obtener los datos
a trvez de planillas de calculos hechas como el traste y esto
lo teneoms que limpiar para poder subirlo a la base de datos


*/


/**/

CREATE TABLE `productos`(
    `id` int AUTOINCREMENT NOT NULL,
    `nombre` VARCHAR(60) NOT NULL,
    `existencia` int NOT NULL DEFAULT '0',
    `precio` FLOAT NOT NULL DEFAULT '0',
    `precio_compra` FLOAT NOT NULL DEFAULT '0',
    PRIMARY KEY(id)
);

