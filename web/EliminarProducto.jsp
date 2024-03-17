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
    <link href="css/stilos.css" rel="stylesheet" type="text/css"/>
    <title>FatiluMarket</title>
</head>
<body class="colorbody">
<nav>
    <div class="form-group text-center">
        <p style="color: black; font-family: 'Forte Forward' cursive;text-align: center;  font-size: 30px;"><strong>Busque el artículo para eliminar o dar de baja!!</strong></p>
        <form action="EliminarProducto.jsp" method="post" style="text-align: center;">
            <input type="text" name="terminoBusqueda" placeholder="Buscar producto...">
            <button type="submit" name="accion" value="BuscarProducto" style="font-family: 'Forte Forward', cursive; font-size: 20px;">Buscar</button>
        </form>
    </div>
</nav>
<div class="container2 col-lg-5">
            <form action="EliminarProducto.jsp" method="post">
                <input type="hidden" name="codigoProducto" value="">
                <table width=100% align=center>
                    <tr>
                    <div class="form-group">
                        <td><label id="negrita">Nombre</label></td>
                        <td><input class="form-control" type="text" name="textnombre" placeholder="Nombre producto"></td>
                    </div>
                    </tr><tr>
                    <div class="form-group">
                        <td><label id="negrita">Descripción</label></td>
                        <td><input class="form-control" type="text" name="descripcion" placeholder="Descripcion Producto"></td>
                    </div>
                    </tr><tr><div class="form-group">
                        <td><label id="negrita">Stock</label></td>
                       <td> <input class="form-control" type="text" name="stockActual" placeholder="0"></td>
                    </div>
                    </tr><tr><div class="form-group">
                       <td> <label id="negrita">Stock Minimo</label></td>
                       <td> <input class="form-control" type="text" name="stockMinimo" placeholder="0"></td>
                    </div>
                    </tr><tr><div class="form-group">
                       <td> <label id="negrita">Fecha de Vencimiento </label></td>
                       <td> <input class="form-control" type="text" name="vto" placeholder="0000-00-00"></td>
                    </div>
                    </tr><tr><div class="form-group">
                       <td> <label id="negrita">Precio Compra </label></td>
                       <td> <input class="form-control" type="text" name="pCompra" placeholder="0"></td>
                    </div>
                </table>
                    <div class="form-group"><input style="position: center" class="btn btn-info bnt-block" type="submit" name="guardar" value="Eliminar Producto"></div>
            </form>            
        </div>
<%
    if (request.getParameter("accion") != null && request.getParameter("accion").equals("BuscarProducto")) {
        String terminoBusqueda = request.getParameter("terminoBusqueda");
        try {
            Conexion cn = new Conexion();
            Connection con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM productos WHERE estado =0 and nombre LIKE '%" + terminoBusqueda + "%' or descripcion LIKE '%" + terminoBusqueda + "%'");
            
            if (rs.next()) {
                // Si se encontró el producto, establece los valores en los campos del formulario
                int codigoProducto = rs.getInt("codigo");
               String nombre = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                int stockActual = rs.getInt("stockactual");
                int stockMinimo = rs.getInt("stockminimo");
                String vto = rs.getString("fechavencimiento");
                int pCompra = rs.getInt("preciocompra");
                
                // Establece los valores en los campos del formulario
                out.println("<script>");
                out.println("document.getElementsByName('codigoProducto')[0].value = '" + codigoProducto + "';");
               out.println("document.getElementsByName('textnombre')[0].value = '" + nombre + "';");
                out.println("document.getElementsByName('descripcion')[0].value = '" + descripcion + "';");
                out.println("document.getElementsByName('stockActual')[0].value = '" + stockActual + "';");
                out.println("document.getElementsByName('stockMinimo')[0].value = '" + stockMinimo + "';");
                out.println("document.getElementsByName('vto')[0].value = '" + vto + "';");
                out.println("document.getElementsByName('pCompra')[0].value = '" + pCompra + "';");
                out.println("</script>");
            } else {
                // Si no se encontró el producto, puedes mostrar un mensaje al usuario
                out.println("<script>alert('Producto no encontrado');</script>");
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
                    st.executeUpdate("UPDATE productos "
                            + "SET estado=1"
                            + "WHERE codigo='" + cod + "';");
                    request.getRequestDispatcher("Interfazproducto.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
%>

<!-- Resto de tu HTML -->
</body>
</html>
