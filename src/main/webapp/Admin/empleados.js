
var path = "http://localhost:8080/AjaxJsp/workers";

$(document).ready(function () {
    

    listar();
    $("#registro").hide()

    $('#btnGuardar').on('click', function (e) {
        guardar();
    });

    $('#btnCancelar').on('click', function (e) {
        limpiarForm();
    });

    $('body').on('click', 'button.editar', function (e) {
        var id = $(this).data('id');
        obtenerUsuario(id);
        Mostrar();
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
            $tbody = $('#tblEmpleados tbody');
            $tbody.empty();

            response.data.forEach((u, i) => {
                var tr = '<tr>';
                tr += '<td>' + (i + 1) + '</td>';
                tr += '<td>' + u.nombres + '</td>';
                tr += '<td>' + u.apellidos + '</td>';
                tr += '<td>' + u.sexo + '</td>';
                tr += '<td>' + u.telefono + '</td>';
                tr += '<td>' + u.dni + '</td>';
                tr += '<td>' + u.sueldo + '</td>';
                tr += '<td>' + u.cargo.idCargo + '</td>';

                tr += '<td>';
                tr += '<button class="btn btn-warning btn-xs btn-flat editar" data-id="' + u.id_worker + '"><i class="fas fa-edit"></i></button>';
                tr += '<button class="btn btn-danger btn-xs btn-flat ml-2 eliminar" data-id="' + u.id_worker + '"><i class="fas fa-trash-alt"></i></button>';
                tr += '</td>';
                tr += '</tr>';
                $tbody.append(tr);
            });
        }
    });
}

function guardar() {
    var valId = $('#hddId').val();
    var empleados = {
        id: (valId == '' ? 0 : valId),
        eNombres: $('#txteNombres').val(),
        eApellidos: $('#txteApellidos').val(),
        eSexo: $('#txteSexo').val(),
        telefono: $('#txteTelefono').val(),
        eDni: $('#txteDni').val(),
        sueldo: $('#txteSueldo').val(),
        idCargo: $('#txtidCargo').val()


    }


    $.ajax({
        type: "POST",
        url: path,
        data: empleados,
        dataType: "json",
        success: function (response) {
            toastr.success("Registro guardado correctamente");
            listar();
            limpiarForm();
        }
    });
}

function limpiarForm() {
    $('#hddId').val('');
    $('#txteNombres').val('');
    $('#txteApellidos').val('');
    $('#txteSexo').val('');
    $('#txteTelefono').val('');
    $('#txteDni').val('');
    $('#txteSueldo').val('');
    $('#txtidCargo').val('');


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
            $('#hddId').val(u.id_worker);
            $('#txteNombres').val(u.nombres);
            $('#txteApellidos').val(u.apellidos);
            $('#txteSexo').val(u.sexo);
            $('#txteTelefono').val(u.telefono);
            $('#txteDni').val(u.dni);
            $('#txteSueldo').val(u.sueldo);
            $('#txtidCargo').val(u.cargo.idCargo);

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
    var $txteNombres = $('#txteNombres');
    if ($txteNombres.val().trim() == '') {
        toastr.warning('Debe ingresar el Nombre de la Producción', 'Alerta');
        $txteNombres.focus();
        return false;
    }

    var $txteApellidos = $('#txteApellidos');
    if ($txteApellidos.val().trim() == '') {
        toastr.warning('Debe ingresar el Proveedor', 'Alerta');
        $txteApellidos.focus();
        return false;
    }

    var $txteApellidos = $('#txteApellidos');
    if ($txteApellidos.val().trim() == '') {
        toastr.warning('Debe ingresar el Precio', 'Alerta');
        $txteApellidos.focus();
        return false;
    }

    var $txteSexo = $('#txteSexo');
    if ($txteSexo.val().trim() == '') {
        toastr.warning('Debe ingresar la cantidad ', 'Alerta');
        $txteSexo.focus();
        return false;
    }
    var $txteTelefono = $('#txteTelefono');
    if ($txteTelefono.val().trim() == '') {
        toastr.warning('Debe ingresar la cantidad ', 'Alerta');
        $txteTelefono.focus();
        return false;
    }

    var $txteDni = $('#txteDni');
    if ($txteDni.val().trim() == '') {
        toastr.warning('Debe ingresar la cantidad ', 'Alerta');
        $txteDni.focus();
        return false;
    }

    var $txteSueldo = $('#txteSueldo');
    if ($txteSueldo.val().trim() == '') {
        toastr.warning('Debe ingresar la cantidad ', 'Alerta');
        $txteSueldo.focus();
        return false;
    }

    var $txtidCargo = $('#txtidCargo');
    if ($txtidCargo.val().trim() == '') {
        toastr.warning('Debe ingresar la cantidad ', 'Alerta');
        $txtidCargo.focus();
        return false;
    }

    return true;
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
        alert("Ingresar solo numeros");
        return false;
    }
}

function Mostrar() {


        $("#registro").show();


}
