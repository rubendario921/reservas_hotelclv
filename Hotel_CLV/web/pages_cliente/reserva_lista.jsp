<%@page import="Controller.Estados"%>
<%@page import="Controller.Consumos"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="Controller.Habitaciones"%>
<%@page import="Controller.HabitacionesDao"%>
<%@page import="Controller.Reservas"%>
<%@page import="Controller.ReservasDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@include file="template/cliente/header_cliente.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reservaciones</title>
        <style>
            .page-header {
                text-align: center;
            }

            .container-fluid {
                margin-top: 20px;
            }

            .table {
                width: 100%;
            }

            .table th, .table td {
                text-align: center;
            }

            .bg-warning {
                background-color: #FFD700;
            }

            .btn-primary, .btn-danger {
                padding: 6px 12px;
            }
        </style>
    </head>
    <body>
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Reservaciones</h1>
                        <div class="panel panel-primary">                            
                            <div class="panel-body">
                                <table class="table table-responsive">
                                    <thead>
                                        <tr>                                            
                                            <th>Días</th>
                                            <th>Fecha Registro</th>
                                            <th>Fecha Ingreso (Check - In)</th>
                                            <th>Fecha Salida (Check - Out)</th>
                                            <th>Valor a Cancelar</th>
                                            <th>Piso - Número</th>
                                            <th>Descripción</th>                                            
                                            <th>Estado</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                            String id_perId = String.valueOf(session.getAttribute("perId"));
                                            int id = Integer.parseInt(id_perId);

                                            HabitacionesDao mostrarHabi = new HabitacionesDao();
                                            List<Habitaciones> habitaciones = mostrarHabi.mostrarListaHabi();

                                            ConsumosDao mostrarConsu = new ConsumosDao();
                                            List<Consumos> consumos = mostrarConsu.mostrarListaConsumos();

                                            EstadosDao mostrarEsta = new EstadosDao();
                                            List<Estados> estados = mostrarEsta.mostrarListaEstados();

                                            ReservasDao mostrarReservas = new ReservasDao();
                                            List<Reservas> reservas = mostrarReservas.mostrarListaReservaXid(id);
                                            for (Reservas reserva : reservas) {

                                                int habiReserva = reserva.getHabiId();
                                                String nombreHabitacion = "";
                                                String habiDepar = "";
                                                String habiPiso = "";

                                                for (Habitaciones habitacion : habitaciones) {
                                                    if (habitacion.getHabiId() == habiReserva) {
                                                        habiDepar = StringEscapeUtils.escapeHtml4(habitacion.getHabiDepar());
                                                        habiPiso = StringEscapeUtils.escapeHtml4(habitacion.getHabiPiso());
                                                        nombreHabitacion = StringEscapeUtils.escapeHtml4(habitacion.getHabiNombre());

                                                        break;
                                                    }
                                                }
                                                
                                                int estadoReserva = reserva.getEstaId();
                                                String nombreEstado = "";

                                                for (Estados estado : estados) {
                                                    if (estado.getEstaId() == estadoReserva) {
                                                        nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                    }
                                                }%>
                                        <tr>                                            
                                            <td><%= reserva.getNumDias()%></td>
                                            <td><input id="fregistro" class="form-control" type="datetime-local" value="<%= reserva.getReseFReserva()%>" readonly="off"></td>
                                            <td><input id="fingreso" class="form-control" type="datetime-local" value="<%= reserva.getReseFInicio()%>" readonly="off"></td>
                                            <td><input id="fSalida" class="form-control" type="datetime-local" value="<%= reserva.getReseFSalida()%>" readonly="off"></td>
                                            <td style="color: #f71515"><b>$ <%= reserva.getReseVTotal()%></b></td>
                                            <td><%= habiPiso%> - <%= habiDepar%></td>
                                            <td><%= nombreHabitacion%></td>                                            
                                            <td style="color: darkblue"><b><%= nombreEstado%></b></td>
                                            <td>
                                                <%
                                                    if (nombreEstado.equals("PENDIENTE")) {%>
                                                <a href="aceptar_pago.jsp?aceptar=true&id_reserva=<%= reserva.getReseId()%>" class="btn btn-success"><i class="fa fa-book" title="Realizar Pago" name="aceptar"></i></a>
                                                <a href="reserva_editar.jsp?editar=true&id_reserva=<%= reserva.getReseId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar Reserva" name="editar"></i></a>
                                                <a href="Mantenimiento_cliente/crudreserva_anular.jsp?anular=true&id=<%= reserva.getReseId()%>&habiId=<%= reserva.getHabiId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Anular" name="anular"></i></a>
                                                    <% }%>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%@include file="template/cliente/footer_cliente.jsp" %>