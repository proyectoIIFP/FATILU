<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conexion.Conexion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="css/contacto.css" rel="stylesheet" type="text/css"/>
        <style>

            body {

                font-family: Arial, sans-serif;
                display: flex;
                flex-direction: column;

                justify-content: center;

            }

            .container {
                width: 400px;
                background-color: #990099; /* Violeta oscuro */
                border-radius: 30px;
                padding: 5px;
                margin: 15px auto;
                box-shadow: 10px 10px 5px 15px rgba(0, 0, 0, 0.3);
                text-align: left;
                justify-content: center;
            }

            h2 {
                text-align: center;

            }


        </style>
        <title>Modificar Perfil</title>

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
        <div class="container">
            <h2>Datos Actuales</h2>
            Codigo: <%= session.getAttribute("codigo")%><br>
            Nombre: <%= session.getAttribute("nombre")%><br>
            Apellido: <%= session.getAttribute("apellidoUsuario")%><br>
            Cédula: <%= session.getAttribute("usuario")%><br>
            Nro. Celular:<%= session.getAttribute("telefonoUsuario")%><br>
            Dirección: <%= session.getAttribute("direccionUsuario")%><br>

            <h3>¿Quieres modificar tus datos?</h3>
            <button onclick="mostrarFormulario()" class="btn btn-primary">Modificar Datos</button>
            <div id="formularioDatos" style="display: none;">
                <div class="container2" style="width: 300px; text-align: center"  >
                    <h2>Estos son los datos que puedes modificar</h2>

                    <form action="mostrarPerfil.jsp" method="post">
                        <input type="hidden" name="codigoProducto" value="<%= session.getAttribute("codigo")%>">
                        Nro. Celular: <input type="text" name="nroCelular" value="<%= session.getAttribute("telefonoUsuario")%>" required><br>
                        Dirección: <input type="text" name="direccion" value="<%= session.getAttribute("direccionUsuario")%>" required><br>
                        <input type="submit" value="Guardar_Cambios" name="guardar">
                    </form>
                </div>   
            </div>
        </div>
        <script>
            function mostrarFormulario() {
                document.getElementById("formularioDatos").style.display = "block";
            }


        </script>
        <%
            if (request.getParameter("guardar") != null) {
                String cod =  request.getParameter("codigoProducto");
                String celular = request.getParameter("nroCelular");
                String direccion = request.getParameter("direccion");
                try {
                    Connection con = null;
                    Statement st = null;
                    Conexion cn = new Conexion();
                    con = cn.getConnection();
                    st = con.createStatement();
                    st.executeUpdate("UPDATE persona "
                            + "SET direccion='" + direccion + "', "
                            + "celular='" + celular + "' "
                            + "WHERE codigo='" + cod + "';");
                    request.getRequestDispatcher("mostrarPerfil.jsp").forward(request, response);
                    
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
