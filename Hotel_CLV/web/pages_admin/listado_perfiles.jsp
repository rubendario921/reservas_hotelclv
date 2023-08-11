<%-- 
    Document   : listado_perfiles
    Created on : 10/08/2023, 13:07:32
    Author     : Ruben Dario
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.Perfiles"%>
<%@page import="Controller.PerfilesDao"%>
<%@page import="java.util.*"%>
<%@include file="../template/admin/header_admin.jsp" %>
<!DOCTYPE html>    
<!--Tabla para mostrar el listado de los perfiles-->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div>
                    <h1 class="page-header">Listado de Perfiles </h1>
                </div>
                <table> 
                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Letra</th>
                            <th>Nombre</th>                    
                        </tr>
                    </thead>
                    <tbody>
                        <!--Extraer la informacion de la java class-->
                        <%
                            PerfilesDao mostrar_perfiles = new PerfilesDao();
                            List<Perfiles> perfiles = mostrar_perfiles.mostrarLista();
                            for (Perfiles perfil : perfiles) {%>
                        <tr>
                            <td><%= perfil.getPerfilId()%></td>
                            <td><%= perfil.getPerfilLetra()%></td>
                            <td><%= perfil.getPerfilNombre()%></td>
                            <td>                        
                                <!--modificar update=":tabMostrar"-->
                                <!--eliminar update=":tabMostrar"-->
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@include file="../template/admin/footer_admin.jsp" %>
