Las subconsultas son consultas anidadas(se abre en una nueva pestaña) dentro de otras consultas SQL que nos permiten realizar operaciones con un mayor nivel de complejidad y obtener resultados específicos.

Las subconsultas se utilizan para realizar operaciones que requieren datos procesados por una consulta, antes de que se pueda ejecutar la consulta principal.

En esta sesión nos centraremos en tres tipos principales de subconsultas:

- Subconsultas SELECT
- Subconsultas FROM
- Subconsultas WHERE

# Subconsultas SELECT

Las subconsultas SELECT se utilizan para obtener valores específicos dentro de una consulta principal. Estas subconsultas se incluyen en la lista de selección de la consulta principal y pueden devolver un solo valor o una lista de valores.

Una subconsulta SELECT, también conocida como subconsulta escalar o subconsulta de valor único, es una consulta SQL anidada dentro de otra consulta principal que se utiliza para obtener un único valor como resultado.

Esta subconsulta se incluye dentro de la cláusula SELECT de la consulta principal y puede ejecutarse de forma independiente para generar un valor específico que luego se utiliza en la consulta principal.

# Subconsultas FROM

Las subconsultas FROM se utilizan para generar conjuntos de datos temporales que pueden usarse en la consulta principal. Estas subconsultas se incluyen en la cláusula FROM y pueden generar conjuntos de datos basados en filtros, cálculos u otras operaciones.

Observa que hacer esto, en ocasiones puede  vitarse usando la cláusula HAVING que revisamos en la sesión anterior.

Una subconsulta FROM, también conocida como subconsulta de tabla derivada, es una consulta SQL anidada dentro de la cláusula FROM de otra consulta principal.

En lugar de hacer referencia a una tabla física, esta subconsulta genera un conjunto de datos temporal que puede ser tratado como una tabla virtual dentro de la consulta principal.

# Subconsultas WHERE
Las subconsultas WHERE se utilizan para filtrar datos en la consulta principal basándose en los resultados de otra consulta. Estas subconsultas se incluyen en la cláusula WHERE y pueden usarse para aplicar condiciones con mayor complejidad en una consulta.

**¡Importante!** Siempre que agregues las subconsultas en un filtro dentro del WHERE, deben devolver un solo valor.

Una subconsulta WHERE, también conocida como subconsulta correlacionada, es una consulta SQL anidada dentro de la cláusula WHERE de otra consulta principal.

Esta subconsulta se utiliza para filtrar los resultados de la consulta principal en función de una condición evaluada dinámicamente para cada fila de la tabla.

Nota: La cláusula IN se utiliza en SQL para verificar si un valor determinado coincide con cualquiera de los valores proporcionados en una lista o subconsulta. Mientras que el operador OR se utiliza para combinar múltiples condiciones en una expresión lógica, la cláusula IN se utiliza específicamente para comparar un valor con una lista de valores.
