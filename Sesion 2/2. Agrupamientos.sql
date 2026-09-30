-- Funciones de agregación

SELECT COUNT(*) AS total_usuarios
FROM Usuarios;

SELECT SUM(precio) AS total_precio_productos
FROM Productos;

SELECT MAX(precio) AS precio_maximo_producto
FROM Productos;

SELECT MIN(precio) AS precio_minimo_producto
FROM Productos;

SELECT AVG(edad) AS promedio_edad_usuarios
FROM Usuarios;

-- Agrupamientos

SELECT user_id, 
       COUNT(*) AS Total_Pedidos
FROM Pedidos
GROUP BY user_id;

SELECT producto_id, 
       SUM(cantidad) AS Total_Ventas
FROM Detalles_Pedido
GROUP BY producto_id;

SELECT MONTH(fecha_registro)  AS Mes_Registro, 
       AVG(edad)              AS Promedio_Edad
FROM Usuarios
GROUP BY MONTH(fecha_registro)
ORDER BY 1;

SELECT DAYOFWEEK(fecha_pedido) AS Dia_Semana, 
       COUNT(*)                AS Total_Pedidos
FROM Pedidos
GROUP BY DAYOFWEEK(fecha_pedido)
ORDER BY Dia_Semana;
