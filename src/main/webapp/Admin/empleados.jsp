<jsp:include page="parte_superior.jsp" />
<style>
    input:valid,
    textarea:valid {
        border-color: #90EE90;
    }

    input:invalid,
    textarea:invalid {
        border-color: #ED8F8F;
    }
</style>

<!-- End of Topbar -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

    </div>

    <!-- Content container -->
    <div class="container">
        
        <br>
        <div id="registro" class="row " >
            <div class="col-sm-12 ">

                <div class="card">
                    <div class="card-header "><strong>
                            <h3>Registro de Empleados</h3>
                        </strong></div>
                    <div class="card-body">
                        <input type="hidden" name="id" id="hddId">
                        <div class="row form-group">
                            <label for="txteNombres" class="col-form-label col-sm-3">Nombres :</label>
                            <div class="col-sm-6">
                                <input type="text" required pattern="[A-Za-z]+" name="eNombres" id="txteNombres"
                                    class="form-control letras" autofocus="autofocus">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="txteApellidos" class="col-form-label col-sm-3">Apellidos:</label>
                            <div class="col-sm-6">
                                <input type="text" required pattern="[A-Za-z]+" name="eApellidos" id="txteApellidos"
                                    class="form-control letras">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="txteSexo" class="col-form-label col-sm-3">Sexo:</label>
                            <div class="col-sm-6">
                                <input type="text" maxlength="1" name="eSexo" id="txteSexo" class="form-control letras" required>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="txteTelefono" class="col-form-label col-sm-3">Telefono:</label>
                            <div class="col-sm-6">
                                <input type="text" onkeypress="return SoloNumeros(event);" name="telefono" id="txteTelefono"
                                    class="form-control" required>
                            </div>
                        </div>


                        <div class="row form-group">
                            <label for="txteDni" class="col-form-label col-sm-3">Dni:</label>
                            <div class="col-sm-6">

                                <input type="text" minlength="8" maxlength="8" 
                                     name="eDni" id="txteDni" class="form-control" onkeypress="return SoloNumeros(event);"required>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="txteSueldo" class="col-form-label col-sm-3">Sueldo:</label>
                            <div class="col-sm-6">
                                <input type="text"  required  maxlength="7" pattern="^[0-9]+(.[0-9]+)?$"  name="sueldo" id="txteSueldo"
                                    class="form-control number" >
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="txtidCargo" class="col-form-label col-sm-3">Id Cargo:</label>
                            <div class="col-sm-6">
                                <input type="number" min ="1" max="10" maxlength="2" name="idCargo" id="txtidCargo"
                                    class="form-control number" required>
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
                    Mantenimiento de Empleados
                </h3>

            </div>
            <div class="card-body">
                <table id="tblEmpleados" class="table table-bordered table-hover" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Nro</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Sexo</th>
                            <th>Telefono</th>

                            <th>Dni</th>
                            <th>Sueldo</th>
                            <th>Id Cargo</th>
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

    <div class="row">

    </div>





</div>


<jsp:include page="parte_inferior.jsp" />
<!-- cÃ³digo propio JS -->
<script type="text/javascript" src="empleados.js"></script>
<script>
    
</script>