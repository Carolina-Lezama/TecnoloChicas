-- INNER JOIN
SELECT Usuarios.nombre, Usuarios.apellido, Pedidos.fecha_pedido, Pedidos.total_pedido
FROM Usuarios
    INNER JOIN Pedidos ON Usuarios.user_id = Pedidos.user_id;
-- La palabra reservada INNER es opcional en MySQL

SELECT u.nombre, u.apellido, p.fecha_pedido, p.total_pedido
FROM Usuarios AS u
    JOIN Pedidos AS p ON u.user_id = p.user_id;
-- Usando alias

SELECT u.nombre, u.apellido, p.pedido_id, p.total_pedido
FROM Usuarios AS u
    JOIN Pedidos AS p ON u.user_id = p.user_id;

-- LEFT Y RIGHT JOIN
SELECT u.nombre, u.apellido, p.fecha_pedido, p.total_pedido
FROM Usuarios AS u
    LEFT JOIN Pedidos AS p ON u.user_id = p.user_id;

SELECT p.nombre_producto, dp.cantidad, dp.precio_unitario
FROM
    Detalles_Pedido dp
    RIGHT JOIN Productos p ON dp.producto_id = p.producto_id;

SELECT
    u.nombre,
    p.fecha_pedido,
    SUM(dp.cantidad) AS total_productos_comprados
FROM
    Usuarios u
    LEFT JOIN Pedidos p ON u.user_id = p.user_id
    LEFT JOIN Detalles_Pedido dp ON p.pedido_id = dp.pedido_id
GROUP BY
    u.nombre,
    p.fecha_pedido;

SELECT
    u.nombre,
    p.fecha_pedido,
    SUM(dp.cantidad) AS total_productos_comprados
FROM
    Detalles_Pedido dp
    RIGHT JOIN Pedidos p ON dp.pedido_id = p.pedido_id
    RIGHT JOIN Usuarios u ON p.user_id = u.user_id
GROUP BY
    u.nombre,
    p.fecha_pedido;

-- UNION
SELECT *, 'Adulto joven' AS categoria
FROM Usuarios
WHERE
    edad BETWEEN 20 AND 39
UNION
SELECT *, 'Adulto' AS categoria
FROM Usuarios
WHERE
    edad BETWEEN 40 AND 59
UNION
SELECT *, 'Adulto mayor' AS categoria
FROM Usuarios
WHERE
    edad > 59

SELECT u.nombre, COUNT(p.pedido_id), SUM(p.total_pedido)
FROM Usuarios AS u
    LEFT JOIN Pedidos AS p ON u.user_id = p.user_id
GROUP BY u.nombre

-- VARIANTES
SELECT U.nombre, 
       P.nombre_producto
FROM       Usuarios  AS U
CROSS JOIN Productos AS P;