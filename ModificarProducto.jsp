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
        <p style="color: black; font-family: 'Forte Forward' cursive;text-align: center;  font-size: 30px;"><strong>Busque el artículo para modificar!!</strong></p>
        <form action="ModificarProducto.jsp" method="post" style="text-align: center;">
            <input type="text" name="terminoBusqueda" placeholder="Buscar producto...">
            <button type="submit" name="accion" value="BuscarProducto" style="font-family: 'Forte Forward', cursive; font-size: 20px;">Buscar</button>
        </form>
    </div>
</nav>
<div class="container2 col-lg-5">
            <form action="ModificarProducto.jsp" method="post">
                <input type="hidden" name="codigoProducto" value="">
                    <tr>
                    <div class="form-group">
                        <label id="negrita">Nombre</label>
                        <input class="form-control" type="text" name="textnombre" placeholder="Nombre producto">
                    </div>
                    <div class="form-group">
                        <label id="negrita">Descripción</label>
                        <input class="form-control" type="text" name="descripcion" placeholder="Descripcion Producto">
                    </div>
                    <div class="form-group">
                       <label id="negrita">Stock</label>
                       <input class="form-control" type="text" name="stockActual" placeholder="0">
                    </div>
                    <div class="form-group">
                      <label id="negrita">Stock Minimo</label>
                     <input class="form-control" type="text" name="stockMinimo" placeholder="0">
                    </div>
                    <div class="form-group">
                       <label id="negrita">Fecha de Vencimiento </label>
                       <input class="form-control" type="text" name="vto" placeholder="0000-00-00">
                    </div>
                    <div class="form-group">
                        <label id="negrita">Precio Compra </label>
                       <input class="form-control" type="text" name="pCompra" placeholder="0">
                    </div>
                <div class="form-group"><label texte="center" id="negrita">Precio de Venta se calcula un 20% mas a la compra!</label></div>
                    <div class="form-group"><input style="position: center" class="btn btn-info bnt-block" type="submit" name="guardar" value="Actualizar Datos"></div>
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
                    st.executeUpdate("UPDATE productos "
                            + "SET nombre='" + nom + "', "
                            + "descripcion='" + desc + "', "
                            + "stockActual='" + sac + "', "
                            + "stockminimo='" + smin + "', "
                            + "fechaVencimiento='" + vto + "', precioVenta='" + venta + "', precioCompra='" + compra + "' "
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
