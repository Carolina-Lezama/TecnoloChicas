-- Mostrar una lista de todas las bases de datos disponibles
SHOW DATABASES;

-- Conectarse a una base de datos
USE tienda;

-- Muestra una lista de todas las tablas en una base de datos específica.
SHOW TABLES;

-- Mostrar la estructura de una tabla específica en términos de sus columnas y sus tipos de datos.
DESCRIBE nombre_tabla;

-- Seleccionar datos de campos
SELECT campo_1, campo_2 -- * significa "todos los campos"
FROM tabla;

-- Clausula where
SELECT campo_1, campo_2 
FROM tabla;
WHERE condicion;

SELECT *
FROM estudiantes
WHERE edad >= 18;

SELECT * 
FROM Usuarios
WHERE edad > 30;

SELECT * 
FROM Pedidos
WHERE (fecha_pedido >= '2023-01-01' AND fecha_pedido <= '2023-12-31')
  AND total_pedido > 100;

SELECT * 
FROM Usuarios
WHERE edad > 18 
   OR edad < 65;

SELECT * 
FROM Productos
WHERE NOT stock_disponible > 0;

-- Cláusula ORDER BY
SELECT campo_1, campo_2 
FROM tabla;
ORDER BY campo_1 ASC; -- DESC

SELECT *
FROM productos
ORDER BY precio DESC; 

SELECT *
FROM Usuarios
ORDER BY edad ASC, 
         fecha_registro DESC;
