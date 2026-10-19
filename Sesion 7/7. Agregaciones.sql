--NOTACION DE PUNTO
{"address.country": "Spain"}

--ACCEDER A LISTAS
{amenities: {$in: ["Kitchen"]}}

--CONDICIONALES
{price: {$lte: 100}}
{"address.country_code": "ES"}
{"review_scores.review_scores_rating": {$gte: 50}}
{amenities: {$in: ["Internet, "Wifi"]}}
{amenities: {$in: ["Elevator"]}}

--MULTICONDICIONAL
{price: {$lte: 100}, "address.country_code": "ES", "review_scores.review_scores_rating":{$gte: 50}, amenities: {$in:["Internet", "Wifi"]}, amenities:{$in:["Elevator"]}}

{
  "number_of_reviews": { "$gte": 50 },
  "review_scores.review_scores_rating": { "$gte": 80 },
  "amenities": "Ethernet connection",
  "address.country": "Brazil"
}

-- AGREGACIONES
1. {
   servicios: {$size: "$amenities"}
}
2. {
   name: 1,
   servicios: 1,
   _id: 0
}
3. {
   servicios: -1
}
4. 1


{
  "amenities": {
    "$in": ["Wifi", "Ethernet connection"]
  }
}
"total_publicaciones_con_internet"

-- Agrupamientos
{
  $group:
    {
      _id: <expression>, // Group By Expression
      <field1>: { <accumulator1> : <expression1> },
      ...
    }
 }


{
   property_type: "House"
}
{
   property_type: "House",
   bedrooms: {$gte: 1}
}
{
   costo_recamara: {$divide: ["$price", "$bedrooms"]}
}
{
  _id: null,
  recamaras: {
     $sum: 1
  },
  total: {
     $sum: "$costo_recamara"
  }
}
{
   costo_promedio: {
     $divide: ["$total", "$recamaras"]
   }
}


{
  "property_type": "House",
  "bedrooms": { "$gte": 1 }
}
{
  "costo_recamara": { "$divide": ["$price", "$bedrooms"] }
}
{
  "_id": "$address.country",
  "cantidad_propiedades": {
    "$sum": 1
  },
  "suma_total_costos": {
    "$sum": "$costo_recamara"
  }
}
{
  "costo_promedio": {
    "$divide": ["$suma_total_costos", "$cantidad_propiedades"]
  }
}

--LOOKUP
{
   $lookup:
     {
       from: <collection to join>,
       localField: <field from the input documents>,
       foreignField: <field from the documents of the "from" collection>,
       as: <output array field>
     }
}

{
  from: 'movies',
  localField: 'movie_id',
  foreignField: '_id',
  as: 'pelicula'
}
{
  pelicula_objeto: {$arrayElemAt: ["$pelicula",0]}
}
{
  pelicula_nombre: "$pelicula_objeto.title"
}
{
  _id:0,
  pelicula_nombre:1,
  name:1,
  text:1
}


{
  "from": "users",
  "localField": "email",
  "foreignField": "email",
  "as": "datos_usuario"
}
{
  "path": "$datos_usuario"
}