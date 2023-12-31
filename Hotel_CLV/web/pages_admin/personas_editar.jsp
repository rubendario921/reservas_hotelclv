<%-- 
    Document   : personas_editar
    Created on : 20-ago-2023, 22:52:48
    Author     : Ruben Dario 921
--%>
<%@page import="Controller.PrefijosDao"%>
<%@page import="Controller.Prefijos"%>
<%@page import="Controller.TipoDocumentos"%>
<%@page import="Controller.TipoDocumentoDao"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Perfiles"%>
<%@page import="Controller.PerfilesDao"%>
<%@page import="Controller.Personas"%>
<%@page import="Controller.PersonasDao"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        var personaId = document.getElementById("personaId").value.trim();
        var nombres = document.getElementById("nombres").value.trim();
        var apellidos = document.getElementById("apellidos").value.trim();
        var tipoDocumento = document.getElementById("tipoDocumento").value.trim();
        var numDocumento = document.getElementById("numDocumento").value.trim();
        var prefijo = document.getElementById("prefijo").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var correo = document.getElementById("correo").value.trim();
        var usuario = document.getElementById("usuario").value.trim();
        var clave = document.getElementById("clave").value.trim();
        var imagen = document.getElementById("imagen").value.trim();
        var fregistro = document.getElementById("fregistro").value.trim();
        var perfil = document.getElementById("perfil").value.trim();
        var estado = document.getElementById("estado").value.trim();

        // Validar campos obligatorios
        if (personaId === "" || nombres === "" || apellidos === "" || tipoDocumento === "Seleccion una opción" || numDocumento === "" || prefijo === "Seleccion una opción" || telefono === "" || correo === "" || usuario === "" || clave === "" || imagen === "" || fregistro === "" || perfil === "Seleccion una opción" || estado === "Seleccion una opción") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        // Validar que la contraseña contenga al menos una mayúscula, una minúscula y un número
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/;
        if (!passwordPattern.test(clave)) {
            alert("La contraseña debe contener al menos una mayúscula, una minúscula y un número.");
            return false; // Detener el envío del formulario
        }
        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)

        var confirmacion = confirm("¿Está de acuerdo con actualizar el registro?");
        return confirmacion; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Nómina del Sistema</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar Registro</h3>                        
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudpersonas_editar.jsp" method="POST" onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    
                                    PersonasDao mostrarP = new PersonasDao();
                                    Personas persona = mostrarP.mostrarPersona(id);
                                    if (persona != null) {%>
                            <label>Código: </label>
                            <input type="text" name="personaId" id="personaId" value="<%= persona.getPerId()%>" class=" form form-control" placeholder="Ingrese sus dos nombres" maxlength="100"  autocomplete="off" readonly="false" required/><br />
                            <label>Nombres Completos: </label>
                            <input type="text" name="nombres" id="nombres" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerNombres())%>" class="form form-control" placeholder="Ingrese sus dos nombres" maxlength="100" autocomplete="true" required /><br />
                            <label>Apellidos Completos: </label>
                            <input type="text" name="apellidos" id="apellidos" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerApellidos())%>"class="form form-control" placeholder="Ingrese sus dos apellidos" maxlength="100" autocomplete="true" required /><br />
                            <!-- Tipo de Documento y Número de Documento-->
                            <label>Identificación: </label>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-auto">
                                        <select id="tipoDocumento" name="tipoDocumento" class="form-control" required>
                                            <option selected>Seleccion una opción</option>
                                            <%
                                                TipoDocumentoDao mostrar_tipoDoc = new TipoDocumentoDao();
                                                List<TipoDocumentos> tipoDocumentos = mostrar_tipoDoc.mostrarListaTipoDocumento();
                                                for (TipoDocumentos tipoDoc : tipoDocumentos) {
                                            %>
                                            <option value="<%= tipoDoc.getDocI_id()%>"><%= tipoDoc.getDocI_nombre()%></option> 
                                            <% }%>
                                        </select>
                                    </div>
                                    <div class="col-auto">
                                        <input type="text" name="numDocumento" id="numDocumento" value="<%= StringEscapeUtils.escapeHtml4(persona.getPernumDocumento())%>" class="form-control" placeholder="Número de Identidad" maxlength="13" autocomplete="true" required />                                          
                                    </div>
                                </div>
                            </div>
                            <!-- Prefijos y Número de telefono-->
                            <label>Contacto: </label>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-auto">
                                        <select id="prefijo" name="prefijo" class="form-control" required>
                                            <option selected>Seleccion una opción</option>
                                            <%
                                                PrefijosDao mostrarPrefijos = new PrefijosDao();
                                                List<Prefijos> prefijos = mostrarPrefijos.mostrarListaPrefijos();
                                                for (Prefijos prefijo : prefijos) {
                                            %>
                                            <option value="<%= prefijo.getPrefiId()%>"><%= prefijo.getPrefiPais()%>-<%= prefijo.getPrefiCodigo()%></option> 
                                            <% }%>
                                        </select>
                                    </div>
                                    <div class="col-auto">
                                        <input type="text" name="telefono" id="telefono" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerTelefono())%>"class="form-control"  placeholder="Ingrese su número de teléfono" maxlength="10" autocomplete="true" required />                                         
                                    </div>
                                </div>
                            </div>
                            <!-- Informacion del cliente-->
                            <label>Correo Electrónico: </label>
                            <input type="email" name="correo" id="correo" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerCorreo())%>"class="form-control" placeholder="Ingrese su correo electrónico" maxlength="100" autocomplete="true" required /><br />
                            <label>Usuario: </label>                            
                            <input type="text" name="usuario" id="usuario" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerUsuario())%>"class="form-control" placeholder="Ingrese un usuario" maxlength="20" autocomplete="true" required /><br />
                            <label>Contraseña: </label><input type="text" name="clave" id="clave" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerClave())%>"class="form-control" placeholder="Debe tener 8 a 16 dígitos mayúsculas, minúsculas y números" maxlength="16" autocomplete="true" required /><br />
                            <label>Imagen:</label>
                            <input type="text" name="imagen" id="clave" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerImagen())%>"class="form-control" placeholder="Dirección de la imagen" maxlength="16"   autocomplete="off" required /><br />
                            <label>Fecha Regsitro: </label>
                            <input type="datetime-local" name="fregistro" id="fregistro" value="<%= persona.getPerFRegistro()%>"class="form-control" placeholder="Fecha del primer registro" maxlength="16"   autocomplete="off" required /><br />
                            <label>Perfil: </label>
                            <select name="perfil" id="perfil" class="form-control" required>
                                <option selected>Seleccion una opción</option>
                                <%
                                    PerfilesDao mostrarPerfil = new PerfilesDao();
                                    List<Perfiles> perfiles = mostrarPerfil.mostrarListaPerfil();
                                    for (Perfiles perfil : perfiles) {%>
                                <option value="<%= perfil.getPerfilId()%>"><%= StringEscapeUtils.escapeHtml4(perfil.getPerfilNombre())%></option>
                                <% }%>
                            </select>  
                            <br />
                            <label>Estado: </label>
                            <select name="estado" id="estado"class="form-control" required>
                                <option selected>Seleccion una opción</option>
                                <%
                                    EstadosDao mostrarEstado = new EstadosDao();
                                    List<Estados> estados = mostrarEstado.mostrarListaEstaPersonas();
                                    for (Estados estado : estados) {%>
                                <option value="<%= estado.getEstaId()%>"><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%></option>
                                <% }%>
                            </select>
                            <% }
                                }%>
                            <br />
                            <a href="menu_admin.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Modificar" name="editar" class="btn btn-warning"/>                                
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>