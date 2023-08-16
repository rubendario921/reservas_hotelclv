<%-- 
    Document   : insumos_crear
    Created on : 16/08/2023, 13:04:18
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>

    //Optener valores de los campos
    function validar formulario() {
        var nombre = document.getElementById("nombre").value.trim();
        var detalle = document.getElementById("detalle").value.trim();
        var cantidad = document.getElementById("cantidad").value.trim();
        var valor = document.getElementById("valor").value.trim();
        var insu_dimg = document.getElementById("insu_dimg").value.trim();
        var estados_esta_id = document.getElementById("estados_esta_id").value.trim();

        //Validar campos obligatorios

        if (letra === " " || nombre === "") {
            alert("Por favor, completar todos los campos.");
            return false;
        }
        return true;
    }

</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Registro Insumo</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Nuevo Insumo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudunsumos_registrar.jsp" method="POST"onsubmit="return validarFormulario()">
                            <label> Nombre: </label><input type="text" class="form-control" name="nombre"  placeholder="Ingrese el nombre del insumo. " maxlength="15" required/>
                            <label> Detalle: </label><input type="text" class="form-control" name="detalle"  placeholder="Ingrese el detalle insumo. " maxlength="100" required/>
                            <label> Cantidad: </label><input type="text" class="form-control" name="cantidad"  placeholder="Ingrese la cantidad del insumo. " maxlength="20" required/>
                            <label> Valor: </label><input type="text" class="form-control" name="valor"  placeholder="Ingrese el valor del insumo. " maxlength="3,2" required/>
                            <label> Imagen: </label><input type="text" class="form-control" name="insu_dimg"  placeholder="Ingrese la imagen del insumo. " maxlength="255" required/>
                            <label> Estado: </label><input type="text" class="form-control" name="estados_esta_id"  placeholder="Ingrese el estado del insumo. " maxlength="" required/>
                            <br>
                            <a href="insumos_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Registrar" name="nuevo_insumo" class="btn bg-primary"/>
                        </form>
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo -->
<%@include file="template/footer_admin.jsp" %>
</div>