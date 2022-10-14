xquery version "3.0";
declare option exist:serialize "method=xhtml media-type=text/xml indent=no process-xsl-pi=no";

let $form :=
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:ev="http://www.w3.org/2001/xml-events" xmlns:xf="http://www.w3.org/2002/xforms">
    <head>
        <title>Crear una nueva Contribucion</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"></link>
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen"></link>
        <link href="assets/styles.css" rel="stylesheet" media="screen"></link>
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <xf:model>
            <xf:instance src="nuevacontribucion.xq" id="contribucion"/>
            <xf:submission id="dopost" action="save.xq" method="post" replace="instance" instance="contribucion"/>
            <xf:bind nodeset="/Contribucion/Fecha" type="xs:date" constraint=". &gt; 0"/>
            <xf:instance src="roles.xml" id="roles"/>
            <xf:instance src="fases.xml" id="fases"/>
        </xf:model>
    </head>
    <body>
    
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"/>
                        <span class="icon-bar"/>
                        <span class="icon-bar"/>
                    </a>
                    <a class="brand" href="#">Panel de Usuario</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="icon-user"/> Usuario <i class="caret"/>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="login.html">Cerrar sesión</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li>
                            <a href="index.html">
                                <i class="icon-chevron-right"/> Grafo</a>
                        </li>
                        <li class="active">
                            <a href="nuevacontribucion.xq">
                                <i class="icon-chevron-right"/> Nueva Contribución</a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="badge badge-warning pull-right">5000</span> Contribuciones</a>
                        </li>
                    </ul>
                </div>
                <!--/span-->
                <div class="span9" id="content">
                     <!-- wizard -->
                    <div class="row-fluid section">
                         <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Nueva Contribución</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <div id="rootwizard">
                                        <div class="navbar">
                                          <div class="navbar-inner">
                                            <div class="container">
                                        <ul>
                                            <li><a href="#tab1" data-toggle="tab">Datos del Colaborador</a></li>
                                            <li><a href="#tab2" data-toggle="tab">Datos de la Contribución</a></li>
                                            <li><a href="#tab3" data-toggle="tab">Adjuntar</a></li>
                                        </ul>
                                         </div>
                                          </div>
                                        </div>
                                        <div id="bar" class="progress progress-striped active">
                                          <div class="bar"></div>
                                        </div>
                                        <div class="tab-content">
                                            <div class="tab-pane" id="tab1">
                                               <form class="form-horizontal">
                                                  <fieldset>
                                                    <legend>Datos del Colaborador</legend>
                                        <div class="control-group">
                                          <label class="control-label" for="nombre">Nombre</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" id="nombre" type="text" value="" />
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="apellido">Apellido</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" id="apellido" type="text" value="" />
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="rol">Rol</label>
                                          <div class="controls">
                                            <select id="rol" class="chzn-select">
                                              <option>Investigador</option>
                                              <option>Administrador</option>
                                              <option>Colaborador</option>
                                              <option>Revisor</option>
                                              <option>Tester</option>
                                              <option>Validador</option>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="entidad">Entidad</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" id="entidad" type="text" value="" />
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="email">Email</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" id="email" type="text" value="" />
                                          </div>
                                        </div>
                                                  </fieldset>
                                                </form>
                                            </div>
                                            <div class="tab-pane" id="tab2">
                                                <form class="form-horizontal">
                                                  <fieldset>
                                                    <legend>Datos de la Contribución</legend>
                                        <div class="control-group">
                                          <label class="control-label" for="titulo">Título</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" id="titulo" type="text" value="" />
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="fecha">Fecha</label>
                                          <div class="controls">
                                            <input type="text" class="input-xlarge datepicker" id="fecha" value="02/16/12" />
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="fase">Fase</label>
                                          <div class="controls">
                                            <select id="fase" class="chzn-select">
                                              <option>Identificación de oportunidades</option>
                                              <option>Generación de Ideas</option>
                                              <option>Propuestas de producto o servicio</option>
                                              <option>Definición de Requerimientos</option>
                                              <option>Modelado Conceptual</option>
                                              <option>Diseño</option>
                                              <option>Construcción</option>
                                              <option>Pruebas</option>
                                              <option>Operación</option>
                                              <option>Distribución</option>
                                              <option>Impacto</option>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="descripcion">Descripción</label>
                                          <div class="controls">
                                            <textarea id="descripcion" class="input-xlarge textarea" placeholder="Entrar descripción..." style="width: 740px; height: 200px"></textarea>
                                          </div>
                                        </div>
                                                  </fieldset>
                                                </form>
                                            </div>
                                            <div class="tab-pane" id="tab3">
                                                <form class="form-horizontal">
                                                  <fieldset>
                                                    <legend>Adjuntar</legend>
                                        <div class="control-group">
                                          <label class="control-label" for="nombreadjunto">Nombre</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" id="nombreadjunto" type="text" value="" />
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="tipoadjunto">Tipo</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" id="tipoadjunto" type="text" value="" />
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="versionadjunto">Versión</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" id="versionadjunto" type="text" value="" />
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="comentarioadjunto">Comentario</label>
                                          <div class="controls">
                                            <textarea id="comentarioadjunto" class="input-xlarge textarea" placeholder="Entrar comentario..." style="width: 810px; height: 200px"></textarea>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="ubicacionadjunto">Ubicación</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" id="ubicacionadjunto" type="text" value="" />
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="fileadjunto">Insertar archivo</label>
                                          <div class="controls">
                                            <input class="input-file uniform_on" id="fileadjunto" type="file" />
                                          </div>
                                        </div>
                                                  </fieldset>
                                                </form>
                                            </div>
                                            <ul class="pager wizard">
                                                <li class="previous first" style="display:none;"><a href="javascript:void(0);">Primero</a></li>
                                                <li class="previous"><a href="javascript:void(0);">Anterior</a></li>
                                                <li class="next last" style="display:none;"><a href="javascript:void(0);">Último</a></li>
                                                <li class="next"><a href="javascript:void(0);">Siguiente</a></li>
                                                <li class="next finish" style="display:none;"><a href="javascript:;">Finalizar</a></li>
                                            </ul>
                                        </div>  
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>

                </div>
            </div>
            <hr />
            <footer>
                <p>copy; Vincent Gabriel 2013</p>
            </footer>
        </div>
        <!--/.fluid-container-->
        <link href="vendors/datepicker.css" rel="stylesheet" media="screen"></link>
        <link href="vendors/uniform.default.css" rel="stylesheet" media="screen"></link>
        <link href="vendors/chosen.min.css" rel="stylesheet" media="screen"></link>


        <script src="vendors/jquery-1.9.1.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/jquery.uniform.min.js"></script>
        <script src="vendors/chosen.jquery.min.js"></script>
        <script src="vendors/bootstrap-datepicker.js"></script>

        <script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
        <script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

        <script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>


        <script src="assets/scripts.js"></script>
         <script src="nuevacontribucion.js"></script>
    </body>
</html>

let $xslt-pi := processing-instruction xml-stylesheet {'type="text/xsl" href="../xsltforms/xsltforms.xsl"'}
let $debug := processing-instruction xsltforms-options {'debug="no"'}
let $css := processing-instruction css-conversion {'no'}
return ($xslt-pi, $debug, $css, $form)