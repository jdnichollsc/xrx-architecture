xquery version "3.0";
declare option exist:serialize "method=xhtml media-type=text/html indent=yes";

let $page :=
<html lang="en">
    <head>
        <title>Home</title>
        <meta charset="utf-8"/>
        <link rel="icon" href="images/favicon.ico"/>
        <link rel="shortcut icon" href="images/favicon.ico"/>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js/vendor/jquery-1.8.3.min.js"/>
        <script src="js/superfish.js"/>
        <script src="js/jquery.equalheights.js"/>
        <script src="js/jquery.easing.1.3.js"/>
     <!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <link rel="stylesheet" media="screen" href="css/ie.css">

    <![endif]-->
    </head>
    <body class="page1">
<!--==============================header=================================-->
        <header>
            <div class="container_12">
                <div class="grid_12"/>
                <div class="grid_4">
                    <div class="port">
                        <div>
                            <a class="link_img" href="index-2.html">
                                <img src="img/co-creation.png" alt=""/>
                                <span/>
                            </a>
                            <a href="index-1.html" class="maxheight link1">acerca</a>
                        </div>
                    </div>
                </div>
                <div class="grid_4">
                    <h1>
                        <a href="index.html">
                            <img src="img/Figura_017.png" style="height: 223px;" alt="Brand Identity"/>
                        </a>
                    </h1>
                </div>
                <div class="grid_4 fright">
                    <div class="port">
                        <a class="link_img " href="index-2.html" style="background-color:white;text-align: center;">
                            <img src="img/wewantyou.png" style="width: 200px;" alt=""/>
                            <span/>
                        </a>
                        <a href="login.xq" class="maxheight link1">login</a>
                    </div>
                </div>
                <div class="clear"/>
                <div class="port1">
                    <div class="grid_12">
                        <div class="port" style="width:930px;">
                            <a class="link_img " href="index-2.html" style="background-color:white;">
                                <img src="img/co-creation-award2.png" alt=""/>
                                <span/>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="port2">
                    <div class="grid_12">
                        <div class="port">
                            <a class="link_img " href="index-2.html">
                                <img src="img/LaMandarinadeNewton_Services_CoCreation.png" style="width: 215px;" alt=""/>
                                <span/>
                            </a>
                            <a href="index-3.html" class="link1 ">ideas</a>
                        </div>
                        <div class="port">
                            <a class="link_img " href="index-2.html" style="background-color: white;">
                                <img src="img/testimonial.png" alt=""/>
                                <span/>
                            </a>
                            <a href="index-5.html" class="link1 ">blog</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>

<!--==============================Content=================================-->


<!--==============================footer=================================-->
        <footer>
            <div class="container_12">
                <div class="grid_12">
                    <div class="socials">
                        <a href="#"/>
                        <a href="#"/>
                        <a href="#"/>
                        <a href="#"/>
                    </div>
                    <div class="copy">
      Co-creación  (C) 2013 | <a href="#">Políticas de Privacidad</a> | Diseñado por <a href="http://www.nicholls.co/" rel="nofollow">Nicholls</a>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>

return $page