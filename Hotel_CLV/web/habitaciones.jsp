<%--
    Document   : habitaciones
    Created on : 23-jul-2023, 21:05:46
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de todas las habitaciones</title>
    <style>
        .img-container {
            display: flex;
            overflow-x: auto; /* Permitir desplazamiento horizontal */
            max-width: 100%; /* Ajustar el ancho del contenedor a la ventana */
            margin: 0 auto;
        }

        .img-fluid {
            width: 300px; /* Ajusta el tamaño según tus preferencias */
            height: 200px; /* Ajusta el tamaño según tus preferencias */
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
            margin-right: 10px; /* Espaciado entre imágenes */
        }

        .img-fluid:last-child {
            margin-right: 0; /* Eliminar el margen derecho de la última imagen */
        }

        .img-fluid.active {
            width: 600px; /* Tamaño expandido de la imagen activa */
            height: 400px; /* Tamaño expandido de la imagen activa */
        }
    </style>
    <script src="ruta/jquery.min.js"></script> <!-- Reemplaza "ruta/jquery.min.js" con la ruta correcta de jQuery -->
    <script>
        $(document).ready(function () {
            $(".img-fluid").on("click", function () {
                $(this).toggleClass("active");
                $(this).siblings().removeClass("active");
            });
        });
    </script>
</head>
<body>
    <%@include file="template/menu/header_menu.jsp" %>

    <h2>Listado de todas las habitaciones</h2>
    <br>

    <div class="img-container">
        <img class="img-fluid" src="./assets/img/habitación_1.jpg" alt="">
        <img class="img-fluid" src="./assets/img/Habitación_2.jpg" alt="">
        <img class="img-fluid" src="./assets/img/habitación_3.jpg" alt="">
        <img class="img-fluid" src="./assets/img/Habitación_4.jpg" alt="">
        <img class="img-fluid" src="./assets/img/habitación_5.jpg" alt="">
        <img class="img-fluid" src="./assets/img/habitación_6.jpg" alt="">
    </div>

    <%@include file="template/menu/footer_menu.jsp" %>
</body>
</html>
