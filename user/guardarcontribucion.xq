xquery version "1.0";

let $doc := request:get-data()

let $collection := '/db/final/contribuciones/'
let $login := xmldb:login($collection, 'admin', '')

let $guid := $doc/Contribucion/id
let $doc-path := concat( $collection, '/', $guid)
let $store-return-status := xmldb:store($collection, $guid, $doc )

(: )let $ret := update replace doc($doc-path)/task/id/text() with ($guid) :)

return doc($doc-path)
