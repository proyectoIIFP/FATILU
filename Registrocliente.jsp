
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
            <!--<a id="menu1" class="navbar-toggler"><span class="navbar-toggler-icon"></span> Home</a>-->
            <div class="form-group text-center">
                <h5 style="text-align: center; font-family: 'Forte Forward', cursive; font-size: 30px; color: black;"><strong>En Fatilu Market, tu satisfacción es nuestra prioridad. ¡Bienvenido!</strong></h5>
            </div>
            <div class="dropdown-divider"></div>
            <div class="dropdown">
                <a id="menu2" class="fuentevioleta" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-family: 'Forte Forward', cursive;">Cerrar el Formulario</a>
                <div class="dropdown-menu text-center" id="fuentepurpura">
                    <div class="dropdown-divider"></div>
                    <a href="index.jsp" class="dropdown-item" id="fuentepurpura">Login</a>
                    <!--<a href="Controlador?accion=Salir" class="dropdown-item" id="fuenteazul">Salir</a>-->
                </div>
            </div>
        </nav>

        <!--<div class="container col-lg-3">-->
        <div class="container2 col-lg-5">
            <form action="Registrocliente.jsp" method="post">
                <!--<form action="Controlador">-->
                <div class="form-group text-center">
                    <p style="text-align: center; font-family: 'Forte Forward', cursive; font-size: 20px;"><strong>Complete los campos para acceder a Fatilu Market!!</strong></p>
                    <img style="alignment-adjust: center" src="img/Usuario.png" height="80" width="80"/>
                </div>

                <div class="form-group">
                    <label id="negrita">Documento </label>
                    <input class="form-control" type="text" name="textUsuarioid" placeholder="5166463">
                    <input type="checkbox" id="tipoDocumento" name="tipoDocumento" value="RUC">
                    <label for="tipoDocumento">RUC</label>
                </div>

                <div class="form-group text-center">
                    <label id="negrita">Nombre</label>
                    <input class="form-control" type="text" name="textNombreid" placeholder="Fatima">
                </div >
                <div class="form-group">
                    <label id="negrita">Apellido</label>
                    <input class="form-control" type="text" name="textApellidoid" placeholder="Martinez">
                </div>
                <div class="form-group">
                    <label id="negrita">Direccion</label>
                    <input class="form-control" type="text" name="textDireccionid" placeholder="Olegario">
                </div>
                <div class="form-group">
                    <label id="negrita">Nro de telefono: </label>
                    <input class="form-control" type="number" name="textTelefonoid" placeholder="0975965891">
                </div>
                <div class="form-group">
                    <label id="negrita">Contrase&#241;a: </label>
                    <input class="form-control" type="text" name="textContrasena" placeholder="fatilu12345">
                </div>
                <div class="form-group">
                    <label id="negrita">Tipo de Usuario: </label>
                    <select class="form-control" name="tipoUsuario">
                        <option value="0">Cliente</option>
                    </select>
                </div>
                <div class="form-group">
                    <label texte="center" id="negrita">Limete de credito=500.000 gs</label>
                </div>
                <div class="form-group text-center">
                    <input class="btn btn-info bnt-block" type="submit" name="enviar" value="Cargar Datos">
                </div>
            </form>            
        </div>

        <%
            if (request.getParameter("enviar") != null) {

                String textNombreid = request.getParameter("textNombreid");
                String textApellidoid = request.getParameter("textApellidoid");
                String textDireccionid = request.getParameter("textDireccionid");
                String textTelefonoid = request.getParameter("textTelefonoid");
                String textUsuarioid = request.getParameter("textUsuarioid");
                String textContrasena = request.getParameter("textContrasena");

                LocalDateTime fechaHoraActual = LocalDateTime.now();
                // Obtener el valor del checkbox
                String tipoDocumento = request.getParameter("tipoDocumento");

                // Verificar que el tipo de usuario sea cliente (0: Cliente)
                int tipoUsuarioRegistrado = Integer.parseInt(request.getParameter("tipoUsuario"));

                if (tipoUsuarioRegistrado == 0) {
                    try {
                        Connection con = null;
                        Statement st = null;
                        Conexion cn = new Conexion();
                        con = cn.getConnection();
                        st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT Max(codigo)+1 as cod FROM persona");
                        int codigoPersona = 0;
                        if (rs.next()) {
                            // Si se encontró el producto, establece los valores en los campos del formulario
                            codigoPersona = rs.getInt("cod");
                        }
                        String documento;
                        String CodIdent;
                        if (tipoDocumento != null && tipoDocumento.equals("RUC")) {
                            int guion = textUsuarioid.indexOf("-");
                            documento = (textUsuarioid.substring(0, guion));
                            CodIdent=textUsuarioid.substring(guion+1);
// Si el checkbox RUC está marcado, usar el valor de textUsuarioid como documento
                        } else {
                            documento = (textUsuarioid);
                            CodIdent="-";
// Si no, usar el valor de textApellidoid como documento
                        }
                        st.executeUpdate("insert into persona( "
                                + "codigo,cedula, nombre, apellido, direccion, celular, contrasena, acceso,"
                                + "limitecredito, tipopersona_codigo, fecha_hora,codigoidentificador,estado) "
                                + "values ('" + codigoPersona + "',"
                                + "'" + documento + "',"
                                + "'" + textNombreid + "',"
                                + "'" + textApellidoid + "',"
                                + "'" + textDireccionid + "',"
                                + "'" + textTelefonoid + "','" + textContrasena + "','" + documento + "',"
                                + "'" + "500000" + "','" + "2" + "','" + fechaHoraActual + "','"+CodIdent+"',0);");

                        request.getRequestDispatcher("Interfazcliente.jsp").forward(request, response);
                    } catch (Exception e) {
                        out.print(e);
                    }
                } else {
                    // Si el tipo de usuario no es cliente, manejar según tus necesidades
                    response.sendRedirect("Interfazcliente.jsp");
                }
            }
        %>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>