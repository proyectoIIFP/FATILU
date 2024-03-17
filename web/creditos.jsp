<%-- 
    Document   : creditos
    Created on : 23-nov-2023, 20:02:50
    Author     : fatil
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Factura</title>
        <link rel="stylesheet" type="text/css" href="css/creditos.css">
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
        <div style="font-family: 'Forte Forward', cursive;" class="factura">
            <h2 style="font-family: 'Forte Forward', cursive;">Factura</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>Cantidad</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2</td>
                        <td>Producto A</td>
                        <td>G. 10.000</td>
                        <td>G. 7.000</td>

                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Producto B</td>
                        <td>G. 7.000</td>
                        <td>G. 7.000</td>

                    </tr>
                    <!-- Puedes agregar más filas según tus datos -->
                </tbody>
            </table>
        </div>

        <h1 style="font-family: 'Forte Forward', cursive;">Detalles de la Factura</h1>

        <div  style="font-family: 'Forte Forward', cursive;" class="factura-info">
            <table border="1">
                <thead>
                    <tr>
                        <th>Monto Total</th>
                        <th>Estado de Factura</th>
                        <th>Nro de Factura</th>
                        <th>Pago</th>
                        <th>Saldo</th>
                        <th>Pagado</th>
                        <th>Fecha</th>
                        <th>Descripción</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>G. 27.000</td>
                        <td>Pendiente</td>
                        <td>123456</td>
                        <td>G. 27.000</td>
                        <td>G. 0</td>
                        <td>1</td>
                        <td>2023-11-23</td>
                        <td>Deuda a pagar</td>
                    </tr>
                    <!-- Puedes agregar más filas según tus datos -->
                </tbody>
            </table>
        </div>



    </body>
</html>

