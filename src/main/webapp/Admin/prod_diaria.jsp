<jsp:include page="parte_superior.jsp" />
      
                  
                        <!-- End of Topbar -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

                            </div>

                            <!-- Content container -->
                             <!-- Content container -->
        <div class="container-fluid">
            <br>
            <div id="registro" class="row">
                <div  class="col-sm-12 ">
                    
                    <div class="card">
                        <div class="card-header "><strong><h3>Registro de Producci&oacute;n Diaria</h3></strong></div>
                        <div class="card-body">
                            <input type="hidden" name="id" id="hddId" >
                            <div class="row form-group">
                                <label for="txtempleadoId" class="col-form-label col-sm-3">Id Empleado :</label>
                                <div class="col-sm-6">
                                    <input type="text" name="empleadoId" id="txtempleadoId" class="form-control" autofocus="autofocus" required>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label for="txtproductionIdcargo" class="col-form-label col-sm-3">Id Cargo:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="idCargo" id="txtproductionIdcargo" class="form-control" required>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label for="txtproductionId" class="col-form-label col-sm-3">Id Produccion:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="productionId" id="txtproductionId" class="form-control" required>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label for="txtproductionCant" class="col-form-label col-sm-3"><th>Cantidad Diaria</th>:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="productionCant" id="txtproductionCant" class="form-control" required>
                                </div>
                            </div>
    
                            <div class="col-sm-9 offset-sm-3">
                                <button id="btnCancelar" type="button" class="btn btn-sm float-right ml-3 btn-light">Cancelar</button>
                                <button id="btnGuardar" type="button" class="btn btn-sm float-right btn-primary" >Guardar</button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    
            
                <div class="card card-primary sm">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fas fa-search"></i>
                            Mantenimiento de produccion Diaria
                        </h3>
                    </div>
                    <div class="card-body">
                        <table id="tblProducDiaria" class="table table-bordered table-responsible" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Id Producion Diaria</th>
                                    <th>Id Empleado</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Id Cargo</th>
                                    <th>Nombre Cargo</th>
                                    <th>Id Produccion</th>
                                    <th>Precio Produccion</th>
                                    <th>Cantidad Diaria</th>
                                    
                                    <th>Fecha</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
    
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn-primary btn-flat btnTest float-right" onclick="mostrar();">
                            <i class="fas fa-plus"></i> Nuevo registro
                        </button>
                    </div>
                    
                </div>
            
        </div>



        </div>



  

    </div>


                            <!-- Content Row -->

                            <div class="row">

                            </div>

                        </div>
                            
<jsp:include page="parte_inferior.jsp" />


            <!-- cÃÂ³digo propio JS -->
            <script type="text/javascript" src="prod_diaria.js"></script>
            <script>
/*function listar() {
    $.ajax({
        type: "GET",
        url: path,
        success: function (response) {
            $tbody = $('#tblProducDiaria tbody');
            $tbody.empty();

            response.data.forEach((u, i) => {
                var tr = '<tr>';
                tr += '<td>' + (i + 1) + '</td>';
                tr += '<td>' + u.id_empleado.id_worker + '</td>';
                tr += '<td>' + u.id_empleado.nombres + '</td>';
                tr += '<td>' + u.id_empleado.apellidos + '</td>';
                tr += '<td>' + u.id_cargo.idCargo + '</td>';
                tr += '<td>' + u.id_cargo.nombreCargo + '</td>';
                tr += '<td>' + u.production_id.productionId + '</td>';
                tr += '<td>' + u.production_id.productionPrice + '</td>';
                tr += '<td>' + u.cantidad_diaria + '</td>';
                tr += '<td>' + u.fecha_trabaj + '</td>';
                tr += '<td>';
                tr += '<button class="btn btn-warning btn-xs btn-flat editar" data-id="' + u.id_prod_trab + '"><i class="fas fa-edit"></i></button>';
                tr += '<button class="btn btn-danger btn-xs btn-flat mt-3 eliminar" data-id="' + u.id_prod_trab + '"><i class="fas fa-trash-alt"></i></button>';
                tr += '</td>';
                tr += '</tr>';
                $tbody.append(tr);
            });
        }
    });
}*/




$(document).ready(function() { 
    var data = {action: "show"};   
    $('#tblProducDiaria').DataTable({ 
        
        ajax: {
                        url: "${pageContext.request.contextPath}/prod_diaria",
                        type: "get",
                        data: data,
                        dataSrc: "data"
                    }, 
                    "columns": [
                        {"data": "id_prod_trab"},
                        {"data": "id_empleado.id_worker"},
                        {"data": "id_empleado.nombres"},
                        {"data": "id_empleado.apellidos"},
                        {"data": "id_cargo.idCargo"},
                        {"data": "id_cargo.nombreCargo"},
                        {"data": "production_id.productionId"},
                        {"data": "production_id.productionPrice"},
                        {"data": "fecha_trabaj"},
                        {"data": "cantidad_diaria"},
                        {"data": "default"}
        
                    ],
                    columnDefs: [
                        {
                            targets: [-1],
                            class: 'text-center',
                            orderable: false,
                            render: function (data, type, row) {
                                var buttons = '<button class="btn-sm btn-warning btn-xs btn-flat editar" data-id="' + row.id_prod_trab + '"><i class="fas fa-edit"></i></button>';
                                
                                buttons += '<button class="btn-sm btn-danger btn-xs btn-flat ml-2 eliminar" data-id="' + row.id_prod_trab + '"><i class="fas fa-trash-alt"></i></button>';
                                return buttons;
                            }
                        },
                    ],      
        language: {
                "lengthMenu": "Mostrar _MENU_ registros",
                "zeroRecords": "No se encontraron resultados",
                "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sSearch": "Buscar:",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast":"Último",
                    "sNext":"Siguiente",
                    "sPrevious": "Anterior"
			     },
			     "sProcessing":"Procesando...",
            },
        //para usar los botones   
        responsive: "true",
        dom: 'Bfrtilp',       
        buttons:[ 
			{
				extend:    'excelHtml5',
				text:      '<i class="fas fa-file-excel"></i> ',
				titleAttr: 'Exportar a Excel',
				className: 'btn btn-success'
			},
			{
				extend:    'pdfHtml5',
				text:      '<i class="fas fa-file-pdf"></i> ',
				titleAttr: 'Exportar a PDF',
				className: 'btn btn-danger'
			},
			{
				extend:    'print',
				text:      '<i class="fa fa-print"></i> ',
				titleAttr: 'Imprimir',
				className: 'btn btn-info'
			},
		]	        
    });     
});
            </script>