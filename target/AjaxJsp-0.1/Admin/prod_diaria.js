var path = "http://localhost:8080/AjaxJsp/prod_diaria";

$(document).ready(function () {
    //listar();
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




function guardar() {
    var valId = $('#hddId').val();
    var users = {
        id: (valId == '' ? 0 : valId),
        empleadoId : $('#txtempleadoId').val(),
        idCargo: $('#txtproductionIdcargo').val(),
        productionId: $('#txtproductionId').val(),
        cantidad: $('#txtproductionCant').val(),
        
        
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
    $('#txtempleadoId').val('');
    $('#txtproductionIdcargo').val('');
    $('#txtproductionId').val('');
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
            $('#hddId').val(u.id_prod_trab );
            $('#txtempleadoId').val(u.id_empleado.id_worker );
            $('#txtproductionIdcargo').val(u.id_cargo.idCargo);
            $('#txtproductionId').val(u.production_id.productionId );
            $('#txtproductionCant').val(u.cantidad_diaria);
            
            
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
                swal("Cancelado", "Cancelaste la eliminacion", "error");
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