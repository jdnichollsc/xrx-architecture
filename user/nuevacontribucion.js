function CallXsltFormEvent(callback,data)
{
    XsltForms_xmlevents.dispatch(document.getElementById("modelid"),callback, null, null, null, null,data);
}
function getCookie(cname)
{
var name = cname + "=";
var ca = document.cookie.split(';');
for(var i=0; i<ca.length; i++) 
  {
  var c = ca[i].trim();
  if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  }
return "";
}
$(".icon-user").next().html(getCookie("current-user"));
function DOMReady(){
    $(".datepicker input").datepicker({format : "dd/mm/yyyy"})
    $(".uniform_on").uniform();
    $(".finish button").addClass("btn btn-primary");
    $(".description textarea").wysihtml5({
      events: {
        'change': function(){
            CallXsltFormEvent("descripcionCallBack",{
                descripcion: escape($(".description textarea").val())
            });
        }
      }
    });
    $(".comentario textarea").wysihtml5({
      events: {
        'change': function(){
            CallXsltFormEvent("comentarioCallBack",{
                comentario: escape($(".comentario textarea").val())
            });
        }
      }
    });
    $(".chzn-select").chosen();
    
    $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
        var $total = navigation.find('li').length;
        var $current = index+1;
        var $percent = ($current/$total) * 100;
        $('#rootwizard').find('.bar').css({width:$percent+'%'});
        // If it's the last tab then hide the last button and show the finish instead
        if($current >= $total) {
            $('#rootwizard').find('.pager .next').hide();
            $('#rootwizard').find('.pager .finish').show();
            $('#rootwizard').find('.pager .finish').removeClass('disabled');
        } else {
            $('#rootwizard').find('.pager .next').show();
            $('#rootwizard').find('.pager .finish').hide();
        }
    }});
    $(".load").fadeOut(800,function(){
        $(".block-content .span12").fadeIn();
    });
    /*$('#rootwizard .finish').click(function() {
        alert('Finished!, Starting over!');
        $('#rootwizard').find("a[href*='tab1']").trigger('click');
    });
    */
}

function ShowModal(title, message, oktext, okfunction, canceltext, cancelfunction){
    $("#myModal .modal-header h3").html(!title ? "": title);
    $("#myModal .modal-body").html(!message ? "": message);
    $("#myModal .modal-footer").empty();
    if (oktext) {
      if (!(typeof (okfunction) === 'function')) {
          okfunction = function () { $("#myModal").modal("hide"); };
      }
      $("#myModal .modal-footer").append('<a id="PopUpOK" class="btn btn-primary" href="javascript:void(0)">'+ oktext +'</a>');
      $("#PopUpOK").on("click", function(){ okfunction(); return false; });
   }
   if (canceltext) {
      if (!(typeof (okfunction) === 'function')) {
          cancelfunction = function () { $("#myModal").modal("hide"); };
      }
      $("#myModal .modal-footer").append('<a id="PopUpCANCEL" class="btn btn-primary" href="javascript:void(0)">'+ canceltext +'</a>');
      $("#PopUpCANCEL").on("click", function(){ cancelfunction(); return false; });
   }
   $("#myModal").modal("show");
}

function SuccessMessage(){
    ShowModal("La contribución ha sido creada con Éxito!", "Ahora puedes buscar la contribución en nuestra red de contribuciones :)", "Aceptar", function(){ window.location = "index.xq"; });
}
function ErrorMessage(){
    ShowModal("Error!", "Todos los campos son requeridos :)", "Aceptar");
}