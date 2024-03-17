<%-- 
    Document   : registrar
    Created on : 4-nov-2023, 19:55:13
    Author     : fatil
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="entity.SolicitudCredito"%>
<%@page import="DAO.SolicitudCreditoDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/contacto.css" rel="stylesheet" type="text/css"/>
        <title>FatiluMarket - Créditos</title>
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
        <div class="container" style="font-family: 'Forte Forward', cursive; font-size: 20px;">
            <!-- Información sobre el crédito -->
            <h2>Créditos</h2>
            <p>Limite de crédito: 500,000 Gs</p>
            <p>Fecha de vencimiento: quincenal (01 y 15 de cada mes)</p>

            <!-- Pregunta para solicitar crédito -->
            <h3>¿Quieres un crédito?</h3>
            <button onclick="mostrarFormulario()" class="btn btn-primary">Solicitar Ahora</button>

            <!-- Botón para ver el estado de cuenta (solo visible después de aceptar el crédito) -->
            <button id="btnEstadoCuenta" style="display: none;" onclick="verEstadoCuenta()" class="btn btn-secondary">Estado de Cuenta</button>

            <!-- Formulario de solicitud de crédito (inicialmente oculto) -->
            <div id="formularioCredito" style="display: none;">
                <div class="container2" style="width: 400px; text-align: center"  >
                    <h2>Formulario de Solicitud de Crédito</h2>
                    <form action="creditoscli.jsp" method="post">
                        Monto: <input type="number" name="monto" required max="${not empty login ? login.limiteCredito : 500000}" min="0"><br>
                        Nombre: <input type="text" name="nombre" value="<%= session.getAttribute("nombre")%>" required><br>
                        Apellido: <input type="text" name="apellido" value="<%= session.getAttribute("apellidoUsuario")%>" required><br>
                        Cédula: <input type="text" name="ci" value="<%= session.getAttribute("cedula")%>" required><br>
                        Nro. Celular: <input type="text" name="nroCelular" value="<%= session.getAttribute("telefonoUsuario")%>" required><br>
                        Dirección: <input type="text" name="direccion" value="<%= session.getAttribute("direccionUsuario")%>" required><br>
                        <input type="submit" name="enviar"  value="Enviar Solicitud">
                    </form>
                </div>   
            </div>
        </div>  
        <script>
            function mostrarFormulario() {
                document.getElementById("formularioCredito").style.display = "block";
            }

            function verEstadoCuenta() {
                // Redirige a la página de estado de cuenta (implementar)
                window.location.href = "estadoCuenta.jsp";
            }
        </script>

        <%
            if (request.getParameter("enviar") != null) {

                String doc = request.getParameter("ci");
                String monto = request.getParameter("monto");

                LocalDate fechaHoraActual = LocalDate.now();
                   try {
                        Connection con = null;
                        Statement st = null;
                        Conexion cn = new Conexion();
                        con = cn.getConnection();
                        st = con.createStatement();
                        ResultSet r = st.executeQuery("SELECT Max(codigo)+1 as cod FROM solicitudcredito");
                        int codigoSolicitud = 0;
                        if (r.next()) {
                            // Si se encontró el producto, establece los valores en los campos del formulario
                            codigoSolicitud = r.getInt("cod");
                        }
                        ResultSet rs = st.executeQuery("SELECT codigo as cod FROM persona where cedula = '"+doc+"'");
                        int codigoPersona = 0;
                        if (rs.next()) {
                            // Si se encontró el producto, establece los valores en los campos del formulario
                            codigoPersona = rs.getInt("cod");
                        }
                        st.executeUpdate("insert into solicitudcredito( "
                                + "codigo,fechasolicitud, montosolicitado, estado, fechavto, persona_codigo) "
                                + "values ('" +  codigoSolicitud+ "',"
                                + "'" + fechaHoraActual + "',"
                                + "'" + monto + "',"
                                + "'" + "0" + "','" + fechaHoraActual + "','"+codigoPersona+"');");
                        request.getRequestDispatcher("confirmacionSolicitud.jsp").forward(request, response);
                    } catch (Exception e) {
                        out.print(e);
                    }
            }
        %>
        
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>
