<%-- 
    Document   : principal_cliente
    Created on : 25-feb-2024, 10:41:56
    Author     : fatil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <title>Fatilu Market</title>
    </head>
    <body class="colorbody">
        <nav class="navbar navbar-dark bg-primary">
            <ul>

                <li style="font-family: 'Forte Forward', cursive; font-size: 20px;"><a class="active" href="principal_cliente.jsp"><span class="navbar-toggler-icon"></span>INICIO</a></li>
                <!--<li style="font-family: 'Forte Forward', cursive; font-size: 20px;"><a href="clientes.jsp">Clientes</a></li>-->
                <li style="font-family: 'Forte Forward', cursive; font-size: 20px;"><a href="Controlador?accion=MostrarProductos">Productos</a></li>

                <li style="font-family: 'Forte Forward', cursive; font-size: 20px;"><a href="creditoscli.jsp">Creditos</a></li>
                <li style="font-family: 'Forte Forward', cursive; font-size: 20px;"><a href="confirmacionSolicitud.jsp">Historial</a></li>
                <li style="font-family: 'Forte Forward', cursive; font-size: 20px;"><a href="opcionesdepago.jsp">Opciones de pago</a></li>
                <li style="font-family: 'Forte Forward', cursive; font-size: 20px;"><a href="contacto.jsp">Contacto</a></li>

            </ul>                       

            <div class="navbar-content">
                <div class="text-center" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                    <h5>Bienvenido a Fatilu Markert <a>${nombreUsuario}</a></h5>
                </div>

                <div class="user-profile" style="position: absolute; top: 10px; right: 10px; display: flex; align-items: flex-start;">
                    <img src="img/Usuario.png" alt="Mi Perfil" height="80" width="80" style="margin-right: -130px; margin-top: 20px;">
                    <div class="user-links">
                        <a href="mostrarPerfil.jsp">Mi Perfil</a>
                        <div class="dropdown">
                            <a id="menu1" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar Sesi&oacute;n</a>
                            <div class="dropdown-menu text-center" id="fuentepurpura">
                                <img src="img/user.png" height="80" width="80" alt="${nombreUsuario}">
                                <br>
                                <a>${nombreUsuario}</a>
                                <div class="dropdown-divider"></div>
                                <a href="Controlador?accion=Salir" class="dropdown-item" id="fuentepurpura">Salir</a>
                            </div>
                        </div>
                    </div>
                </div>




        </nav>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>
