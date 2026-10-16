#  Introducción a NoSQL
A diferencia de las bases de datos relacionales, que utilizan un modelo de datos tabular con filas y columnas, las bases de datos NoSQL pueden almacenar datos en diversos formatos, como documentos, pares llave-valor, grafos o columnares. 

# Colecciones y documentos
una colección es similar a una tabla en una base de datos relacional. Es un conjunto de documentos que se almacenan juntos y están organizados de manera lógica. Cada colección puede contener cero o más documentos, y cada documento puede tener una estructura diferente. 

Por otro lado, un documento en MongoDB es un registro individual dentro de una colección. Un documento puede contener datos de diferentes tipos y puede tener una estructura flexible, lo que significa que los documentos dentro de una misma colección no necesitan tener la misma estructura de campos. 

# Expresiones regulares
Una expresión regular es una secuencia de caracteres que define un patrón de búsqueda dentro de una cadena de texto. Permite encontrar coincidencias dentro de un texto basándonos en reglas específicas, como caracteres específicos, patrones de caracteres repetidos o rangos de caracteres. 










# Objetos dentro de documentos (documento dentro de documento)

La forma de acceder entre un objeto y una lista es diferente
![alt text](image.png)
![alt text](image-5.png)

## Acceder a un documento dentro de otro

Se utiliza . para acceder
![alt text](image-1.png)

# Buscar parametro en listas

    $in, es decir, algun valor pedido debe ser devuelvo no importa la posicion en el que este

![alt text](image-2.png)

Mas de 2 campos:
![alt text](image-3.png)

## Filtracion por valor numerico

    $lte = Menor o igual que

![alt text](image-4.png)

    $gte = Mayor o igual que

![alt text](image-6.png)

# Varios filtros
![alt text](image-7.png)

