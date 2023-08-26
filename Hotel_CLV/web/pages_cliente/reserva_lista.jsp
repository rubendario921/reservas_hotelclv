<%-- 
    Document   : reserva_lista
    Created on : 26-ago-2023, 4:39:58
    Author     : Ruben Dario 921
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@include file="template/cliente/header_cliente.jsp" %>
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"> </h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Reservaciones</h3></td>                                
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Dias</th>
                                    <th>Fecha Registro</th>
                                    <th>Fecha Ingreso</th>
                                    <th>Fecha Salida</th>
                                    <th>Valor a Cancelar</th>
                                    <th>Habitacion</th>                                    
                                    <th>Consumo Adicionales</th>
                                    <th>Estado</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/cliente/footer_cliente.jsp" %>