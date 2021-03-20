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
<!-- Content container -->
<div class="container">
    <br>
    <div id ="registro" class="row">
        <div class="col-sm-12 ">

            <div class="card">
                <div class="card-header "><strong>
                        <h3>Registro de Usuarios</h3>
                    </strong></div>
                <div class="card-body">
                    <form action="" class="formulario" id="formulario">
                        <input type="hidden" name="id" id="hddId">
                        <div class="row form-group formulario__grupo" id="grupo__usuario">

                            <label for="txtuserName" class="col-form-label col-sm-3 formulario__label">Usuario :</label>
                            <div class="col-sm-6">
                                <input type="text" maxlength="20" name="Username" id="txtuserName"
                                    class="form-control " autofocus="autofocus" required pattern="[A-Za-z0-9]+">

                            </div>
                        </div>



                        <!--
                                <div class="formulario__grupo-input">
					<input type="text" class="formulario__input" name="nombre" id="nombre" placeholder="John Doe">
					<i class="formulario__validacion-estado fas fa-times-circle"></i>
				</div>
				<p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dígitos y solo puede contener numeros, letras y guion bajo.</p>
                            -->
                        <div class="row form-group">
                            <label for="txtPassword" class="col-form-label col-sm-3">Password:</label>
                            <div class="col-sm-6">
                                <input type="text" maxlength="40" name="uPassword" id="txtPassword"
                                    class="form-control" required pattern="[A-Za-z0-9]+">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="txtnomCompleto" class="col-form-label col-sm-3">Nombre Completo:</label>
                            <div class="col-sm-6">
                                <input type="text" name="uFullname" id="txtnomCompleto" class="form-control letras" required>
                            </div>
                        </div>

                        <div class="row form-group">
                            <label for="txtuserEstado" class="col-form-label col-sm-3">Estado:</label>
                            <div class="col-sm-6">
                                <input type="number" min="0" max ="1"name="userEstado" id="txtuserEstado" class="form-control" required pattern="[0-1]" onkeypress="return SoloNumeros(event);">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="txtuseridCargo" class="col-form-label col-sm-3">Id Cargo:</label>
                            <div class="col-sm-6">
                                <input type="number" name="idcargo" id="txtuseridCargo" min="0" max ="9" onkeypress="return SoloNumeros(event);" class="form-control" required pattern="[0-9]">
                            </div>
                        </div>


                        <div class="col-sm-9 offset-sm-3">
                            <button id="btnCancelar" type="button"
                                class="btn btn-sm float-right ml-3 btn-light">Cancelar</button>
                            <button id="btnGuardar" type="button" class="btn btn-sm float-right btn-primary"
                                onclick="validar();">Guardar</button>

                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>


    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fas fa-search"></i>
                Mantenimiento de Usuarios
            </h3>
        </div>
        <div class="card-body">
            <table id="tblUsers" class="table table-bordered table-hover" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Nro</th>
                        <th>Usuario</th>
                        <th>Password</th>
                        <th>Nombre Completo</th>
                        <th>Estado</th>
                        <th>Id Cargo</th>
                        <th>Cargo</th>
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



<!-- Content Row -->

<div class="row">

</div>




<jsp:include page="parte_inferior.jsp" />


<!-- cÃ³digo propio JS -->
<script type="text/javascript" src="users.js"></script>
<script>

</script>