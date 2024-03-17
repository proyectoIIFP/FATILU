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
                <p style="color: black; font-family: 'Forte Forward' cursive;text-align: center;  font-size: 30px;"><strong>Busque el Cliente para modificar!!</strong></p>
                <form action="ModificarCliente.jsp" method="post" style="text-align: center;">
                    <input type="text" name="terminoBusqueda" placeholder="Buscar Cliente...">
                    <button type="submit" name="accion" value="BuscarProducto" style="font-family: 'Forte Forward', cursive; font-size: 20px;">Buscar</button>
                </form>
            </div>
        </nav>
        <div class="container2 col-lg-5">
            <form action="ModificarCliente.jsp" method="post">
                <input type="hidden" name="codigoProducto" value="">
                <div class="form-group">
                    <label id="negrita">Documento </label>
                    <input class="form-control" type="text" name="textUsuarioid" placeholder="5166463">
                    <input type="checkbox" id="tipoDocumento" name="tipoDocumento" value="RUC">
                    <label for="tipoDocumento">RUC</label>
                </div>
                <div class="form-group">
                    <label id="negrita">Nombre</label>
                    <input class="form-control" type="text" name="textnombre" placeholder="Nombre">
                </div>
                <div class="form-group">
                    <label id="negrita">Apellido</label>
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
                <div class="form-group">
                    <label id="negrita">Contraseña </label>
                    <input class="form-control" type="text" name="vto" placeholder="Contraseña">
                </div>
                <div class="form-group">
                    <label id="negrita">Acceso </label>
                    <input class="form-control" type="text" name="pCompra" placeholder="Acceso"> 
                </div>
                <div class="form-group">
                    <input style="position: center" class="btn btn-info bnt-block" type="submit" name="guardar" value="Actualizar Datos"></div>
            </form>            
        </div>
        <%
            if (request.getParameter("accion") != null && request.getParameter("accion").equals("BuscarProducto")) {
                String terminoBusqueda = request.getParameter("terminoBusqueda");
                try {
                    Conexion cn = new Conexion();
                    Connection con = cn.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from persona where tipopersona_codigo=2 and nombre = '" + terminoBusqueda + "' and estado=0");
                    if (rs.next()) {
                        // Si se encontró el producto, establece los valores en los campos del formulario
                        int codigoProducto = rs.getInt(1);
                        String documento = rs.getString(2);
                        String nombre = rs.getString(3);
                        String apellido = rs.getString(4);
                        String direccion = rs.getString(5);
                        String telefono = rs.getString(6);
                        String contraseña = rs.getString(7);
                        String acceso = rs.getString(8);

                        // Establece los valores en los campos del formulario
                        out.println("<script>");
                        out.println("document.getElementsByName('textUsuarioid')[0].value = '" + documento + "';");
                        out.println("document.getElementsByName('codigoProducto')[0].value = '" + codigoProducto + "';");
                        out.println("document.getElementsByName('textnombre')[0].value = '" + nombre + "';");
                        out.println("document.getElementsByName('descripcion')[0].value = '" + apellido + "';");
                        out.println("document.getElementsByName('stockActual')[0].value = '" + direccion + "';");
                        out.println("document.getElementsByName('stockMinimo')[0].value = '" + telefono + "';");
                        out.println("document.getElementsByName('vto')[0].value = '" + contraseña + "';");
                        out.println("document.getElementsByName('pCompra')[0].value = '" + acceso + "';");
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
                String doc = request.getParameter("textUsuarioid");
                String nom = request.getParameter("textnombre");
                String desc = request.getParameter("descripcion");
                String sac = request.getParameter("stockActual");
                String smin = request.getParameter("stockMinimo");
                String vto = request.getParameter("vto");
                String compra = (request.getParameter("pCompra"));
                int intCompra = Integer.parseInt(compra);
                String venta = "" + ((intCompra) + (intCompra * 20 / 100));
                try {
                    Connection con = null;
                    Statement st = null;
                    Conexion cn = new Conexion();
                    con = cn.getConnection();
                    st = con.createStatement();
                    st.executeUpdate("UPDATE persona "
                            + "SET nombre='" + nom + "', "
                            + "cedula='" + doc + "', "
                            + "apellido='" + desc + "', "
                            + "direccion='" + sac + "', "
                            + "celular='" + smin + "', "
                            + "contrasena='" + vto + "', acceso='" + venta + "' "
                            + "WHERE codigo='" + cod + "';");
                    request.getRequestDispatcher("Interfazcliente.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>

        <!-- Resto de tu HTML -->
    </body>
</html>
