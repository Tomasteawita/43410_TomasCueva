# 43410_TomasCueva

## Crear el ambiente
1. creamos el directorio MySQL en el directorio de nuestro proyecto:
```bash
mkdir MySQL
```

2. En el mismo directorio:
```bash
docker-compose up -d
```

3. Verificamos que testé corriendo con:
```bash
docker ps
```

4. Para conectarnos a MySQL client dentro del contenedor usamos:
```bash
docker exec -it NOMBRE_CONTENEDOR mysql -u root -p
#Cambia el nombre del contenedor por el nombre que ves en la columna NAME al hacer docker ps
#En mi caso docker exec -it proyectofinal-db-1 mysql -u root -p
```

5. Nos va a pedir la contraseña, utilizamos la misma que está dentro del archivo docker-compose.yml