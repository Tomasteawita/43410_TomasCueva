# Utiliza una imagen base de MySQL
FROM mysql:latest

# Define el volumen en el cual se almacenarán los datos de MySQL
VOLUME ./MySQL

# Expone el puerto 3306 para poder acceder a la base de datos
EXPOSE 3306
