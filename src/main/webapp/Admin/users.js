
var path = "http://localhost:8080/AjaxJsp/Users";

$(document).ready(function () {
    listar();
    $("#registro").hide();
    
    


    $('#btnGuardar').on('click', function (e) {
        guardar();
    });

    $('#btnCancelar').on('click', function (e) {
        limpiarForm();
    });

    $('body').on('click', 'button.editar', function (e) {
        var id = $(this).data('id');
        obtenerUsuario(id);
        mostrar();
    });

    $('body').on('click', 'button.eliminar', function (e) {
        AlertaEliminar();
    })

    
});

function listar() {
    $.ajax({
        type: "GET",
        url: path,
        success: function (response) {
            $tbody = $('#tblUsers tbody');
            $tbody.empty();

            response.data.forEach((u, i) => {
                var tr = '<tr>';
                tr += '<td>' + (i + 1) + '</td>';
                tr += '<td>' + u.Username + '</td>';
                tr += '<td>' + u.uPassword+ '</td>';
                tr += '<td>' + u.uFullname + '</td>';
                tr += '<td>' + u.userEstado + '</td>';
                tr += '<td>' + u.userCargo.idCargo + '</td>';
                tr += '<td>' + u.userCargo.nombreCargo + '</td>';
                tr += '<td>';
                tr += '<button class="btn btn-warning btn-xs btn-flat editar" data-id="' + u.idUser + '"><i class="fas fa-edit"></i></button>';
                tr += '<button class="btn btn-danger btn-xs btn-flat ml-2 eliminar" data-id="' + u.idUser + '"><i class="fas fa-trash-alt"></i></button>';
                tr += '</td>';
                tr += '</tr>';
                $tbody.append(tr);
            });
        }
    });
}

function guardar() {
    var valId = $('#hddId').val();
    var users = {
        id: (valId == '' ? 0 : valId),
        Username : $('#txtuserName').val(),
        uPassword: $('#txtPassword').val(),
        uFullname: $('#txtnomCompleto').val(),
        userEstado: $('#txtuserEstado').val(),
        idcargo: $('#txtuseridCargo').val(),
        
    }



    $.ajax({
        type: "POST",
        url: path,
        data: users,
        dataType: "json",
        success: function (response) {
            swal("Buen Trabajo !", "Usuario Guardado Correctamente !", "success", {
                button: "Ok !",
              });
            listar();
            limpiarForm();
        }
    });
}

function limpiarForm() {
    $('#hddId').val('');
    $('#txtuserName').val('');
    $('#txtPassword').val('');
    $('#txtnomCompleto').val('');
    $('#txtuserEstado').val('');
    $('#txtuseridCargo').val('');
    

}

function obtenerUsuario(valId) {
    $.ajax({
        type: "GET",
        url: path,
        data: {
            id: valId
        },
        success: function (response) {
            $tbody = $(' #card-body');



            var u = response.data;
            $('#hddId').val(u.idUser);
            $('#txtuserName').val(u.Username );
            $('#txtPassword').val(u.uPassword);
            $('#txtnomCompleto').val(u.uFullname );
            $('#txtuserEstado').val(u.userEstado);
            $('#txtuseridCargo').val(u.userCargo.idCargo);
            
        }
    });
}


function eliminar(valId) {
    $.ajax({
        type: "GET",
        url: path,
        data: {
            accion: "eliminar",
            id: valId
        },
        success: function (response) {
            switch (response.rpta) {
                case -1:
                    toastr.danger(response.msg, "Respuesta");
                    break;
                case 0:
                    toastr.warning(response.msg, "Respuesta");
                    break;
                case 1:
                    toastr.success(response.msg, "Respuesta");
                    listar();
                    break;
            }
        }
    });
}
// validacion

