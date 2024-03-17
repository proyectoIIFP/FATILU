<%-- 
    Document   : login
    Created on : 4-nov-2023, 14:11:55
    Author     : fatil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Aqui va los estilos del css del bootstrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <!--<title>JSP Page</title>-->
        <title>Fatilu Market</title>
    </head>
    <body class="fondo">
        <div class="container col-lg-3">
            <!--<form  action="principal.jsp"> -->
            <form  action="Controlador">
                <div class="form-group text-center  ">
                    <img src="img/Usuario.png" height="80" width="80"/>
                    <p style="font-family: 'Forte Forward', cursive; font-size: 25px;"><strong>Bienvenido a Fatilu Market.</strong></p>
                     <p style="font-family: 'Forte Forward', cursive; font-size: 15px;"><strong>Tu destino para las mejores compras!!</strong></p>
                </div>
                <div class="form-group">
                    <label id="negrita">Usuario: </label>
                    <input class="form-control" type="text" name="txtUsuario" placeholder="Ingrese su nro de cedula">
                </div>
                <div class="form-group">
                    <label id="negrita">Contrase&#241;a: </label>
                    <input class="form-control" type="password" name="textContrasena" placeholder="fatilu12345">
                </div>
                <div class="form-group text-center ">
                    <input class="btn btn-info bnt-block " type="submit" name="accion" value="Ingresar">
                </div>
                <div class="form-group text-center">
                    <a id="negrita" href="registrar.jsp" style="color: orange" >Registrese aqu&iacute;!!</a>
                </div>
            </form>            
        </div>
        
        <!--Contenedores del javascrit del bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>