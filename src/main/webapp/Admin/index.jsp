<%-- Document : index Created on : 26 dic. 2020, 20:37:45 Author : ronal --%>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <%try { String username=(String) session.getAttribute("username"); if (username==null) {
                response.sendRedirect("login.jsp"); }
               
                        
                    } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("404.jsp").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
        }
            
            %>
            <%try { int cargo=(int) session.getAttribute("id_cargo"); if (cargo!=1) {
                response.sendRedirect("usuario.jsp"); }
                
                        
                    } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("404.jsp").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
        }
    %>

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
                            <li class="nav-item">
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
                            </li>

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
                                <h6 class="collapse-header">Utilidades :</h6>
                                <a class="collapse-item" href="#">Enviar Correos</a>
                                <a class="collapse-item" href="#">Subir Imagenes</a>

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


                            <jsp:include page="content.jsp" />


                        </div>
                        <!-- End of Main Content -->

                        <!-- Footer -->
                        <footer class="sticky-footer bg-white">
                            <div class="container my-auto">
                                <div class="copyright text-center my-auto">
                                    <span>Copyright &copy; Your Website 2020</span>
                                </div>
                            </div>
                        </footer>
                        <!-- End of Footer -->

                    </div>
                    <!-- End of Content Wrapper -->

                    </div>
                    <!-- End of Page Wrapper -->

                    <!-- Scroll to Top Button-->
                    <a class="scroll-to-top rounded" href="#page-top">
                        <i class="fas fa-angle-up"></i>
                    </a>

                    <!-- Logout Modal-->
                    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Listo para Salir ?</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">Selecciona "Salir"
                                    abajo si estas listo para cerrar tu sesión actual.</div>
                                <div class="modal-footer">
                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                    <a class="btn btn-primary" href="../Logout">Salir</a>
                                </div>
                            </div>
                        </div>
                    </div>




                    <!-- Bootstrap core JavaScript-->
                    <script src="../sb_admin2/vendor/jquery/jquery.min.js"></script>
                    <script src="../sb_admin2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                    <!-- Core plugin JavaScript-->
                    <script src="../sb_admin2/vendor/jquery-easing/jquery.easing.min.js"></script>

                    <!-- Custom scripts for all pages-->
                    <script src="../sb_admin2/js/sb-admin-2.min.js"></script>

                    <!-- datatables JS -->

                    <!-- Page level plugins -->
                    <script src="../sb_admin2/vendor/datatables/jquery.dataTables.min.js"></script>
                    <script src="../sb_admin2/vendor/datatables/dataTables.bootstrap4.min.js"></script>


                    <!-- cÃ³digo propio JS -->
                   <!--<script type="text/javascript" src="main.js"></script>-->

                    <!-- toastr y jquery-->

                    <script src="../assets/jquery/jquery-3.5.1.js"></script>

                    <script src="../assets/toastr/toastr.js"></script>




                    <!--<script>
            $(document).ready(function () {
                listar();
                guardar();
            });
        
            $("#btn_listar").on("click", function () {
                listar();
            })
        
            var guardar = function () {
                $("form".on("submit", function (e) {
                    e.preventDefault();
                    var frm = $(this).serialize();
                    console.log(frm);
        
                }));
            }
        
        
            var listar = function () {
                var data = {action: "show"};
                var table = $('#mytable').DataTable({
                    destroy: true, //propiedad para reinicializar
                    ajax: {
                        url: "${pageContext.request.contextPath}/Production",
                        type: "get",
                        data: data,
                        dataSrc: "data"
                    },
                    "columns": [
                        {"data": "productionId"},
                        {"data": "productionName"},
                        {"data": "productionProv"},
                        {"data": "productionPrice"},
                        {"data": "productionCant"},
                        {"data": "default"}
        
                    ],
                    columnDefs: [
                        {
                            targets: [-1],
                            class: 'text-center',
                            orderable: false,
                            render: function (data, type, row) {
                                var buttons = '<a href="#" class="btn btn-warning btn-xs btn-flat"><i class="fas fa-edit"></i></a> ';
                                buttons += '<a href="=' + row.productionId + '" type="button" class="btn btn-danger btn-xs btn-flat"><i class="fas fa-trash-alt"></i></a>';
                                return buttons;
                            }
                        },
                    ],
        
                    "language": idioma_espanol,
        
                    initComplete: function (settings, json) {
        
                    }
        
                });
                /*
        
                obtener_data_editar("#mytable tbody", table);
            },
        
            var obtener_data_editar = function (tbody, table) {
                $(tbody).on("click", "button.editar", function () {
                    var data = table.row($(this).parents("tr")).data();
                    console.log(data);
                });
            },*/
        
        
        
            var idioma_espanol = {
                "processing": "Procesando...",
                "lengthMenu": "Mostrar _MENU_ registros",
                "zeroRecords": "No se encontraron resultados",
                "emptyTable": "NingÃºn dato disponible en esta tabla",
                "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                "search": "Buscar:",
                "infoThousands": ",",
                "loadingRecords": "Cargando...",
                "paginate": {
                    "first": "Primero",
                    "last": "Ãltimo",
                    "next": "Siguiente",
                    "previous": "Anterior"
                },
                "aria": {
                    "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sortDescending": ": Activar para ordenar la columna de manera descendente"
                },
                "buttons": {
                    "copy": "Copiar",
                    "colvis": "Visibilidad",
                    "collection": "ColecciÃ³n",
                    "colvisRestore": "Restaurar visibilidad",
                    "copyKeys": "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
                    "copySuccess": {
                        "1": "Copiada 1 fila al portapapeles",
                        "_": "Copiadas %d fila al portapapeles"
                    },
                    "copyTitle": "Copiar al portapapeles",
                    "csv": "CSV",
                    "excel": "Excel",
                    "pageLength": {
                        "-1": "Mostrar todas las filas",
                        "1": "Mostrar 1 fila",
                        "_": "Mostrar %d filas"
                    },
                    "pdf": "PDF",
                    "print": "Imprimir"
                },
                "autoFill": {
                    "cancel": "Cancelar",
                    "fill": "Rellene todas las celdas con <i>%d<\/i>",
                    "fillHorizontal": "Rellenar celdas horizontalmente",
                    "fillVertical": "Rellenar celdas verticalmentemente"
                },
                "decimal": ",",
                "searchBuilder": {
                    "add": "AÃ±adir condiciÃ³n",
                    "button": {
                        "0": "Constructor de bÃºsqueda",
                        "_": "Constructor de bÃºsqueda (%d)"
                    },
                    "clearAll": "Borrar todo",
                    "condition": "CondiciÃ³n",
                    "conditions": {
                        "date": {
                            "after": "Despues",
                            "before": "Antes",
                            "between": "Entre",
                            "empty": "VacÃ­o",
                            "equals": "Igual a",
                            "not": "No",
                            "notBetween": "No entre",
                            "notEmpty": "No Vacio"
                        },
                        "moment": {
                            "after": "Despues",
                            "before": "Antes",
                            "between": "Entre",
                            "empty": "VacÃ­o",
                            "equals": "Igual a",
                            "not": "No",
                            "notBetween": "No entre",
                            "notEmpty": "No vacio"
                        },
                        "number": {
                            "between": "Entre",
                            "empty": "Vacio",
                            "equals": "Igual a",
                            "gt": "Mayor a",
                            "gte": "Mayor o igual a",
                            "lt": "Menor que",
                            "lte": "Menor o igual que",
                            "not": "No",
                            "notBetween": "No entre",
                            "notEmpty": "No vacÃ­o"
                        },
                        "string": {
                            "contains": "Contiene",
                            "empty": "VacÃ­o",
                            "endsWith": "Termina en",
                            "equals": "Igual a",
                            "not": "No",
                            "notEmpty": "No Vacio",
                            "startsWith": "Empieza con"
                        }
                    },
                    "data": "Data",
                    "deleteTitle": "Eliminar regla de filtrado",
                    "leftTitle": "Criterios anulados",
                    "logicAnd": "Y",
                    "logicOr": "O",
                    "rightTitle": "Criterios de sangrÃ­a",
                    "title": {
                        "0": "Constructor de bÃºsqueda",
                        "_": "Constructor de bÃºsqueda (%d)"
                    },
                    "value": "Valor"
                },
                "searchPanes": {
                    "clearMessage": "Borrar todo",
                    "collapse": {
                        "0": "Paneles de bÃºsqueda",
                        "_": "Paneles de bÃºsqueda (%d)"
                    },
                    "count": "{total}",
                    "countFiltered": "{shown} ({total})",
                    "emptyPanes": "Sin paneles de bÃºsqueda",
                    "loadMessage": "Cargando paneles de bÃºsqueda",
                    "title": "Filtros Activos - %d"
                },
                "select": {
                    "1": "%d fila seleccionada",
                    "_": "%d filas seleccionadas",
                    "cells": {
                        "1": "1 celda seleccionada",
                        "_": "$d celdas seleccionadas"
                    },
                    "columns": {
                        "1": "1 columna seleccionada",
                        "_": "%d columnas seleccionadas"
                    }
                },
                "thousands": "."
            },
        
        }
        
        </script>-->



                </body>

                </html>