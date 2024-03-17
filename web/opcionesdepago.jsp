<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Opciones de Pago</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/contacto.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>

            body {

                font-family: Arial, sans-serif;
                display: flex;
                flex-direction: column;

                justify-content: center;

            }

            .container {
                width: 400px;
                background-color: #990099; /* Violeta oscuro */
                border-radius: 30px;
                padding: 5px;
                margin: 15px auto;
                box-shadow: 10px 10px 5px 15px rgba(0, 0, 0, 0.3);
                text-align: left;
                justify-content: center;
            }

            h1 {
                text-align: center;

            }

            .btn-option {
                font-family: Forte Forward;
                background-color: #990099;
                color: #f4f4f4;
                margin-bottom: 10px;
                font-size: 18px;
                width: 80%;
                max-width: 250px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin: 10px auto;
            }

            .info-section {
                font-size: 15px;
                font-family: Forte Forward;
                color: black;
                display: flex;
                align-items: center;
                justify-content: center;

            }
            .info-section p {
                margin: 0;  /* Elimina el margen entre los párrafos */
                padding: 10px;  /* Añade un pequeño espacio entre las líneas si es necesario */
            }

        </style>
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
        <div class="container">
            <h1>Opciones de Pago</h1>

            <!-- Botón Tigo Money -->
            <button type="button" class="btn btn-outline-primary btn-option" onclick="mostrarInfo('tigoMoneyInfo')">
                Tigo Money
                <i class="fas fa-chevron-down"></i>
            </button>
            <!-- Información Tigo Money (inicialmente oculta) -->
            <div id="tigoMoneyInfo" class="info-section">
                <p><strong>Nombre:</strong> Pablo Martinez</p>  
                <br><br> 
                <p><strong>Número:</strong> 0982631749</p>
            </div>

            <!-- Botón Billetera Personal -->
            <button type="button" class="btn btn-outline-primary btn-option" onclick="mostrarInfo('billeteraPersonalInfo')">
                Billetera Personal
                <i class="fas fa-chevron-down"></i>
            </button>
            <!-- Información Billetera Personal (inicialmente oculta) -->
            <div id="billeteraPersonalInfo" class="info-section">
                <!-- Información de Billetera Personal -->
                <p><strong>Nombre:</strong> Pablo Martinez</p>   
                <p><strong>Número:</strong> 0975965891</p>
            </div>

            <!-- Botón Eko -->
            <button type="button" class="btn btn-outline-primary btn-option" onclick="mostrarInfo('ekoInfo')">
                Eko
                <i class="fas fa-chevron-down"></i>
            </button>
            <!-- Información Eko (inicialmente oculta) -->
            <div id="ekoInfo" class="info-section">
                <p><strong>Titular:</strong> Fatima Lucia Martinez Aleman</p>  
                <p><strong>Número de cedula:</strong> 5166463</p>
                <p><strong>Número de cuenta para transferencia desde Banco Familiar:</strong> 81-6621263</p>
            </div>

            <!-- Botón Ueno -->
            <button type="button" class="btn btn-outline-primary btn-option" onclick="mostrarInfo('uenoInfo')">
                Ueno
                <i class="fas fa-chevron-down"></i>
            </button>
            <!-- Información Ueno (inicialmente oculta) -->
            <div id="uenoInfo" class="info-section">
                <p><strong>Titular:</strong> Fatima Lucia Martinez Aleman</p>  
                <p><strong>Número de cedula:</strong> 5166463</p>
                <p><strong>Número de cuent:</strong> 61947743</p>
            </div>

            <!-- Botón Billetera Mango -->
            <button type="button" class="btn btn-outline-primary btn-option" onclick="mostrarInfo('billeteraMangoInfo')">
                Billetera Mango
                <i class="fas fa-chevron-down"></i>
            </button>
            <!-- Información Billetera Mango (inicialmente oculta) -->
            <div id="billeteraMangoInfo" class="info-section">
                <p><strong>Titular:</strong> @fatilumar</p>  
                <p><strong>Número de telefono:</strong> 0975965891</p>
                <p><strong>Número de cuenta:</strong> 30987944</p>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
                function mostrarInfo(id) {
                    // Ocultar todas las secciones de información
                    $(".info-section").hide();

                    // Mostrar la sección de información correspondiente al botón presionado
                    $("#" + id).show();
                }
        </script>

    </body>
</html>
