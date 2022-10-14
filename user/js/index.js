$(document).ready(function() {
    chart = new NetChart(settings);
});

function onSelectionChange(event){
        var selection = chart.selection();
        var contents = "";
        for (var i = 0; i < selection.length; i ++){
            var item = selection[i];
            var type;
            if (item.isNode){
                $.post("getcontribucion.xq",{ id: item.id },
                function (response) {
                    var $xml = $(response);
                    $("#Ctitulo").html($xml.find("Aporte").text());
                    $("#Cfecha").html($xml.find("Fecha").text());
                    $("#Cfase").html($xml.find("Fase").text());
                    $("#Cdescripcion").html(unescape($xml.find("Descripcion").text()));
                    $("#menu").fadeIn();
                });
                type = "node";
            }
            else
                type = "link";
            contents += "<li>"+type + " " + item.id +"</li>";
        }
        if(selection.length == 0)
            $("#menu").fadeOut();
        console.log("<b>Selection change</b><ul>"+contents+"</ul><br/>");
    }

    function onClick(event){
        /*var contents = "nothing";
        if (event.clickNode){
            
            contents = event.clickNode.id
        }else if (event.clickLink){
            contents = event.clickLink.label
        }

        console.log("<b>Click on </b><ul>"+contents+"</ul><br/>");*/
    }

    function onHoverChange(event){
        /*var contents = "nothing";
        if (event.hoverNode){
            contents = event.hoverNode.label
        }else if (event.hoverLink){
            contents = event.hoverLink.label
        }

        console.log("<b>Hover on </b><ul>"+contents+"</ul><br/>");*/
    }

    function onDoubleClick(event){
        /*var contents = "nothing";
        if (event.clickNode){
            contents = event.clickNode.label
        }else if (event.clickLink){
            contents = event.clickLink.label
        }

        console.log("<b>Double click on </b><ul>"+contents+"</ul><br/>");*/
    }