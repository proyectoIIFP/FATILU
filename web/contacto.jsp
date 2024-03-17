<%-- 
    Document   : contacto
    Created on : 5-nov-2023, 21:26:56
    Author     : fatil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/contacto.css" rel="stylesheet" type="text/css"/>
        <title>FatiluMarket - Contacto</title>
    </head>
    <body>
        <nav>
            <ul>
                <li><a style="font-family: 'Forte Forward', cursive;" href="principal_cliente.jsp">Inicio</a></li>
                <li><a style="font-family: 'Forte Forward', cursive;" href="#perfil">Productos</a></li>
                <li><a style="font-family: 'Forte Forward', cursive;" href="creditos.jsp">Créditos</a></li>
                <li><a style="font-family: 'Forte Forward', cursive;" href="#informacion">Credito</a></li>
                <li><a style="font-family: 'Forte Forward', cursive;" href="MostrarProductos.jsp">Historial</a></li>
                <li><a style="font-family: 'Forte Forward', cursive;" href="opcionesdepago.jsp">Opciones de pago</a></li>
                <li><a style="font-family: 'Forte Forward', cursive;" href="contacto.jsp">Contacto</a></li>
            </ul>
        </nav>


        <div class="container2 col-lg-5">
            <div class="form-group text-center">
                <p style="font-family: 'Forte Forward', cursive;"><strong>¡Contáctanos!</strong></p>
                <img src="img/contacto.jpg" height="80" width="80"/>
            </div>

            <!-- Enlaces -->
            <div class="enlaces-contacto" style="font-family: 'Forte Forward', cursive;">
                <p style="font-family: 'Forte Forward', cursive;">¡Estamos aquí para ayudarte! Contáctanos a través de:</p>
                <p>Facebook: <a href="https://www.facebook.com/fatimalucia.martinezaleman/" target="_blank">Enlace a Facebook</a></p>
                <p>Instagram: <a href="https://www.instagram.com/fatilu_martinez222/" target="_blank">Enlace a Instagram</a></p>
                <p>WhatsApp: <a href="https://wa.me/595975965891" target="_blank">Enlace a WhatsApp</a></p>
            </div>
        </div>

        <nav class="navbar navbar-dark bg-primary">                      
            <div><h5 class="text-center" style="font-family: 'Forte Forward', cursive; font-size: 35px;color: black">Contacta directamente con la propietaria de Fatilu Market <br> ${usuario}</br><strong></strong></h5></div>      

            <div class="dropdown-divider"></div>
            <div class="dropdown">
                <a id="menu2" class="fuentevioleta" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-family: 'Forte Forward', cursive; font-size: 15px;">Cerrar el Formulario</a>
                <div class="dropdown-menu text-center" id="fuentepurpura">
                    <div class="dropdown-divider"></div>
                    <a href="Controlador?accion=Salir" class="dropdown-item" id="fuenteazul">Salir</a>
                </div>
            </div>  
        </nav>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>
