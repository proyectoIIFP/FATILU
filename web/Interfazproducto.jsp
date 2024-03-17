<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Conexion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Productos</title>
        <link rel="stylesheet" type="text/css" href="css/creditos.css">
    </head>
    <body>
        <nav>
            <ul>
                <li><a style="font-family: 'Forte Forward', cursive;" href="#perfil">Perfil</a></li>
                <li><a style="font-family: 'Forte Forward', cursive;" href="#informacion">Información</a></li>
                <li><a style="font-family: 'Forte Forward', cursive;" href="#creditos">Créditos</a></li>
                <li><a style="font-family: 'Forte Forward', cursive;" href="#productos">Productos</a></li>
                <li><a style="font-family: 'Forte Forward', cursive;" href="#contacto">Contacto</a></li>
            </ul>
        </nav>
        <div style="font-family: 'Forte Forward', cursive;" class="factura">
            <!-- <h2 style="font-family: 'Forte Forward', cursive;">Factura</h2>-->
            <h2 style="font-family: 'Forte Forward', cursive;">Productos En FatiluMarket</h2>
            <!-- Formulario de Búsqueda -->
            <form action="Interfazproducto.jsp" method="post" style="text-align: center;">
                <input type="text" name="terminoBusqueda" placeholder="Buscar producto...">
                <button   type="submit" name="accion" value="BuscarProducto" style="font-family: 'Forte Forward', cursive; font-size: 20px;">Buscar</button>
                <a id="negrita" href="RegistroProducto.jsp" style="color: orange" >Agregar Producto.</a>
                <a id="negrita" href="ModificarProducto.jsp" style="color: orange" >Modificar Producto.</a>
                <a id="negrita" href="EliminarProducto.jsp" style="color: orange" >Eliminar Producto.</a>        
            </form>
            <%
                Connection con = null;
                Statement st = null;
                Conexion cn = new Conexion();
                con = cn.getConnection();
                st = con.createStatement();
                try {
                    ResultSet r;
                    out.println("<table border=1 width=60% align=center>");
                    out.println("<tr>");
                    out.println("<td width=\"5%\" style=\"background-color: #777\">Codigo</td>");
                    out.println("<td width=\"15%\" style=\"background-color: #777\">Nombre</td>");
                    out.println("<td width=\"35%\" style=\"background-color: #777\">Descripción</td>");
                    out.println("<td width=\"10%\" style=\"background-color: #777\">Precio Venta</td>");
                    out.println("</tr>");
                    if (request.getParameter("accion") != null) {
                        String terminoBusqueda = request.getParameter("terminoBusqueda");
                        r = st.executeQuery("select * from productos where nombre = '"+terminoBusqueda+"' and estado=0");
                    } else {
                           r = st.executeQuery("select * from productos where estado=0 order by codigo");
                    }
                    while (r.next()) {
                                out.println("<tr>");
                                out.println("<td width=\"20%\" style=\"background-color: white\">" + r.getString(1) + "</td>");
                                out.println("<td width=\"15%\" style=\"background-color: white\">" + r.getString(2) + "</td>");
                                out.println("<td width=\"15%\" style=\"background-color: white\">" + r.getString(3) + "</td>");
                                out.println("<td width=\"15%\" style=\"background-color: white\">" + r.getString(7) + "</td>");
                                out.println("</tr>");
                            }
                            out.println("</table>");
                } catch (Exception e) {
                    out.print(e);
                }

            %>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>
