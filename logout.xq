xquery version "3.0";

let $clear-cookie := response:set-cookie('current-user', '')

return response:redirect-to(xs:anyURI("index.xq"))