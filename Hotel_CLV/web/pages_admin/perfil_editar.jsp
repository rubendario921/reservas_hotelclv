<%-- 
    Document   : perfil_editar
    Created on : 14/08/2023, 11:42:38
    Author     : Ruben Dario
--%>

<%@page import="Controller.Perfiles"%>
<%@page import="Controller.PerfilesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombre = document.getElementById("letra").value.trim();
        var letra = document.getElementById("nombre").value.trim();

        // Validar campos obligatorios
        if (nombre === "" || letra === "" || ) {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }

        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)

        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<!--Inicio del Cuerpo-->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Modificar Perfil</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar Perfil</h3>                        
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudperfil_editar.jsp" method="POST" onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    PerfilesDao mostrarP = new PerfilesDao();
                                    Perfiles perfil = mostrarP.mostrarPerfil(id);
                                    if (perfil != null) {%>

                            <label>Codigo: </label><input type="text" value="<%= perfil.getPerfilId()%>" class="form-control" name="codigo" maxlength="2" readonly="false"/>
                            <br>
                            <label>Letra: </label><input type="text" value="<%=perfil.getPerfilLetra()%>" class="form-control" name="letra"  placeholder="Ingrese 2 letras de abreviatura"maxlength="2" required/>
                            <br>
                            <label>Nombre: </label><input type="text" value="<%=perfil.getPerfilNombre()%>" class="form-control" name="nombre" placeholder="Ingrese el nombre del perfil" maxlength="20" required/>
                            <br>
                            <%}%>
                            <%}%>
                            <a href="perfil_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Editar" name="editar" class=" btn btn-primary"/>                            
                        </form>                           
                    </div>                    
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo-->
<%@include file="template/footer_admin.jsp" %>