xquery version "3.0";
declare option exist:serialize "method=xhtml media-type=text/html indent=yes";

let $get-cookie :=  request:get-cookie-value('current-user')
return if($get-cookie != '') then
    response:redirect-to(xs:anyURI("user/index.xq"))
    else
    <html>
    <head>
        <title>Iniciar Sesión</title>
        <link rel="stylesheet" href="css/login.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <script src="js/source-sans-pro.js"/>
    </head>
    <body>
        <div class="container animated flipInY">
            <form>
                <h1>Co-creación.</h1>
                <img src="img/users.png" width="150px" height="150px"/>
                <input type="text" id="username" name="usuario" placeholder="usuario"/>
                <input type="password" id="password" name="password" placeholder="contraseña"/>
                <hr/>
                <input id="login" type="submit" value="Iniciar Sesión"/>
            </form>
        </div>
        <script src="js/vendor/jquery-1.8.3.min.js"/>
        <script type="text/javascript" src="js/noty/jquery.noty.js"/>
        <script type="text/javascript" src="js/noty/layouts/bottom.js"/>
        <script type="text/javascript" src="js/noty/themes/default.js"/>
        <script type="text/javascript" src="js/jquery.blockUI.js"/>
        <script type="text/javascript" src="js/login.js"/>
    </body>
</html>

