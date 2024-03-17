<%@ page import="java.util.List" %>
<%@ page import="entity.Producto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/productos.css" rel="stylesheet" type="text/css"/>
    <title>FatiluMarket - Producto</title>
</head>
<body class="colorbody">
    <h1>Listado de Productos</h1>

    <ul>
        <% 
            List<Producto> productosList = (List<Producto>) request.getAttribute("listaProductos");
            if (productosList != null && !productosList.isEmpty()) {
                for (Producto p : productosList) {
        %>
        <li>
            Nombre: <%= p.getNombre() %><br>
            Descripción: <%= p.getDescripcion() %><br>
            Precio: <%= p.getPrecio_venta() %><br> <!-- Actualizado para reflejar el nuevo campo -->
            <!-- Agrega aquí el código para mostrar otros campos si es necesario -->
            <hr>
        <%
                }
            } else {
        %>
        <li>No hay productos disponibles.</li>
        <% } %>
    </ul>
</body>
</html>

