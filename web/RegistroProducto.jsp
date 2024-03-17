<%-- 
    Document   : index
    Created on : 6-nov-2023, 17:21:11
    Author     : fatil 
--%>

<%@page import="conexion.Conexion"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="entity.login"%>
<%@page import="DAO.loginDAO"%>
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
        <nav class="navbar navbar-dark bg-primary">
            <div class="form-group text-center">
                <p style="color: black; font-family: 'Forte Forward' cursive;text-align: center;  font-size: 30px;"><strong>Complete los campos para registrar el producto!!</strong></p>
            </div>
        </nav>
        <!--<div class="container col-lg-3">-->
        <div class="container2 col-lg-5">
            <form action="RegistroProducto.jsp" method="post">
                <!--<form action="Controlador">-->
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
                    <div class="form-group"><input style="position: center" class="btn btn-info bnt-block" type="submit" name="guardar" value="Cargar Datos"></div>
            </form>            
        </div>

        <%
            if (request.getParameter("guardar") != null) {
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
                    ResultSet r = st.executeQuery("select MAX(codigo)+1 as cod from productos");
                    r.next();
                    String idStr = "";
                    if (r.getString(1) == null) {
                        idStr = ("1");
                    } else {
                        idStr = (r.getString(1));
                    }
                    st.executeUpdate("insert into productos("
                            + "codigo,"
                            + "nombre,"
                            + "descripcion,"
                            + "stockactual,"
                            + "stockminimo,"
                            + "fechavencimiento, "
                            + "precioventa"
                            + ",preciocompra,estado)"
                            + "values ('" + idStr + "',"
                            + "'" + nom + "',"
                            + "'" + desc + "',"
                            + "'" + sac + "',"
                            + "'" + smin + "',"
                            + "'" + vto + "',"
                            + "'" + venta + "',"
                            + "'" + compra + "',0);");
                    request.getRequestDispatcher("Interfazproducto.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
        <div class="dropdown">
            <a id="menu2" class="fuentevioleta" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-family: 'Forte Forward', cursive;">Cerrar el Formulario</a>
            <div class="dropdown-menu text-center" id="fuentepurpura">
                <div class="dropdown-divider"></div>
                <a href="Interfazproducto.jsp" class="dropdown-item" id="fuentepurpura">Login</a>
                <!--<a href="Controlador?accion=Salir" class="dropdown-item" id="fuenteazul">Salir</a>-->
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>