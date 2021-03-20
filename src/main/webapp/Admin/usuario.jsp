<%-- Document : index Created on : 26 dic. 2020, 20:37:45 Author : ronal --%>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            

                <!DOCTYPE html>
                <html lang="en">

                <head>

                    <meta charset="utf-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                    <meta name="description" content="">
                    <meta name="author" content="">

                    <title>SB Admin 2 - Dashboard</title>

                    <!-- Custom fonts for this template-->
                    <link href="../sb_admin2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
                    <link
                        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                        rel="stylesheet">

                    <!-- Custom styles for this template-->
                    <link href="../sb_admin2/css/sb-admin-2.min.css" rel="stylesheet">

                    <!-- toastr -->

                    <link rel="stylesheet" href="../assets/toastr/toastr.css" />

                    <link rel="stylesheet" href="../datatables_c/jscss/main.css">


                    <!--datables estilo bootstrap 4 CSS-->
                    <link rel="stylesheet" type="text/css"
                        href="../sb_admin2/vendor/datatables/dataTables.bootstrap4.min.css">

                </head>

                <body id="page-top">

                    <!-- Page Wrapper -->
                    <div id="wrapper">

                        <!-- Sidebar -->
                        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                            <!-- Sidebar - Brand -->
                            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                                <div class="sidebar-brand-icon rotate-n-15">
                                    <i class="fas fa-laugh-wink"></i>
                                </div>
                                <div class="sidebar-brand-text mx-3">Text Admin <sup>2.0</sup></div>
                            </a>

                            <!-- Divider -->
                            <hr class="sidebar-divider my-0">

                            <!-- Nav Item - Dashboard -->
                            <a class="nav-link dropdown-toggle mx-auto" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">


                                <img class="img-profile rounded-circle mx-auto" src="../sb_admin2/img/user8.jpg">

                            </a>
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small mx-auto">${username}</span>


                            <!-- Divider -->
                            <hr class="sidebar-divider">

                            <!-- Heading -->
                            <div class="sidebar-heading">
                                Interface
                            </div>

                            <!-- Nav Item - Pages Collapse Menu -->
                           <!-- <li class="nav-item">
                                <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                    data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                    <i class="fas fa-fw fa-cog"></i>
                                    <span>Panel Administrativo</span>
                                </a>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                                    data-parent="#accordionSidebar">
                                    <div class="bg-white py-2 collapse-inner rounded">
                                        <h6 class="collapse-header">Registros:</h6>
                                        <a class="collapse-item"> <i class="fa fa-archive mr-2"></i>Categorias</a>
                                        <a class="collapse-item" href="production.jsp"><i
                                                class="fa fa-truck mr-2"></i>Producciones</a>
                                        <a class="collapse-item" href="users.jsp"><i
                                                class="fa fa-users mr-2"></i>Usuarios</a>

                                        <a class="collapse-item" href="cargo.jsp"><i
                                                class="fa fa-tags mr-2"></i>Cargos</a>
                                        <a class="collapse-item" href="prod_diaria.jsp"><i
                                                class="fa fa-cube mr-2"></i>Produccion Diaria</a>
                                        <a class="collapse-item" href="empleados.jsp"><i
                                                class="fa fa-user-plus mr-2"></i>Empleados</a>
                                        


                                    </div>
                                </div>
                            </li>-->

                    <!-- Nav Item - Utilities Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                            aria-expanded="true" aria-controls="collapseUtilities">
                            <i class="fas fa-fw fa-wrench"></i>
                            <span>Utilitarios</span>
                        </a>
                        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                            data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Utilidades Personalizadas:</h6>
                                <a class="collapse-item" href="#">Subir Productos</a>
                                <a class="collapse-item" href="#">Listado de Productos</a>

                                <a class="collapse-item" href="#">Otros</a>
                            </div>
                        </div>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Heading -->
                    <div class="sidebar-heading">
                        Addons
                    </div>

                    <!-- Nav Item - Pages Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                            aria-expanded="true" aria-controls="collapsePages">
                            <i class="fas fa-fw fa-folder"></i>
                            <span>Paginas</span>
                        </a>
                        <div id="collapsePages" class="collapse" aria-labelledby="headingPages"
                            data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Pantallas de Login:</h6>
                                <a class="collapse-item" href="login.jsp">Iniciar Sessión</a>
                                <a class="collapse-item" href="register.jsp">Registrase</a>
                                <a class="collapse-item" href="forgot-password.jsp">Olvido Contraseña</a>
                                <div class="collapse-divider"></div>
                                <h6 class="collapse-header">Otras Paginas:</h6>
                                <a class="collapse-item" href="404.jsp">404 Pagina error</a>
                                
                            </div>
                        </div>
                    </li>

                    <!-- Nav Item - Charts -->
                    
                    <!-- Divider -->
                    <hr class="sidebar-divider d-none d-md-block">

                    <!-- Sidebar Toggler (Sidebar) -->
                    <div class="text-center d-none d-md-inline">
                        <button class="rounded-circle border-0" id="sidebarToggle"></button>
                    </div>

                    <!-- Sidebar Message -->
                    

                    </ul>
                    <!-- End of Sidebar -->

                    <!-- Content Wrapper -->
                    <div id="content-wrapper" class="d-flex flex-column">

                        <!-- Main Content -->
                        <div id="content">

                            <!-- Topbar -->
                            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                                <!-- Sidebar Toggle (Topbar) -->
                                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                    <i class="fa fa-bars"></i>
                                </button>

                                <!-- Topbar Search -->


                                <!-- Topbar Navbar -->
                                <ul class="navbar-nav ml-auto">

                                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                                    <li class="nav-item dropdown no-arrow d-sm-none">
                                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-search fa-fw"></i>
                                        </a>
                                        <!-- Dropdown - Messages -->
                                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                            aria-labelledby="searchDropdown">
                                            <form class="form-inline mr-auto w-100 navbar-search">
                                                <div class="input-group">
                                                    <input type="text" class="form-control bg-light border-0 small"
                                                        placeholder="Search for..." aria-label="Search"
                                                        aria-describedby="basic-addon2">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary" type="button">
                                                            <i class="fas fa-search fa-sm"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </li>

                                    <!-- Nav Item - Alerts -->

                                    <!-- Nav Item - User Information -->
                                    <li class="nav-item dropdown no-arrow">
                                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Bienvenido :
                                                ${username}</span>


                                            <img class="img-profile rounded-circle" src="../sb_admin2/img/user8.jpg">

                                        </a>

                                        <!-- <p>
                                        <small>Usted es,${Users.Cargo.nombreCargo} </small>
                                        </p>-->
                                        <!-- Dropdown - User Information -->
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                            aria-labelledby="userDropdown">
                                            <a class="dropdown-item" href="#">
                                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                                Perfil
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                                Configuraciones
                                            </a>
                                            
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="/Logout" data-toggle="modal"
                                                data-target="#logoutModal">
                                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                                Cerrar Sessión
                                            </a>
                                        </div>
                                    </li>

                                </ul>

                            </nav>
       
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    
                  
      
                  
                        <!-- End of Topbar -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

                            </div>

                            <!-- Content container -->
                             <!-- Content container -->
      
            <br>
            
    
            
                <div class="card card-primary sm">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fas fa-search"></i>
                            Mantenimiento de producciones
                        </h3>
                    </div>
                    <div class="card-body">
                        <table id="tblProduct" class="table table-bordered table-responsible" cellspacing="0" width="100%">
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
    $('#tblProduct').DataTable({ 
        
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
                                var buttons = '<button class="btn-sm btn-warning btn-xs btn-flat mr-2" data-id="' + row.id_prod_trab + '"><i class="fas fa-edit"></i></button>';
                                
                                buttons += '<button class="btn-sm btn-danger btn-xs btn-flat  " data-id="' + row.id_prod_trab + '"><i class="fas fa-trash-alt"></i></button>';
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

                    <!-- DataTales Example -->
         
                <!-- /.container-fluid -->
           
               
                 <!--now add post js-->
  