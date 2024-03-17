

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
        <title>Listado de los Proveedores</title>
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
            <h2 style="font-family: 'Forte Forward', cursive;">Proveedores de FatiluMarket</h2>
            <!-- Formulario de Búsqueda -->
            <form action="Interfazproveedor.jsp" method="post" style="text-align: center;">
                <input type="text" name="terminoBusqueda" placeholder="Buscar cliente...">
                <button   type="submit" name="accion" value="Buscar" style="font-family: 'Forte Forward', cursive; font-size: 20px;">Buscar</button>
                <a id="negrita" href="Registroproveedor.jsp" style="color: orange" >Agregar Proveedor.</a>
                <a id="negrita" href="ModificarProveedor.jsp" style="color: orange" >Modificar Proveedor.</a>
                <a id="negrita" href="EliminarProveedor.jsp" style="color: orange" >Eliminar Proveedor.</a>        
            </form>
            <%
                try {
                    Connection con = null;
                    Statement st = null;
                    Conexion cn = new Conexion();
                    con = cn.getConnection();
                    st = con.createStatement();
                    out.println("<table border=1 width=60% align=center>");
                    out.println("<tr>");
                    out.println("<td width=\"5%\"style=\"background-color: #777\">Codigo</td>");
                    out.println("<td width=\"15%\"style=\"background-color: #777\">Nombre o Razon Social </td>");
                    out.println("<td width=\"10%\"style=\"background-color: #777\">Documento </td>");
                    out.println("<td width=\"35%\"style=\"background-color: #777\">Direccion </td>");
                    out.println("<td width=\"10%\"style=\"background-color: #777\">Telefono </td>");
                    out.println("</tr>");
                    ResultSet r;
                   if (request.getParameter("accion") != null) {
                        String terminoBusqueda = request.getParameter("terminoBusqueda");
                        r = st.executeQuery("select * from persona where tipopersona_codigo=3 and nombre = '"+terminoBusqueda+"' and estado=0");
                    } else {
                           r = st.executeQuery("select * from persona where tipopersona_codigo=3 and estado=0  order by codigo");
                    }
                   while (r.next()) {
                        out.println("<tr>");
                        out.println("<td widh=\"20%\"style=\"background-color: white\">" + r.getString(1) + "</td>");
                        out.println("<td widh=\"15%\"style=\"background-color: white\">" + r.getString(3)+" "+r.getString(4) + "</td>");
                        if( r.getString(12).equals("-")){
                           out.println("<td widh=\"15%\"style=\"background-color: white\">" + r.getString(2)+ "</td>");
                        }else{
                            out.println("<td widh=\"15%\"style=\"background-color: white\">" + r.getString(2)+"-"+r.getString(12) + "</td>");
                        }
                        out.println("<td widh=\"15%\"style=\"background-color: white\">" + r.getString(5) + "</td>");
                        out.println("<td widh=\"20%\"style=\"background-color: white\">" + r.getString(6) + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    out.print(e);
                }
                out.println("</table>");
            %>
    </body>
</html>

