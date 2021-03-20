
var path = "http://localhost:8080/AjaxJsp/Production";

$(document).ready(function () {
    listar();
    $("#registroP").hide()
   
    

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
            $tbody = $('#tblProduction tbody');
            $tbody.empty();

            response.data.forEach((u, i) => {
                var tr = '<tr>';
                tr += '<td>' + (i + 1) + '</td>';
                tr += '<td>' + u.productionName + '</td>';
                tr += '<td>' + u.productionProv + '</td>';
                tr += '<td>' + u.productionPrice + '</td>';
                tr += '<td>' + u.productionCant + '</td>';
                tr += '<td>';
                tr += '<button class="btn btn-warning btn-xs btn-flat editar" data-id="' + u.productionId + '"><i class="fas fa-edit"></i></button>';
                tr += '<button class="btn btn-danger btn-xs btn-flat ml-2 eliminar" data-id="' + u.productionId + '"><i class="fas fa-trash-alt"></i></button>';
                tr += '</td>';
                tr += '</tr>';
                $tbody.append(tr);
            });
        }
    });
}

function guardar() {
    var valId = $('#hddId').val();
    var productions = {
        id: (valId == '' ? 0 : valId),
        productionName: $('#txtproductionName').val(),
        productionProv: $('#txtproductionProv').val(),
        productionPrice: $('#txtproductionPrice').val(),
        productionCant: $('#txtproductionCant').val()
    }


    $.ajax({
        type: "POST",
        url: path,
        data: productions,
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
    $('#txtproductionName').val('');
    $('#txtproductionProv').val('');
    $('#txtproductionPrice').val('');
    $('#txtproductionCant').val('');

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
            $('#hddId').val(u.productionId);
            $('#txtproductionName').val(u.productionName);
            $('#txtproductionProv').val(u.productionProv);
            $('#txtproductionPrice').val(u.productionPrice);
            $('#txtproductionCant').val(u.productionCant);
        }
    });
}



// validacion

function validar() {
    var $txtproductionName = $('#txtproductionName');
    if ($txtproductionName.val().trim() == '') {
        toastr.warning('Debe ingresar el Nombre de la Producción', 'Alerta');
        $txtproductionName.focus();
        return false;
    }

    var $txtproductionProv = $('#txtproductionProv');
    if ($txtproductionProv.val().trim() == '') {
        toastr.warning('Debe ingresar el Proveedor', 'Alerta');
        $txtproductionProv.focus();
        return false;
    }

    var $txtproductionPrice = $('#txtproductionPrice');
    if ($txtproductionPrice.val().trim() == '') {
        toastr.warning('Debe ingresar el Precio', 'Alerta');
        $txtproductionPrice.focus();
        return false;
    }

    var $txtproductionCant = $('#txtproductionCant');
    if ($txtproductionCant.val().trim() == '') {
        toastr.warning('Debe ingresar la cantidad ', 'Alerta');
        $txtproductionCant.focus();
        return false;
    }

    return true;
}

function mostrar() {

    $("#registroP").show()


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