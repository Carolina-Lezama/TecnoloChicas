-- Subconsultas SELECT
SELECT nombre, apellido, (
        SELECT count(*)
        FROM ventas
        WHERE
            coleccionistas.id = ventas.coleccionistas_id
    ) AS pinturas
FROM coleccionistas;
/*
Se necesita traer el número de pinturas que ha comprado un coleccionista, pero no se cuenta con este dato directamente en la tabla coleccionistas, 
esto se encuentra realmente en la tabla de ventas.
*/

SELECT
    nombre,
    correo_electronico,
    (
        SELECT COUNT(*)
        FROM Pedidos
        WHERE
            Pedidos.user_id = Usuarios.user_id
    ) AS total_pedidos
FROM Usuarios;

-- La tienda quiere identificar los productos cuyo precio está por encima del precio promedio.
SELECT
    nombre_producto,
    precio,
    (
        SELECT AVG(precio)
        FROM Productos
    ) AS precio_promedio
FROM Productos
WHERE
    precio > (
        SELECT AVG(precio)
        FROM Productos
    );

-- Subconsultas FROM
SELECT candidato, votos
from (
        select candidato, count(*)
        from votos
        group by
            candidato
    ) as temporal
where
    votos > 20;
/*
Obtener la cantidad de votos, pero primero se deben contar. Sin embargo, al ya no utilizarse posteriormente esta información, 
se requiere que los resultados sean temporales, aunado a que no existe ninguna tabla con estos valores.
*/

SELECT *
FROM (
        SELECT
            producto_id, AVG(cantidad) AS cantidad_promedio
        FROM Detalles_Pedido
        GROUP BY
            producto_id
    ) AS subconsulta
WHERE
    subconsulta.cantidad_promedio > 2;

-- Esto se puede hacer con HAVING
SELECT
    producto_id,
    AVG(cantidad) AS cantidad_promedio
FROM Detalles_Pedido
GROUP BY
    producto_id
HAVING
    AVG(cantidad) > 2;

SELECT pedido_id, fecha_pedido
FROM Pedidos
WHERE
    pedido_id IN (
        SELECT pedido_id
        FROM Detalles_Pedido
        WHERE
            producto_id IN (
                SELECT producto_id
                FROM Productos
                WHERE
                    stock_disponible = 0
            )
    );

-- Subconsultas WHERE
select nombre, edad
from estudiantes
where
    edad > (
        select avg(edad)
        from estudiantes
    );
/*
A diferencia del ejemplo anterior con la consulta FROM, no se requiere añadir campos, más bien, 
se quiere hacer un filtrado de datos a partir de un resultado previo.
*/

SELECT nombre
FROM Usuarios
WHERE
    user_id IN (
        SELECT user_id
        FROM Pedidos
        WHERE
            fecha_pedido = '2024-04-15'
    );

SELECT
    nombre,
    apellido,
    (
        SELECT COUNT(*)
        FROM Pedidos
        WHERE
            Pedidos.user_id = Usuarios.user_id
    ) AS total_pedidos
FROM Usuarios
WHERE
    user_id IN (
        SELECT user_id
        FROM Pedidos
        GROUP BY
            user_id
        HAVING
            COUNT(*) > (
                SELECT AVG(total_pedidos)
                FROM (
                        SELECT COUNT(*) AS total_pedidos
                        FROM Pedidos
                        GROUP BY
                            user_id
                    ) AS subconsulta
            )
    );