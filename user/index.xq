xquery version "3.0";
declare option exist:serialize "method=xhtml media-type=text/html indent=yes";

let $contribuciones := collection('/db/final/contribuciones/')/Contribucion

let $page :=
    <html>
        <head>
            <title>Grafo de Contribuciones</title>
            <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"></link>
            <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen"></link>
            <link href="assets/styles.css" rel="stylesheet" media="screen"></link>
            <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
            <style type="text/css">
                #menu{{
                    right: 62px;
                    position: absolute;
                    top: 120;
                    width: 275px;
                    display:none;
                }}
                #menu .block-content{{
                    border: 1px black solid;
                    height: 330px;
                    overflow: auto;
                }}
            </style>
        </head>
        <body>
            <div class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container-fluid">
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>
                        <a class="brand" href="#">Panel de Usuario</a>
                        <div class="nav-collapse collapse">
                            <ul class="nav pull-right">
                                <li class="dropdown">
                                    <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="icon-user"></i> {request:get-cookie-value("current-user")} <i class="caret"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a tabindex="-1" href="../logout.xq">Cerrar sesión</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span3" id="sidebar">
                        <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                            <li class="active">
                                <a href="index.html">
                                    <i class="icon-chevron-right"></i>Grafo</a>
                            </li>
                            <li>
                                <a href="nuevacontribucion.xml">
                                    <i class="icon-chevron-right"></i>Nueva Contribución</a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="badge badge-warning pull-right">{count($contribuciones)}</span> Contribuciones</a>
                            </li>
                        </ul>
                    </div>
                    <div class="span9" id="content">
                        <div class="row-fluid">
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Grafo de Contribuciones</div>
                                </div>
                                <div class="block-content collapse in">
                                    <div style="height:400px;" id="chart">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="menu" class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Contribución</div>
                                </div>
                                <div class="block-content collapse in">
                                    <div class="span12" style="padding: 6px;">
                                    <h4>Datos Principales</h4>
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <td>Título</td>
                                                <td id="Ctitulo"></td>
                                            </tr>
                                            <tr>
                                                <td>Fecha</td>
                                                <td id="Cfecha"></td>
                                            </tr>
                                            <tr>
                                                <td>Fase</td>
                                                <td id="Cfase"></td>
                                            </tr>
                                            <tr>
                                                <td>Descripción</td>
                                                <td id="Cdescripcion"></td>
                                            </tr>
                                        </tbody>
                                    </table></div>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                </div>
                <hr></hr>
                <footer>
                    <p>Co-creación 2013</p>
                </footer>
            </div>
            <script src="vendors/jquery-1.9.1.min.js"></script>
            <script src="bootstrap/js/bootstrap.min.js"></script>
            <script src="js/netchart/netchart.js"></script>
            <script src="js/index.js"></script>
            <script type="text/javascript">
            var nodes = [], links = [];
                {
                    for $contribucion at $posC in $contribuciones
                    let $xml:= 
                        <text>
                            {   
                                concat('nodes.push({"id":"',
                                       $contribucion/id/text(),
                                       '", "loaded":true, "style":{"label":"',
                                       $contribucion/Aporte/text(),'"}});')
                            }
                            {
                                for $enlace at $posE in $contribucion/Enlaces/Enlace
                                return
                                    if ($enlace/origen/text() != "") then
                                    concat('links.push({"id":"',
                                           $posC, $posE,
                                           '","from":"',
                                           $enlace/origen/text(),
                                           '", "to":"',
                                           $contribucion/id/text(),
                                           '", "style":{"fillColor":"red", "toDecoration":"arrow", "radius":"2"}});')
                                    else ""
                                    
                            }
                        </text>
                        return $xml/text()
                }
                settings = {{
                    container: $("#chart")[0],
                    data: {{
                        preloaded: {{
                            "nodes": nodes,
                            "links": links
                        }}
                    }},
                    events:{{
                        onSelectionChange:onSelectionChange,
                        onClick:onClick,
                        onDoubleClick:onDoubleClick,
                        onHoverChange:onHoverChange
                    }}
                }};                
            </script>
        </body>
    </html>
    
return $page