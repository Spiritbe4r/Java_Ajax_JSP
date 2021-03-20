<jsp:include page="parte_superior.jsp" />


<!-- Content container -->
<div class="container">
    <br>
    <div id="registro" class="row">
        <div class="col-sm-12 ">

            <div class="card">
                <div class="card-header "><strong>
                        <h3>Registro de Cargos</h3>
                    </strong></div>
                <div class="card-body">
                    <input type="hidden" name="id" id="hddId" >


                    <div class="row form-group">
                        <label for="txtnombreCargo" class="col-form-label col-sm-3">Nombre
                            Cargo:</label>
                        <div class="col-sm-6">
                            <input type="text" name="nombreCargo" id="txtnombreCargo" class="form-control" required>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label for="txtcargoEstado" class="col-form-label col-sm-3">Estado
                            Cargo:</label>
                        <div class="col-sm-6">
                            <input type="number" name="estadoCargo" id="txtcargoEstado" min="0" max="1"
                                class="form-control" required>
                        </div>
                    </div>


                    <div class="col-sm-9 offset-sm-3">
                        <button id="btnCancelar" type="button"
                            class="btn btn-sm float-right ml-3 btn-light">Cancelar</button>
                        <button id="btnGuardar" type="button" class="btn btn-sm float-right btn-primary"
                            onclick="validar();">Guardar</button>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fas fa-search"></i>
                Mantenimiento de Cargos
            </h3>
        </div>
        <div class="card-body">
            <table id="tblCargo" class="table table-bordered table-hover" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Nro</th>

                        <th>Nombre Cargo</th>
                        <th>Estado Cargo</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div class="card-footer">
            <button class="btn btn-primary btn-flat btnTest float-right" onclick="Mostrar();">
                <i class="fas fa-plus"></i> Nuevo registro
            </button>
</div>

    </div>

</div>



<!-- Content Row -->





<jsp:include page="parte_inferior.jsp" />
<script type="text/javascript" src="cargo.js"></script>
<script>
    $(document).ready(function() {    
    $('#tblCargo').DataTable({        
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