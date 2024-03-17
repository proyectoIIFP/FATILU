<%-- 
    Document   : index
    Created on : 6-nov-2023, 17:21:11
    Author     : fatil 
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <title>FatiluMarket</title>
    </head>
    <body class="colorbody">
        <nav>
            <div class="form-group text-center">
                <p style="color: black; font-family: 'Forte Forward' cursive;text-align: center;  font-size: 30px;"><strong>Busque el proveedor para eliminar o dar de baja!!</strong></p>
                <form action="EliminarProveedor.jsp" method="post" style="text-align: center;">
                    <input type="text" name="terminoBusqueda" placeholder="Buscar proveedor...">
                    <button type="submit" name="accion" value="BuscarProducto" style="font-family: 'Forte Forward', cursive; font-size: 20px;">Buscar</button>
                </form>
            </div>
        </nav>
        <div class="container2 col-lg-5">
            <form action="EliminarProveedor.jsp" method="post">
                <input type="hidden" name="codigoProducto" value="">
                <div class="form-group">
                    <label id="negrita">Nombre o Razon Social</label>
                    <input class="form-control" type="text" name="textnombre" placeholder="Nombre">
                </div>
                <div class="form-group">
                    <label id="negrita">Documento</label>
                    <input class="form-control" type="text" name="descripcion" placeholder="Apellido">
                </div>
                <div class="form-group">
                    <label id="negrita">Direccion</label>
                    <input class="form-control" type="text" name="stockActual" placeholder="Direccion">
                </div>
                <div class="form-group">
                    <label id="negrita">Telefono</label>
                    <input class="form-control" type="text" name="stockMinimo" placeholder="Telefono">
                </div>
                <div class="form-group"><input style="position: center" class="btn btn-info bnt-block" type="submit" name="guardar" value="Eliminar proveedor"></div>
            </form>            
        </div>
<%
    if (request.getParameter("accion") != null && request.getParameter("accion").equals("BuscarProducto")) {
        String terminoBusqueda = request.getParameter("terminoBusqueda");
        try {
            Conexion cn = new Conexion();
            Connection con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from persona where tipopersona_codigo=3 and nombre = '" + terminoBusqueda + "' and estado=0");
                    if (rs.next()) {
                        // Si se encontró el producto, establece los valores en los campos del formulario
                        int codigoProducto = rs.getInt(1);
                        String nombre = rs.getString(3);
                        String apellido = rs.getString(2);
                        String direccion = rs.getString(5);
                        String telefono = rs.getString(6);
                        String contraseña = rs.getString(7);
                        String acceso = rs.getString(8);

                        // Establece los valores en los campos del formulario
                        out.println("<script>");
                        out.println("document.getElementsByName('codigoProducto')[0].value = '" + codigoProducto + "';");
                        out.println("document.getElementsByName('textnombre')[0].value = '" + nombre + "';");
                        out.println("document.getElementsByName('descripcion')[0].value = '" + apellido + "';");
                        out.println("document.getElementsByName('stockActual')[0].value = '" + direccion + "';");
                        out.println("document.getElementsByName('stockMinimo')[0].value = '" + telefono + "';");
                        out.println("</script>");
                    } else {
                        // Si no se encontró el producto, puedes mostrar un mensaje al usuario
                        out.println("<script>alert('Datos no encontrados');</script>");
                    }
        } catch (Exception e) {
            out.print(e);
        }
    }
    if (request.getParameter("guardar") != null) {
        String cod = request.getParameter("codigoProducto");
        try {
            Connection con = null;
            Statement st = null;
            Conexion cn = new Conexion();
            con = cn.getConnection();
            st = con.createStatement();
            st.executeUpdate("UPDATE persona "
                    + "SET estado=1"
                    + "WHERE codigo='" + cod + "';");
            request.getRequestDispatcher("Interfazproveedor.jsp").forward(request, response);
        } catch (Exception e) {
            out.print(e);
        }
    }
%>

<!-- Resto de tu HTML -->
</body>
</html>
