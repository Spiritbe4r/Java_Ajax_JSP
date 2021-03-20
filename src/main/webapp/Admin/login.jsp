<%-- Document : login Created on : 26 dic. 2020, 20:16:07 Author : ronal --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>SB Admin 2 - Login</title>

            <!-- Custom fonts for this template-->
            <link href="../sb_admin2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
            <link
                href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                rel="stylesheet">

                <link href="../swetalert/sweetalert.css" rel="stylesheet">

            <!-- Custom styles for this template-->
            <link href="../sb_admin2/css/sb-admin-2.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css" rel="stylesheet">
           

        <body class="bg-gradient-primary">

            <div class="container">

                <!-- Outer Row -->
                <div class="row justify-content-center">

                    <div class="col-xl-10 col-lg-12 col-md-9">

                        <div class="card o-hidden border-0 shadow-lg my-5">
                            <div class="card-body p-0">
                                <!-- Nested Row within Card Body -->
                                <div class="row">
                                    <!--IMAGEN -->
                                    <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                                    <div class="col-lg-6">
                                        <div class="p-5">
                                            <div class="text-center">
                                                <h1 class="h4 text-gray-900 mb-4"><strong>Bienvenido !</strong></h1>
                                            </div>
                                            <form class="user" id="form-login"action="AuthAdmin">
                                                <div class="form-group">
                                                    <input type="text" class="form-control form-control-user"
                                                        id="username" placeholder="Usuario" autofocus="autofocus" required>
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" class="form-control form-control-user"
                                                        id="password" placeholder="Contraseña" required>
                                                </div>
                                                <!-- <div class="form-group">
                                                 <div class="custom-control custom-checkbox small">
                                                     <input type="checkbox" class="custom-control-input" id="customCheck">
                                                     <label class="custom-control-label" for="customCheck">Remember
                                                         Me</label>
                                                 </div>
                                             </div>-->
                                                <button type="submit" href="index.jsp"
                                                    class="btn btn-primary btn-user btn-block" onClick="return validar();">
                                                    Iniciar Sessión
                                                </button>
                                                <hr>
                                                <!-- <a href="index.html" class="btn btn-google btn-user btn-block">
                                                 <i class="fab fa-google fa-fw"></i> Login with Google
                                             </a>
                                             <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                                 <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                             </a>-->
                                            </form>
                                            
                                            <hr>
                                            <div class="text-center">
                                                <a class="small" href="forgot-password.jsp">¿ Olvido su Contraseña
                                                    ?</a>
                                            </div>
                                            <div class="text-center">
                                                <a class="small" href="register.jsp">Crear Cuenta !</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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

        
           
            <script>
                $('#form-login').submit(function (e) {
                    e.preventDefault();
                    var data = {
                        username: $('#username').val(),
                        password: $('#password').val()
                    }
                    $.ajax({
                        url: "${pageContext.request.contextPath}/AuthAdmin",
                        type: "post",
                        dataType: "json",
                        data: data,
                       // swal(response.msg, "Respuesta","warning");
                        success: function (data, textStatus, jqXHR) {
                            if (data.status) {
                                swal(data.message,"Respuesta","success");
                                setTimeout(function () {
                                    window.open("index.jsp", "_self");
                                }, 2500);
                            } else {
                                swal(data.message,"Respuesta","warning");
                            }
                        }
                    });
                });


            </script>
            
            <script src="../swetalert/sweetalert.js"></script>
            <!-- script propio-->
           <!-- <script src="main.js"></script>-->
        </body>

        </html>