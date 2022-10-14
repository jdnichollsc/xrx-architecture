xquery version "1.0";
let $id := request:get-parameter('usuario','')
let $pwd := request:get-parameter('password','')

let $usr := doc('/db/final/users.xml')//user[ @loginid=$id and @password=$pwd ]

let $result := if ($usr/@name) then concat( 'Bienvenido ', $usr/@name) else 'Usuario/Password Incorrectos!'

let $set-cookie :=  if ($usr/@name) then response:set-cookie('current-user', $usr/@name)  else ""

return if ($usr/@name) then 
    (
        <Response>
            <State>OK</State>
        </Response>
    ) else 
    (
        <Response>
            <State>ERROR</State>
            <Message>El usuario no existe.</Message>
        </Response>
    )