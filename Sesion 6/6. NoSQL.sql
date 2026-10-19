-- INSERTAR UN DOCUMENTO


{ 
    "name": "Beto",
    "email": "beto@bedu.org",
    "password": "micursoeslomaximo"
}

{
    "name": "Lupe",
    "email": "lupe@bedu.org",
    "password": "calamardo6020",
    "libros": ["Harry Potter", "El Señor de los Anillos", "Crepúsculo"]

}

-- BUSCAR UN DOCUMENTO
{email: "beto@bedu.org"}
{email: {$in: ["beto@bedu.org", "lupe@bedu.org"]}}
{campo: 0}
{campo: 1}
{campo: "valor"}

-- EJEMPLOS

Filter: { name: "Greg Powell" }
Project: { text: 1, name: 1, _id: 0 } 

Filter: { "$or": [ { "name": "Greg Powell" }, { "name": "Mercedes Tyler" } ] }
Project: { text: 1, name: 1, _id: 0 }

Sort: { num_mflix_comments: -1 }
Project: { title: 1, num_mflix_comments: 1, _id: 0 }
Limit: 1

Sort: { num_mflix_comments: -1 }
Project: { title: 1, num_mflix_comments: 1, _id: 0 }
Limit: 5

-- EXPRESIONES REGULARES
{transit: /Metro/}
{transit: /Metro/i} --ignorando minusculas y mayusculas
{email: /^m/} -- todos los que empiezan por m
{email: /@cats.com$/} -- marca el final de una cadena
{email: /.*a.*/} --documentos cuyo correo incluya una a en cualquier parte del mismo

{ "house_rules": { "$regex": "no party|no parties|no fiestas", "$options": "i" } }
{ "house_rules": { "$regex": "pets allowed|pets welcome|se admiten mascotas", "$options": "i" } }
{ "house_rules": { "$regex": "no smoking|non smoking|prohibido fumar", "$options": "i" } }
{ 
  "$and": [
    { "house_rules": { "$regex": "no party|no parties|no fiestas", "$options": "i" } },
    { "house_rules": { "$regex": "no smoking|non smoking|prohibido fumar", "$options": "i" } }
  ] 
}
