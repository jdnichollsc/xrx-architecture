var data;
$("#login").on("click",function(e){
    e.preventDefault();
    var username = $.trim($("#username").val());
    var password = $.trim($("#password").val());
    if(username && password)
    {
        $.blockUI({ message: null }); 
        $.post("dologin.xq",{
                usuario: username,
                password: password
            },
            function (response) {
                var $xml = $(response);
                $.unblockUI();
                if($xml.find("State").text() == "OK"){
                    window.location = "user/index.xq";
                }
                else
                {
                    var n = noty({
                        text: $xml.find("Message").text(),
                        type: "warning",
                        dismissQueue: true,
                        layout: 'bottom',
                        animation: {
                            open: { height: 'toggle' },
                            close: { height: 'toggle' },
                            easing: 'swing'
                        },
                        timeout: 3000
                    });
                }
        });
    }
    else
    {
        var n = noty({
            text: "Debe ingresar todos los campos para continuar :)",
            type: "information",
            dismissQueue: true,
            layout: 'bottom',
            animation: {
                open: { height: 'toggle' },
                close: { height: 'toggle' },
                easing: 'swing'
            },
            timeout: 3000
        });
    }
});