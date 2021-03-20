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
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Listo para Salir ?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Selecciona "Salir"
                abajo si estas listo para cerrar tu sesion actual.</div>
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




<!-- cÃ³digo propio JS -->
<!--<script type="text/javascript" src="main.js"></script>-->
<script  src="../swetalert/sweetalert.js"></script>

<!-- toastr y jquery-->

<script src="../assets/jquery/jquery-3.5.1.js"></script>

<script src="../assets/toastr/toastr.js"></script>

<!-- Page level plugins -->
<!-- jQuery, Popper.js, Bootstrap JS -->
<!--<script src="../datatables_c/jquery/jquery-3.3.1.min.js"></script>-->
<script src="../datatables_c/popper/popper.min.js"></script>
<!--<script src="bootstrap/js/bootstrap.min.js"></script>-->
  
<!-- datatables JS -->
<script type="text/javascript" src="../datatables_c/datatables/datatables.min.js"></script>    
 
<!-- para usar botones en datatables JS -->  
<script src="../datatables_c/datatables/Buttons-1.6.5/js/dataTables.buttons.min.js"></script>  
<script src="../datatables_c/datatables/JSZip-2.5.0/jszip.min.js"></script>    
<script src="../datatables_c/datatables/pdfmake-0.1.36/pdfmake.min.js"></script>    
<script src="../datatables_c/datatables/pdfmake-0.1.36/vfs_fonts.js"></script>
<script src="../datatables_c/datatables/Buttons-1.5.6/js/buttons.html5.min.js"></script>
 
<!-- código JS propìo-->    
<!--<script type="text/javascript" src="../datatables_c/jscss/main.js"></script>  -->

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