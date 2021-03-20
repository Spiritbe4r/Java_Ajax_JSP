<%-- Document : index Created on : 26 dic. 2020, 20:37:45 Author : ronal --%>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <%try { String username=(String) session.getAttribute("username"); if (username==null) {
                response.sendRedirect("login.jsp"); } } catch (Exception e) { try {
                this.getServletConfig().getServletContext().getRequestDispatcher("404.jsp").forward(request, response);
                } catch (Exception ex) { System.out.println("Error" + e.getMessage()); } } %>
                <%try { int cargo=(int) session.getAttribute("id_cargo"); if (cargo!=1) {
                    response.sendRedirect("cargo.jsp"); } } catch (Exception e) { try {
                    this.getServletConfig().getServletContext().getRequestDispatcher("404.jsp").forward(request,
                    response); } catch (Exception ex) { System.out.println("Error" + e.getMessage()); } } %>

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
                        <link href="../sb_admin2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
                            type="text/css">
                        <link
                            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                            rel="stylesheet">

                        <!-- Custom styles for this template-->
                        <link href="../sb_admin2/css/sb-admin-2.min.css" rel="stylesheet">

                        <!-- toastr -->

                        <link rel="stylesheet" href="../assets/toastr/toastr.css" />

                        <link rel="stylesheet" href="../swetalert/sweetalert.css" />

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


                        <!--datables estilo bootstrap 4 CSS-->
                        <!-- CSS personalizado -->
                        <link rel="stylesheet" href="../datatables_c/jscss/main.css">

                        <!--datables CSS básico-->
                        <link rel="stylesheet" type="text/css" href="../datatables_c/datatables/datatables.min.css" />
                        <!--datables estilo bootstrap 4 CSS-->
                        <link rel="stylesheet" type="text/css"
                            href="../datatables_c/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">

                    </head>

                    <body id="page-top">

                        <!-- Page Wrapper -->
                        <div id="wrapper">

                            <!-- Sidebar -->
                            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
                                id="accordionSidebar">

                                <!-- Sidebar - Brand -->
                                <a class="sidebar-brand d-flex align-items-center justify-content-center"
                                    href="index.html">
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
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                        data-target="#collapseUtilities" aria-expanded="true"
                                        aria-controls="collapseUtilities">
                                        <i class="fas fa-fw fa-wrench"></i>
                                        <span>Utilitarios</span>
                                    </a>
                                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                                        data-parent="#accordionSidebar">
                                        <div class="bg-white py-2 collapse-inner rounded">
                                            <h6 class="collapse-header">Seccion de Usuarios:</h6>
                                            <a class="collapse-item" href="usuario.jsp">Listado de Producciones</a>
                                            <a class="collapse-item" href="">Ventas</a>

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
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                        data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
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
                                

                                <!-- Nav Item - Tables -->
                                

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
                                    <nav
                                        class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                                        <!-- Sidebar Toggle (Topbar) -->
                                        <button id="sidebarToggleTop"
                                            class="btn btn-link d-md-none rounded-circle mr-3">
                                            <i class="fa fa-bars"></i>
                                        </button>

                                        <!-- Topbar Search -->


                                        <!-- Topbar Navbar -->
                                        <ul class="navbar-nav ml-auto">

                                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                                            <li class="nav-item dropdown no-arrow d-sm-none">
                                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown"
                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    <i class="fas fa-search fa-fw"></i>
                                                </a>
                                                <!-- Dropdown - Messages -->
                                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                                    aria-labelledby="searchDropdown">
                                                    <form class="form-inline mr-auto w-100 navbar-search">
                                                        <div class="input-group">
                                                            <input type="text"
                                                                class="form-control bg-light border-0 small"
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
                                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown"
                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Bienvenido
                                                        :
                                                        ${username}</span>


                                                    <img class="img-profile rounded-circle"
                                                        src="../sb_admin2/img/user8.jpg">

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
                                                        <i
                                                            class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                                        Cerrar Sessión
                                                    </a>
                                                </div>
                                            </li>

                                        </ul>

                                    </nav>



                                    <!-- End of Topbar -->