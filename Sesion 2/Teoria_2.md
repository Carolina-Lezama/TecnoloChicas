# Funciones de agregación

Las funciones de agregación son operaciones utilizadas en bases de datos para realizar cálculos sobre conjuntos de datos y producir un único resultado resumido. Estas funciones operan sobre conjuntos de valores y devuelven un único valor que representa un resumen de los datos en el conjunto.

- sumas
- promedios
- conteos
- máximos
- mínimos

# Agrupamientos

Técnica que nos permite combinar registros de datos basándonos en un criterio común y calcular agregaciones sobre esos registros agrupados.

Es decir, podemos agrupar registros que comparten un valor en particular en una o más columnas y luego realizar operaciones como sumar, contar, obtener el máximo o mínimo, etc., sobre esas agrupaciones.

La cláusula GROUP BY se utiliza para agrupar filas de datos en categorías basadas en los valores de una o más columnas, y luego realizar cálculos resumidos dentro de cada grupo utilizando funciones de agregación. Esto es útil para analizar datos de manera estructurada y obtener información resumida sobre conjuntos de datos grandes y complejos. 


# Having

Dado que el filtrado se debe realizar después del agrupamiento, no usaremos WHERE sino HAVING.

La cláusula HAVING se utiliza en SQL para filtrar filas de datos después de que se han agrupado, basándose en condiciones específicas que implican funciones de agregación.

En otras palabras, mientras que la cláusula WHERE se utiliza para filtrar filas antes de que se agrupen, la cláusula HAVING se aplica después de la agrupación y se utiliza para filtrar grupos de filas basadas en condiciones agregadas, como la suma o el recuento de valores.

Algunos gestores de bases de datos (como MySQL) permiten usar HAVING a través de los alias.

La cláusula HAVING en SQL se utiliza junto con la cláusula GROUP BY para filtrar grupos de filas basados en una condición. Mientras que la cláusula WHERE filtra filas individuales antes de que se realice el agrupamiento, la cláusula HAVING filtra grupos de filas después de que se ha realizado el agrupamiento.

La cláusula HAVING permite especificar condiciones de filtrado basadas en los resultados de la agregación

La cláusula WHERE y la cláusula HAVING son utilizadas para filtrar datos en consultas SQL, pero operan en momentos diferentes durante la ejecución de la consulta y se aplican a diferentes conjuntos de datos. Es decir, la cláusula WHERE se utiliza para filtrar filas individuales antes del agrupamiento, mientras que la cláusula HAVING se utiliza para filtrar grupos de filas después del agrupamiento y la agregación. 


#### Nota: La cláusula BETWEEN se utiliza para filtrar resultados dentro de un rango específico de valores. Permite seleccionar registros cuyos valores se encuentren entre dos límites especificados, incluyendo esos límites. Es una forma conveniente de escribir condiciones que abarcan un rango de valores sin necesidad de utilizar múltiples operadores de comparación.

#### Nota: ELa cláusula AS se utiliza para asignar un alias o nombre alternativo a los resultados de las funciones de agregación o a las columnas resultantes de las consultas. En MySQL, al igual que en muchos otros sistemas de gestión de bases de datos, la cláusula AS puede ser omitida en ciertos contextos. Cuando se utiliza una función de agregación o se renombra una columna en una consulta, es posible asignar un alias directamente sin necesidad de utilizar la palabra reservada AS.