function validar() {
    var $txtuserName = $('#txtuserName');
    if ($txtuserName.val().trim() == '') {
        swal({
            title: 'Alerta',
            text:'Debe ingresar su Nickname ga',
            type: 'warning',
            customClass: 'sweetalert-lg'
           
      });
        
       
        $txtuserName.focus();
        return false;
    }

    var $txtPassword = $('#txtPassword');
    if ($txtPassword.val().trim() == '') {
        swal({
            title: 'Alerta',
            text:'Debe ingresar una Contraseña',
            type: 'warning',
            
           
      });
        $txtPassword.focus();
        return false;
    }

    var $txtnomCompleto = $('#txtnomCompleto');
    if ($txtnomCompleto.val().trim() == '') {
        swal({
            title: 'Alerta',
            text:'Ingrese Nombre Completo',
            type: 'warning',
            
           
      });
        $txtnomCompleto.focus();
        return false;
    }

    var $txtuserEstado = $('#txtuserEstado');
    if ($txtuserEstado.val().trim() == '') {
        swal({
            title: 'Alerta',
            text:'Ingrese Estado del Usuario',
            type: 'warning',
            
           
      });
        $txtuserEstado.focus();
        return false;
    }
    var $txtuseridCargo = $('#txtuseridCargo');
    if ($txtuseridCargoo.val().trim() == '') {
        swal({
            title: 'Alerta',
            text:'Ingrese el Id Cargo del Usuario',
            type: 'warning',
            
           
      });
        $txtuseridCargo.focus();
        return false;
    }

    return true;
}



$(".letras").keypress(function (key) {
    window.console.log(key.charCode)
    if ((key.charCode < 97 || key.charCode > 122)//letras mayusculas
        && (key.charCode < 65 || key.charCode > 90) //letras minusculas
        && (key.charCode != 45) //retroceso
        && (key.charCode != 241) //ñ
        && (key.charCode != 209) //Ñ
        && (key.charCode != 32) //espacio
        && (key.charCode != 225) //á
        && (key.charCode != 233) //é
        && (key.charCode != 237) //í
        && (key.charCode != 243) //ó
        && (key.charCode != 250) //ú
        && (key.charCode != 193) //Á
        && (key.charCode != 201) //É
        && (key.charCode != 205) //Í
        && (key.charCode != 211) //Ó
        && (key.charCode != 218) //Ú

    )
        return false;
});


function SoloNumeros(evt) {
    if (window.event) {
        keynum = evt.keyCode;
    }
    else {
        keynum = evt.which;
    }

    if ((keynum > 47 && keynum < 58) || keynum == 8 || keynum == 13) {
        return true;
    }
    else {
        swal({
            title: 'Alerta',
            text:'Ingrese solo Numeros',
            type: 'warning',
            
           
      });
        return false;
    }
}


function eliminarUsuario(id) {
    // var url=cargo?accion=eliminar&id="+id;
    // var cod = $(this).parent().find('#codigo').val();

    var id = $('button.eliminar').data('id');
    //var url = "http://localhost:8080/AjaxJsp/cargo?accion=eliminar&id=" + id;

    console.log("eliminado");
    $.ajax({
        type: 'GET',
        url: path,
        data: {
            accion: "eliminar",
            id: id
        },
        async: true,
        success: function (response) {
            switch (response.rpta) {
                case -1:
                    swal(response.msg, "danger");
                    break;
                case 0:
                    swal(response.msg, "Respuesta", "warning");
                    break;
                case 1:
                    // swal("Eliminado!", "El usuario se ha eliminado", "success");
                    swal(response.msg, "Respuesta", "success");
                    listar();
                    break;
            }
        }
    });
}
function AlertaEliminar() {
    //e.preventDefault();
    var id = $(this).data('id');
    //var cod = $(this).parent().find('#codigo').val();data('id');
    swal({
        title: "Esta Seguro de Eliminar?",
        text: "Una vez eliminado no se podra Recuperar !",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Si, Eliminar!",
        cancelButtonText: "No, Cancelar!",
        closeOnConfirm: false,
        closeOnCancel: false
    },
        function (isConfirm) {
            if (isConfirm) {
                eliminarUsuario(id);
                //swal("Eliminado!", "El usuario se ha eliminado", "success");

            } else {
                swal("Cancelado", "Cancelaste la eliminación", "error");
            }
        });
}

function eliminarUsuario(id) {
    // var url=cargo?accion=eliminar&id="+id;
    // var cod = $(this).parent().find('#codigo').val();

    var id = $('button.eliminar').data('id');
    //var url = "http://localhost:8080/AjaxJsp/cargo?accion=eliminar&id=" + id;

    console.log("eliminado");
    $.ajax({
        type: 'GET',
        url: path,
        data: {
            accion: "eliminar",
            id: id
        },
        async: true,
        success: function (response) {
            switch (response.rpta) {
                case -1:
                    swal(response.msg, "danger");
                    break;
                case 0:
                    swal(response.msg, "Respuesta", "warning");
                    break;
                case 1:
                    // swal("Eliminado!", "El usuario se ha eliminado", "success");
                    swal(response.msg, "Respuesta", "success");
                    listar();
                    break;
            }
        }
    });
}

function mostrar() {

    $("#registro").show();


}