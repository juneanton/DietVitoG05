<%-- 
    Document   : Dietista
    Created on : 27 dic. 2019, 15:43:40
    Author     : June
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="packDietVito.Servlet_Login" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dietista-DietVito</title>
        <link rel="stylesheet" href="css/estilos.css">
        <!--<script src="js/IDB.js"></script>-->
        <link rel="icon" type="image/png" href="img/favicondietvito.png">
    </head>
    <body>
        <header id="cabecera">
            <div>
               
                <img src="img/dietvito.png">
                <div style="float: right">
                    <p><strong>Hola, Diestista</strong></p> 
                    <!--<p id ="imagenD">imagen</p>--> 
                </div>                
            </div>
        </header>
        
        <nav id = "menuprincipal">
            <ul class="menu">
                <li><a style ="float:left" href="javascript:history.back()"><img class="pequeña" src="img/flecha.png" /></a></li>
                <li><a id = "casa" title = "casa" href="Dietista.jsp"><img class="pequeña" src="img/casa.png" /></a></li>
               
                <li id = "item"><a href="#">Registrar</a>
                    <ul id = "desple"><li><a href="RegistrarUsuario.jsp">Clientes</a></li>
                        <li><a href="RegistrarPesos.jsp">Pesos</a></li></ul> 
                        
                <li id = "item"><a href="#">Consultar</a>
                    <ul id = "desple"><li><a href="ConsultarActividadesRealizadasUsuario.jsp">Actividades realizadas por...</a></li>
                        <li><a href="ConsultarCaloriasConsumidasUsuario.jsp">Alimentos consumidos por...</a></li>  
                        <li><a href="ConsultarPesosUsuario.jsp">Pesos de...</a></li></ul>
                </li>
                
               
                <li onclick="cerrarSesion()" id = "CS" style="float:right" ><a href="IniciarSesion.jsp"><img class ="pequeña" src = "img/usuario.png">  Cerrar sesión</a></li>
            </ul>
        </nav>
        
        <main>
            <div align ="center">
            <pre>

            <font color="green" size ="17" face="Comic Sans MS,arial">
<a><i>¡Hoy puedes ayudar a muchas personas!</i></a>
</font>   
<img class="grande" src="img/team.jpg"> <img class="grande" src="img/adventure.jpg">
            
            </pre>
            </div>
        </main>
        
        <footer id="pie">
         <hr/>
         &copy; Grupo 05. Análisis y diseño de sistemas de información
         <a href="AcercaDe.jsp">Acerca de </a><img class="pequeña" src="img/FB.png"/><img class="pequeña" src="img/TW.png"/><img class="pequeña" src="img/insta.png"/>
        </footer>
    </body>
</html>