<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entity.SolicitudCredito"%>
<%@page import="DAO.SolicitudCreditoDAOImpl"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <title>Fatilu Market</title>
    </head>
    <body>
        <!-- ... (tu barra de navegación u otras secciones) ... -->


        <h2>Administrar Solicitudes de Crédito</h2>

        <table class="table">
            <thead>
                <tr>
                    <th>Monto</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>C.I </th>
                    <th>Nro. Celular</th>
                    <th>Direccion</th>
                </tr>
            </thead>
            <tbody>
                <%
                    SolicitudCreditoDAOImpl solicitudDAO = new SolicitudCreditoDAOImpl();
                    List<SolicitudCredito> solicitudes = solicitudDAO.obtenerTodasSolicitudes();

                    for (SolicitudCredito solicitud : solicitudes) {
                %>
                <tr>
                    <td><%= solicitud.getMonto()%></td>
                    <td><%= solicitud.getNombre()%></td>
                    <td><%= solicitud.getApellido()%></td>
                    <td><%= solicitud.getCi()%></td>
                    <td><%= solicitud.getNroCelular()%></td>
                    <td><%= solicitud.getDireccion()%></td>
                    <td>
                        <a href="AdminCreditosServlet?action=aprobar&id=<%= solicitud.getCi()%>">Aprobar</a>
                        <a href="AdminCreditosServlet?action=rechazar&id=<%= solicitud.getCi()%>">Rechazar</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>
