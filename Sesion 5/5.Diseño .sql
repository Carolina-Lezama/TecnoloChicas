-- CREACION DE TABLAS
CREATE TABLE nombre_tabla (
 columna1 tipo_dato restricciones,
 columna2 tipo_dato restricciones,
 ...
 FOREIGN KEY (llave_foranea) REFERENCES otra_tabla (columna_pk),
 ... 
);

USE mariareyes;

CREATE TABLE Alumnos (
    matricula VARCHAR(11) PRIMARY KEY,
    nombre VARCHAR(45),
    apellido VARCHAR(45)
);

CREATE TABLE Tareas (
    id_tarea INT PRIMARY KEY,
    matricula VARCHAR(11),
    numero_tarea INT,
    calificacion DOUBLE,
    FOREIGN KEY (matricula) REFERENCES Alumnos (matricula)
);

CREATE TABLE Examenes (
    id_examen INT PRIMARY KEY,
    matricula VARCHAR(11),
    numero_examen INT,
    calificacion DOUBLE,
    FOREIGN KEY (matricula) REFERENCES Alumnos (matricula)
);

-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
    user_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    correo_electronico VARCHAR(100),
    fecha_registro DATE
);

-- Creación de la tabla Pedidos
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY,
    user_id INT,
    fecha_pedido DATE,
    total_pedido DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Usuarios (user_id)
);

-- Creación de la tabla Productos
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    stock_disponible INT
);

-- Creación de la tabla Detalles_Pedido
CREATE TABLE Detalles_Pedido (
    detalle_id INT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos (pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Productos (producto_id)
);

-- INSERTAR DATOS
INSERT INTO nombre_tabla (columna1, columna2, ...)
VALUES (valor1, valor2, ...);

INSERT INTO
    Usuarios (
        nombre,
        apellido,
        edad,
        correo_electronico,
        fecha_registro
    )
VALUES (
        'Juan',
        'Pérez',
        30,
        'juan@example.com',
        '2024-04-30'
    );

LOAD DATA INFILE 'ruta_del_archivo' INTO
TABLE nombre_tabla FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- CREAR Y USAR BASE DE DATOS
CREATE SCHEMA caro_prueba_estudiantes;

USE caro_prueba_estudiantes;

SELECT *
FROM
    Alumnos AS a
    JOIN Tareas AS t ON a.matricula = t.matricula
    JOIN Examenes AS e ON a.matricula = e.matricula

SELECT a.matricula, a.nombre, a.apellido, SUM(
        CASE
            WHEN t.numero_tarea = 1 THEN t.calificacion
            ELSE 0
        END
    ) AS tarea_1, SUM(
        CASE
            WHEN t.numero_tarea = 2 THEN t.calificacion
            ELSE 0
        END
    ) AS tarea_2
FROM Alumnos AS a
    JOIN Tareas AS t ON a.matricula = t.matricula
GROUP BY
    a.matricula,
    a.nombre,
    a.apellido

SELECT a.matricula, a.nombre, a.apellido, SUM(
        CASE
            WHEN e.numero_examen = 1 THEN e.calificacion
            ELSE 0
        END
    ) AS examen_1, SUM(
        CASE
            WHEN e.numero_examen = 2 THEN e.calificacion
            ELSE 0
        END
    ) AS examen_2
FROM Alumnos AS a
    JOIN Examenes AS e ON a.matricula = e.matricula
GROUP BY
    a.matricula,
    a.nombre,
    a.apellido

SELECT
    tareas.matricula,
    tareas.nombre,
    tareas.apellido,
    examen_1,
    examen_2,
    (examen_1 + examen_2) / 2 AS promedio_examenes,
    tarea_1,
    tarea_2,
    (tarea_1 + tarea_2) / 2 AS promedio_tareas,
    ((examen_1 + examen_2) / 2) * 0.6 + ((tarea_1 + tarea_2) / 2) * 0.4 AS promedio_final
FROM (
        SELECT a.matricula, a.nombre, a.apellido, SUM(
                CASE
                    WHEN t.numero_tarea = 1 THEN t.calificacion
                    ELSE 0
                END
            ) AS tarea_1, SUM(
                CASE
                    WHEN t.numero_tarea = 2 THEN t.calificacion
                    ELSE 0
                END
            ) AS tarea_2
        FROM Alumnos AS a
            JOIN Tareas AS t ON a.matricula = t.matricula
        GROUP BY
            a.matricula, a.nombre, a.apellido
    ) AS tareas
    JOIN (
        SELECT a.matricula, a.nombre, a.apellido, SUM(
                CASE
                    WHEN e.numero_examen = 1 THEN e.calificacion
                    ELSE 0
                END
            ) AS examen_1, SUM(
                CASE
                    WHEN e.numero_examen = 2 THEN e.calificacion
                    ELSE 0
                END
            ) AS examen_2
        FROM Alumnos AS a
            JOIN Examenes AS e ON a.matricula = e.matricula
        GROUP BY
            a.matricula, a.nombre, a.apellido
    ) AS examenes ON tareas.matricula = examenes.matricula
ORDER BY tareas.matricula;

CREATE VIEW calificaciones AS (
    SELECT
        tareas.matricula,
        tareas.nombre,
        tareas.apellido,
        examen_1,
        examen_2,
        (examen_1 + examen_2) / 2 AS promedio_examenes,
        tarea_1,
        tarea_2,
        (tarea_1 + tarea_2) / 2 AS promedio_tareas,
        ((examen_1 + examen_2) / 2) * 0.6 + ((tarea_1 + tarea_2) / 2) * 0.4 AS promedio_final
    FROM (
            SELECT a.matricula, a.nombre, a.apellido, SUM(
                    CASE
                        WHEN t.numero_tarea = 1 THEN t.calificacion
                        ELSE 0
                    END
                ) AS tarea_1, SUM(
                    CASE
                        WHEN t.numero_tarea = 2 THEN t.calificacion
                        ELSE 0
                    END
                ) AS tarea_2
            FROM Alumnos AS a
                JOIN Tareas AS t ON a.matricula = t.matricula
            GROUP BY
                a.matricula, a.nombre, a.apellido
        ) AS tareas
        JOIN (
            SELECT a.matricula, a.nombre, a.apellido, SUM(
                    CASE
                        WHEN e.numero_examen = 1 THEN e.calificacion
                        ELSE 0
                    END
                ) AS examen_1, SUM(
                    CASE
                        WHEN e.numero_examen = 2 THEN e.calificacion
                        ELSE 0
                    END
                ) AS examen_2
            FROM Alumnos AS a
                JOIN Examenes AS e ON a.matricula = e.matricula
            GROUP BY
                a.matricula, a.nombre, a.apellido
        ) AS examenes ON tareas.matricula = examenes.matricula
    ORDER BY tareas.matricula
);