<%@include file="template/menu/header_menu.jsp" %>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f0f0;
    }
    h2 {
        color: #007bff;    
    }

    .service-card {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        margin: 20px;
        display: inline-block;
        overflow: hidden;
        transition: transform 0.2s ease-in-out;
        max-width: 300px; 
    }

    .service-card:hover {
        transform: scale(1.05);
    }

    .service-image {
        max-width: 100%;
        height: auto;
        width: 100%; 
        height: 200px; 
        object-fit: cover;
    }

    .service-name {
        background-color: rgba(0, 0, 0, 0.7);
        color: #fff;
        padding: 10px;
        font-size: 18px;
    }

    p {
        color: #777;
    }
</style>
<br />
<header>
    <div class="text-center container">
        <h2>Servicios del Hotel</h2>
    </div>
</header>

<div class="container">
    <div class="service-card">
        <img class="service-image" src="./assets/img/servicios_1.jpg" alt="Servicio de Catering">
        <div class="service-name">Servicio de Catering</div>
        <p>Disfruta de deliciosas comidas y bebidas en nuestro servicio de catering.</p>
    </div>

    <div class="service-card">
        <img class="service-image" src="./assets/img/servicio_2.jpg" alt="Piscina">
        <div class="service-name">Piscina</div>
        <p>Rel�jate y refr�scate en nuestra amplia piscina al aire libre y dispuesta para ti.</p>
    </div>

    <div class="service-card">
        <img class="service-image" src="./assets/img/servicio_3.jpg" alt="Bar">
        <div class="service-name">Bar</div>
        <p>Disfruta de c�cteles y bebidas en nuestro bar con un ambiente acogedor.</p>
    </div>

    <div class="service-card">
        <img class="service-image" src="./assets/img/servicio_4.jpg" alt="Gimnasio">
        <div class="service-name">Gimnasio</div>
        <p>Mantente en forma en nuestro gimnasio completamente equipado.</p>
    </div>

    <div class="service-card">
        <img class="service-image" src="./assets/img/servicio_5.jpg" alt="Limpieza">
        <div class="service-name">Limpieza</div>
        <p>Ofrecemos servicio de limpieza de habitaciones para tu comodidad.</p>
    </div>

    <div class="service-card">
        <img class="service-image" src="./assets/img/servicio_6.jpg" alt="Parqueaderos">
        <div class="service-name">Parqueaderos</div>
        <p>Estaciona tu veh�culo con seguridad en nuestros amplios parqueaderos.</p>
    </div>

    <div class="service-card">
        <img class="service-image" src="./assets/img/servicio_8.jpg" alt="Zona de juegos infantiles">
        <div class="service-name">Zona de juegos infantiles</div>
        <p>Los ni�os pueden disfrutar de juegos en nuestra zona de juegos especiales para los mas peque�os de la familia.</p>
    </div>

    <div class="service-card">
        <img class="service-image" src="./assets/img/servicio_7.jpg" alt="Seguridad">
        <div class="service-name">Seguridad</div>
        <p>Garantizamos tu seguridad con personal y sistemas de seguridad de alta calidad.</p>
    </div>
</div>

<%@include file="template/menu/footer_menu.jsp" %>
