xquery version "3.0";

let $id := request:get-parameter("id","")
let $contribucion := collection('/db/final/contribuciones/')/Contribucion[id=$id]

return $contribucion