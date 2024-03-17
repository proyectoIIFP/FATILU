<%-- 
    Document   : confirmacionSolicitud
    Created on : 01-mar-2024, 12:30:32
    Author     : fatil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <link href="css/contacto.css" rel="stylesheet" type="text/css"/>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmación de Solicitud</title>
    </head>
    <body>
      <div class="container2">
          <h2 style="color: #f4f4f4">¡Solicitud de Crédito Enviada!</h2>
        <p style="color: #f4f4f4">Espera la confirmación por parte del sistema.</p>
        <%-- Mostrar información del cliente --%>
            Nombre: <%= session.getAttribute("nombre")%><br>
            Apellido: <%= session.getAttribute("apellidoUsuario")%><br>
            Cédula: <%= session.getAttribute("usuario")%><br>
            Nro. Celular:<%= session.getAttribute("telefonoUsuario")%><br>
            Dirección: <%= session.getAttribute("direccionUsuario")%><br>
      </div>
    </body>
</html>
