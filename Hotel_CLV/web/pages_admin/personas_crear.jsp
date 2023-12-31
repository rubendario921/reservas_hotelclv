<%-- 
    Document   : personas_crear
    Created on : 20-jul-2023, 12:13:12
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.Prefijos"%>
<%@page import="Controller.PrefijosDao"%>
<%@page import="Controller.TipoDocumentos"%>
<%@page import="Controller.TipoDocumentoDao"%>
<%@page import="Controller.PerfilesDao"%>
<%@page import="Controller.Perfiles"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@include file="template/header_admin.jsp" %>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombres = document.getElementById("nombres").value.trim();
        var apellidos = document.getElementById("apellidos").value.trim();
        
        var tipoDocumento = document.getElementById("tipoDocumento").value.trim();
        var numDocumento = document.getElementById("numDocumento").value.trim();
        
        var prefijo = document.getElementById("prefijo").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        
        var correo = document.getElementById("correo").value.trim();
        var usuario = document.getElementById("usuario").value.trim();
        var clave = document.getElementById("clave").value.trim();
        var fregistro = document.getElementById("fregistro").value.trim();
        var perfil = document.getElementById("perfil").value.trim();

        // Validar campos obligatorios
        if (nombres === "" || apellidos === "" || tipoDocumento === ""|| numDocumento === "" || prefijo === "" || telefono === "" || correo === "" || usuario === "" || clave === "" || perfil === "" || fregistro === "") {
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

        var confirmacion = confirm("¿Desea continuar con la creación del registro?");
        return confirmacion; // Permitir el envío del formulario si todos los campos están llenos       
    }
</script>
<!DocumentHTML>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Nómina del Sistema</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Nuevo Registro</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudpersonas_crear.jsp" method="POST" onsubmit="return validarFormulario();" >
                            <label>Nombres Completos: </label>
                            <input type="text" name="nombres" id="nombres" class="form-control" placeholder="Nombres Completos" maxlength="100" autocomplete="true" required /><br />
                            <label>Apellidos Completos: </label>
                            <input type="text" name="apellidos" id="apellidos" class="form-control" placeholder="Apellidos Completos" maxlength="100" autocomplete="true" required /><br />
                            <!-- Tipo de Identificacion y Número de Documento-->
                            <label>Identificación:</label>
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
                                        <input type="text" name="numDocumento" id="numDocumento" class="form-control" placeholder="Número de Identidad" maxlength="13"  autocomplete="true" required />
                                    </div>
                                </div>
                            </div>
                            <!-- Tipo de Identificacion y Número de Documento-->
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
                                        <input type="text" name="telefono" id="telefono" class="form-control" placeholder="Número de teléfono" maxlength="10" autocomplete="true" required /><br>
                                    </div>
                                </div>
                            </div>                            
                            <label>Correo Electrónico: </label>
                            <input type="email" name="correo" id="correo" class="form-control"  placeholder="ejemplo@hotel_clv.com" maxlength="100" autocomplete="true" required /><br>
                            <label>Usuario: </label>
                            <input type="text" name="usuario" id="usuario" class="form-control" placeholder="Usuario" maxlength="20" autocomplete="true" required /><br>
                            <label>Contraseña: </label>
                            <input type="password" name="clave" id="clave" class="form-control"  placeholder="De 8 a 16 dígitos, Mayúsculas, Minúsculas y Números" maxlength="16" autocomplete="true" required /><br>
                            <label>Perfil: </label>
                            <select name="perfil" id="perfil" class="form-control" required>
                                <option selected>Seleccione una Opción</option>
                                <%
                                    PerfilesDao mostrarPerfiles = new PerfilesDao();
                                    List<Perfiles> perfiles = mostrarPerfiles.mostrarListaPerfil();
                                    for (Perfiles perfil : perfiles) {
                                %>                                                               
                                <option value="<%= perfil.getPerfilId()%>"><%= StringEscapeUtils.escapeHtml4(perfil.getPerfilNombre())%></option>                                
                                <% }%>
                            </select>  
                            <br />
                            <label>Fecha de Registro: </label><input type="datetime-local" name="fregistro" id="fregistro" class="form-control" required />
                            <br />
                            <a href="menu_admin.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" class=" btn btn-success" value="Registrar" name="nueva_persona" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>