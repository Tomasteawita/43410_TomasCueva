load data local infile 
'C:\\Users\\tomas\\OneDrive\\Escritorio\\SQL\\ProyectoFinal\\DB\\restaurants.csv'
into table restaurants
fields terminated by ';'
terminated by '\r\n'; 


load data local infile 
'C:\\Users\\tomas\\OneDrive\\Escritorio\\SQL\\ProyectoFinal\\DB\\administratives.csv'
into table administratives
fields terminated by ';'
terminated by '\r\n'; 


load data local infile 
'C:\\Users\\tomas\\OneDrive\\Escritorio\\SQL\\ProyectoFinal\\DB\\dishes.csv'
into table dishes
fields terminated by ';'
terminated by '\r\n'; 


load data local infile 
'C:\\Users\\tomas\\OneDrive\\Escritorio\\SQL\\ProyectoFinal\\DB\\sales.csv'
into table sales
fields terminated by ';'
terminated by '\r\n'; 


load data local infile 
'C:\\Users\\tomas\\OneDrive\\Escritorio\\SQL\\ProyectoFinal\\DB\\dishes_per_sale.csv'
into table dishes_per_sale
fields terminated by ';'
terminated by '\r\n'; 
