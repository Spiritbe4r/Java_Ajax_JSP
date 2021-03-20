var path = "http://localhost:8080/AjaxJsp/cargo";

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

    $('body').on('click', 'button.logear', function (e) {
        var id = $(this).data('id');
        logear(id);
    })
});

function listar() {
    $.ajax({
        type: "GET",
        url: path,
        success: function (response) {
            $tbody = $('#tblCargo tbody');
            $tbody.empty();

            response.data.forEach((u, i) => {
                var tr = '<tr>';
                tr += '<td>' + (i + 1) + '</td>';
                tr += '<td>' + u.nombreCargo + '</td>';
                tr += '<td>' + u.estadoCargo + '</td>';
                tr += '<td>';
                tr += '<button class="btn btn-warning btn-xs btn-flat editar" data-id="' + u.idCargo + '"><i class="fas fa-edit"></i></button>';
                tr += '<button class="btn btn-danger btn-xs btn-flat ml-2 eliminar" data-id="' + u.idCargo + '"><i class="fas fa-trash-alt"></i></button>';
                tr += '</td>';
                tr += '</tr>';
                $tbody.append(tr);
            });
        }
    });
}

function guardar() {
    var valId = $('#hddId').val();
    var cargos = {
        id: (valId == '' ? 0 : valId),
        nombreCargo: $('#txtnombreCargo').val(),
        estadoCargo: $('#txtcargoEstado').val(),

    }


    $.ajax({
        type: "POST",
        url: path,
        data: cargos,
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
    $('#txtnombreCargo').val('');
    $('#txtcargoEstado').val('');


}

function obtenerUsuario(valId) {
    $.ajax({
        type: "GET",
        url: path,
        data: {
            id: valId
        },
        success: function (response) {
            $tbody = $(' #card-body', '#tblCargo');



            var u = response.data;
            $('#hddId').val(u.idCargo);
            $('#txtnombreCargo').val(u.nombreCargo);
            $('#txtcargoEstado').val(u.estadoCargo);

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
/*function eliminar(valId) {
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
}*/
// validacion

function validar() {
    var $txtnombreCargo = $('#txtnombreCargo');
    if ($txtnombreCargo.val().trim() == '') {
        toastr.warning('Debe ingresar el Nombre del Cargo', 'Alerta');
        $txtnombreCargo.focus();
        return false;
    }

    var $txtcargoEstado = $('#txtcargoEstado');
    if ($txtcargoEstado.val().trim() == '') {
        toastr.warning('Debe ingresar el Estado del Cargo', 'Alerta');
        $txtcargoEstado.focus();
        return false;
    }

    return true;
}

function Mostrar() {


        $("#registro").show();


}