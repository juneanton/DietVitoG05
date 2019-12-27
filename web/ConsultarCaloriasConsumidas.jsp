<%-- 
    Document   : ConsultarCaloriasConsumidas
    Created on : 27 dic. 2019, 15:34:43
    Author     : June
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DietVito-Consultar Alimentos</title>
        <link rel="stylesheet" href="css/estilos.css">
        <!--<script src="js/IDB.js"></script>-->
        <link rel="icon" type="image/png" href="img/favicondietvito.png">
    </head>
    <body> 
        <header id="cabecera">
            <div>
                
                <img src="img/dietvito.png">
                <div style="float: right">
                    <a id ="holaU"><strong>Hola,  </strong></a> 
                    <a onload="saludarUsuario();"></a> 
                    
                    <p id ="imagenU">imagen</p>
                </div> 
            </div>
        </header>
        
        <nav id = "menuprincipal">
            <ul class="menu">
                <li><a style ="float:left" href="javascript:history.back()"><img class="pequeña" src="img/flecha.png" /></a></li>
                <li><a id = "casa" title = "casa" href="Cliente.jsp"><img class="pequeña" src="img/casa.png" /></a></li>
                
                <li id = "item"><a href="#">Registrar</a>
                    <ul id = "desple"><li><a href="RegistrarActividad.jsp">Actividades</a></li>
                        <li><a href="RegistrarAlimento.jsp">Alimentos</a></li></ul> 
                        
                <li id = "item"><a href="#">Consultar</a>
                    <ul id = "desple"><li><a href="ConsultarActividadesRealizadas.jsp">Actividades realizadas</a></li>
                        <li><a href="ConsultarCaloriasConsumidas.jsp">Alimentos consumidos</a></li>  
                        <li><a href="ConsultarPesos.jsp">Pesos</a></li></ul>
                </li>
                           
                
                <li onclick="cerrarSesion()" id = "CS" style="float:right" ><a href="IniciarSesion.html"><img class ="pequeña" src = "img/usuario.png">  Cerrar sesión</a></li>
            </ul>
        </nav>
        
        <main id ="consultarActi">
            <div align="center">
                <p>Aqui apareceran las calorias consumidas durante las fechas seleccionadas:</p>
                <img src ="img/error.png"/>
                <p> ESTA SECCIÓN AÚN NO ESTÁ DISPONIBLE, SENTIMOS LAS MOLESTIAS.</p>
                <img src="img/obras.png"/>
            </div>
        </main>
        <footer id="pie">
            <hr/>
         &copy; Grupo 05. Análisis y diseño de sistemas de información
         <a href="AcercaDe.jsp">Acerca de </a><img class="pequeña" src="img/FB.png"/><img class="pequeña" src="img/TW.png"/><img class="pequeña" src="img/insta.png"/>
        </footer>
    </body>
</html>
