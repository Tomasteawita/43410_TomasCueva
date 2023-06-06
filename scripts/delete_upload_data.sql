/* INTEGRIDAD REFERENCIAL
Garantiza que la clave externa de una tabla de referencia
, coincida siempre con una fila valida que exista en otra tabla,
Esto para sincronizar operaciones UPDATE y DELETE

Existenn tres tipos de manera teorica

* Debil
* parcial
* completa

La diferencia entre las tres es la cantidad de claves entre cada una
si tiene foranea y ´primaria es completa

si tiene alguna de las dos, va a ser parcial

si tiene soso clave primaria, va a ser debil
*/
/* RESTRICCIONES

    restrucciion de unicidad: Que no tenga repetido registros  en mi base de datos
    restriccion de valor no nujlo: Cuando colocamos NOT NULL en nuestra tabla
    restriccion de clave primaria: Colocar siempre clave primaria
    restriccion de integridad referencial: Foreing key
   
   ACCIONES CON RESTRICCION DE INTEGRIDAD

   CASCADED: Genero que cualquier actualizacion y eliminacion en alguna de las tablas relacioadas impacte masivamente en toodas
   Cada eliminacion u actualizacion que haga en una tabla, tambien lo va a hacer en las relacionadas
   SET NULL: 
   NO ACTION :,Va a dejar que de un error por llave foranea. Accion de restriccion de identidad que cumple la condicion de que las llaves relacionadas se cumplan 
   RESTRICT: Accion de restriccion de identidad que cumple la condicion de que las llaves relacionadas se cumplan

   Son las cuatro acciones que puedo definir dentro de mi base de datos cuando creo una tabla
   Se aplican directamente sobre las calusulas ON DELETE y ON UPDATE




*/

/**/
/**/
/**/
/**/
/**/
/**/
/**/

/**/