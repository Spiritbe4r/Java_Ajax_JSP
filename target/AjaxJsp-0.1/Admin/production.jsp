<jsp:include page="parte_superior.jsp" />
      
                  
                        <!-- End of Topbar -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

                            </div>

                            <!-- Content container -->
                             <!-- Content container -->
        <div class="container">
            <br>
            <div id=registroP class="row">
                <div  class="col-sm-12 ">
                    
                    <div class="card">
                        <div class="card-header "><strong><h3>Registro de Producci&oacute;n</h3></strong></div>
                        <div class="card-body">
                            <input type="hidden" name="id" id="hddId" >
                            <div class="row form-group">
                                <label for="txtproductionName" class="col-form-label col-sm-3">Nombre Producci&oacute;n :</label>
                                <div class="col-sm-6">
                                    <input type="text" name="productionName" id="txtproductionName" class="form-control" autofocus="autofocus">
                                </div>
                            </div>
                            <div class="row form-group">
                                <label for="txtproductionProv" class="col-form-label col-sm-3">Proveedor Producci&oacute;n:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="productionProv" id="txtproductionProv" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <label for="txtproductionPrice" class="col-form-label col-sm-3">Precio:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="productionPrice" id="txtproductionPrice" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <label for="txtproductionCant" class="col-form-label col-sm-3">Cantidad:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="productionCant" id="txtproductionCant" class="form-control">
                                </div>
                            </div>
    
                            <div class="col-sm-9 offset-sm-3">
                                <button id="btnCancelar" type="button" class="btn btn-sm float-right ml-3 btn-light">Cancelar</button>
                                <button id="btnGuardar" type="button" class="btn btn-sm float-right btn-primary" onclick="validar();">Guardar</button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    
            
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fas fa-search"></i>
                            Mantenimiento de producciones
                        </h3>
                    </div>
                    <div class="card-body">
                        <table id="tblProduction" class="table table-bordered table-hover" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Nro</th>
                                    <th>Nombre Producci&oacute;n</th>
                                    <th>Proveedor Producci&oacute;n</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
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
            <script type="text/javascript" src="main.js"></script>
