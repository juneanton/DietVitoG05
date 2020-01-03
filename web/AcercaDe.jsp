<%-- 
    Document   : AcercaDe
    Created on : 27 dic. 2019, 15:18:28
    Author     : June
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acerca de DietVito</title>
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="icon" type="image/png" href="img/favicondietvito.png">
    </head>
    <body>
        <header id="cabecera">
            <div>
                
                <img src="img/dietvito.png">
            </div>
        </header>

        <nav id = "menuprincipal">
            <ul class="menu">
                <li><a style ="float:left" href="javascript:history.back()"><img class="pequeña" src="img/flecha.png" /></a></li>
                <li><a id = "casa" title = "casa" href="Inicio.jsp"><img class="pequeña" src="img/casa.png" /></a></li>
                <li><a href="Alimentos.jsp">Consultar alimentos</a></li>
                <li><a href="Actividades.jsp">Consultar actividades</a></li>
                <li style="float:right" ><a href="IniciarSesion.html"><img class ="pequeña" src = "img/usuario.png">  Iniciar sesión</a></li>
            </ul>
        </nav>
        <main>
            <div align="center">
                <p></p> 
                <a> Practica de la asignatura de analisis y diseño de sistemas de información</a>
                <p><u>Grupo 05:</u></p>
                <p></p>
                <P>Miren Elizondo</P>
                <p>June Antón</p> 
            </div>
        </main>
            <footer id="pie">
                <hr/>
                &copy; Grupo 05. Análisis y diseño de sistemas de información
                <a href="AcercaDe.jsp">Acerca de </a><img class="pequeña" src="img/FB.png"/><img class="pequeña" src="img/TW.png"/><img class="pequeña" src="img/insta.png"/>
            </footer>
    </body>
</html>
