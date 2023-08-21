<%-- 
    Document   : listado_empleados
    Created on : 20-jul-2023, 9:45:12
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.Perfiles"%>
<%@page import="Controller.PerfilesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.Personas"%>
<%@page import="java.util.*"%>
<%@page import="Controller.PersonasDao"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario( {
        var codigo = document.getElementById("codigo").value.trim();
        var nombre = document.getElementById("nombre").value.trim();
        var apellido = document.getElementById("apellido").value.trim();
        var cedula = document.getElementById("cedula").value.trim();
        var telefono = document.getElementById("usuario").value.trim();
        var correo = document.getElementById("telefono").value.trim();
        var acciones = document.getElementById("perfil").value.trim();
        var acciones = document.getElementById("estado").value.trim();
        var acciones = document.getElementById("acciones").value.trim();
        
        if (codigo === "" ||nombre === "" ||apellido === "" ||cedula === "" ||usuario === "" ||telefono === "" ||perfil === "" || estado === "" || acciones === "" ||) {
            
        alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
    
    
</script>

<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Empleados Registrados</h1>
                <div class="panel panel-primary">                    
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Lista de Empleados</h3></td>
                                <td aling="rigth"><a href="personas_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Cédula</th>
                                    <th>Usuario</th> 
                                    <th>Telefono</th>                                    
                                    <th>Perfil</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    PersonasDao mostrarLista = new PersonasDao();
                                    List<Personas> personas = mostrarLista.mostrarListaPersonasE();
                                    for (Personas persona : personas) {%>
                                <tr>
                                    <td><%=persona.getPerId()%></td>
                                    <td><%=persona.getPerNombres()%></td>
                                    <td><%=persona.getPerApellidos()%></td>
                                    <td><%=persona.getPerCedula()%></td>                                    
                                    <td><%=persona.getUsuario()%></td>                                    
                                    <td><%=persona.getPerTelefono()%></td>                                    
                                    <td><%int perfil = persona.getPerfilId();
                                        switch (perfil) {

                                            case 1:
                                                out.print("Administrador");
                                                break;
                                            case 2:
                                                out.print("Supervisor");
                                                break;
                                            case 3:
                                                out.print("Recepcionista");
                                                break;
                                            case 4:
                                                out.print("Cliente");
                                                break;
                                        } %></td>
                                    <td><% int estado = persona.getEstaId();
                                        switch (estado) {
                                            case 1:
                                                out.print("Activo");
                                                break;
                                            case 2:
                                                out.print("Inactivo");
                                                break;
                                        } %></td>
                                    <td>
                                        <a href="editar_admin.jsp?editar=true&id=<%=persona.getPerId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <a href="../Mantenimiento/crudeliminar_admin.jsp?eliminar=true&id=<%=persona.getPerId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <a href="menu_admin.jsp" class="btn btn-block btn-primary" >Menu Principal</a>
            </div>  
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>