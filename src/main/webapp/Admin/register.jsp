<%-- Document : register Created on : 9 ene. 2021, 20:43:12 Author : ronal --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>SB Admin 2 - Register</title>

            <!-- Custom fonts for this template-->
            <link href="../sb_admin2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
            <link
                href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                rel="stylesheet">

            <!-- Custom styles for this template-->
            <link href="../sb_admin2/css/sb-admin-2.min.css" rel="stylesheet">


        </head>

        <body class="bg-gradient-primary">

            <div class="container">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                            <div class="col-lg-7">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Crear una Cuenta !</h1>
                                    </div>
                                    <input type="hidden" name="id" id="hddId">
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" class="form-control form-control-user" id="txtuserName"
                                                name="Username" placeholder="Ingrese Nickname ">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="password" class="form-control form-control-user"
                                                id="txtPassword" name="uPassword" placeholder="Ingrese Contraseña">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="txtnomCompleto"
                                            name="uFullname" placeholder="Ingrese  Nombre Completo">
                                    </div>
                                    <div class="form-group">
                                        <input type="number" class="form-control form-control-user" id="txtuserEstado"
                                            name="userEstado" min="0" max="1" placeholder="Ingrese Estado del Usuario">
                                    </div>
                                    <input type="hidden" class="form-control form-control-user" id="txtuseridCargo"
                                            name="idcargo" min="0" max="7" value=3 placeholder="Ingrese el id del cargo">
                                   <!-- <div class="form-group">
                                        <input type="number" class="form-control form-control-user" id="txtuseridCargo"
                                            name="idcargo" min="0" max="5" placeholder="Ingrese el id del cargo">
                                    </div>-->
                                    <div class="col-sm-9 mx-auto">
                                        <button id="btnGuardar" type="button" class="btn btn-primary btn-user btn-block"
                                            onclick="validar();">Registrase</button>

                                    </div>

                                    
                                    <hr>


                                    <hr>
                                    <!--
                            <div class="text-center">
                                <a class="small" href="forgot-password.jsp">Forgot Password?</a>
                            </div>-->
                                    <div class="text-center align-items-center">
                                        <a class="small" href="login.jsp"> Ya tiene Cuenta?, Iniciar Sesión <i
                                                class="fas fa-sign-in-alt"></i></a><a href="login.jsp" class="btn btn-sm float-right btn-primary mt-3 ">
                                                    Volver al login
                                                </a>
                                                
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Bootstrap core JavaScript-->
            <script src="../sb_admin2/vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="../sb_admin2/vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="../sb_admin2/js/sb-admin-2.min.js"></script>

            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

            <script>

                var path = "http://localhost:8080/AjaxJsp/Users";

                $(document).ready(function () {

                    $('#btnGuardar').on('click', function (e) {
                        Registrar();
                    });





                });



                function Registrar() {
                    var valId = $('#hddId').val();
                    var users = {
                        id: (valId == '' ? 0 : valId),
                        Username: $('#txtuserName').val(),
                        uPassword: $('#txtPassword').val(),
                        uFullname: $('#txtnomCompleto').val(),
                        userEstado: $('#txtuserEstado').val(),
                        idcargo:$('#txtuseridCargo').val(),

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

                            limpiarForm();
                        }
                    });
                }

                function limpiarForm() {
                    $('#hddId').val('');
                    $('#txtuserName').val('');
                    $('#txtPassword').val('');
                    $('#txtnomCompleto').val('');
                    $('#txtuserEstado').val('');
                   


                }

                function validar() {
                    var $txtuserName = $('#txtuserName');
                    if ($txtuserName.val().trim() == '') {
                        swal("Error!", "Ingrese su Nickname!", "warning", {
                            button: "Ok!",
                        });
                        $txtuserName.focus();
                        return false;
                    }

                    var $txtPassword = $('#txtPassword');
                    if ($txtPassword.val().trim() == '') {
                        swal("Error!", "Ingrese Contraseña!", "warning", {
                            button: "Ok!",
                        });
                        $txtPassword.focus();
                        return false;
                    }

                    var $txtnomCompleto = $('#txtnomCompleto');
                    if ($txtnomCompleto.val().trim() == '') {
                        swal("Error!", "Ingrese nombre su Nombre Completo !", "warning", {
                            button: "Ok!",
                        });
                        $txtnomCompleto.focus();
                        return false;
                    }

                    var $txtuserEstado = $('#txtuserEstado');
                    if ($txtuserEstado.val().trim() == '') {
                        button: "Ok!",
                        swal("Error!", "Ingrese El estado del usuario !"+ "\n"+
                        "Seleccione 0 Si el usuario esta Inactivo "+"\n"+
                        "Seleccione 1 Si el usuario esta Activo ", "warning", {
                        });
                        $txtuserEstado.focus();
                        return false;
                    }
                    

                    return true;
                }
            </script>



        </body>

        </html>