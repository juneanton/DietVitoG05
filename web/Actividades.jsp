<%-- 
    Document   : Actividades
    Created on : 27 dic. 2019, 15:23:57
    Author     : June
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DietVito-Actividades</title>
        <link rel="stylesheet" href="css/estilos.css">
        <!--<script src="js/IDB.js"></script>-->
        <link rel="icon" type="image/png" href="img/favicondietvito.png">
    </head>
    <body onload='iniciar();'>
        <header id="cabecera">
            <div>
                <img src="img/dietvito.png">
            </div>
        </header>
        
        <nav id = "menuprincipal">
            <ul class="menu">
                <li><a style ="float:left" href="javascript:history.back()"><img class="pequeña" src="img/flecha.png" /></a></li>
                <li><a id = "casa" title = "casa" href="Inicio.jsp"><img class="pequeña" src="img/casa.png"/></a></li>
                <li><a href="Alimentos.jsp">Consultar alimentos</a></li>
                <li><a href="Actividades.jsp">Consultar actividades</a></li>
                <li style="float:right" ><a href="IniciarSesion.jsp" ><img class ="pequeña" src = "img/usuario.png">  Iniciar sesión</a></li>
            </ul>
        </nav>
        
        <main>
            <div align="center">
                <p></p>
                <p id ="imagenActi"><img class="grande" src = "img/deporte2.png"/></p> 
                <p></p>
                
                
                <div id="elements">
                    <table width="50%">
                        <caption>Actividades</caption>
                         <thead>
                             <tr>
                                <th>Ejercicio</th>
                                <th>Descripción</th>
                                <th>Calorías</th>
                                <th> </th>
                            </tr>
                        </thead>
                        <tbody id="elementsList">
                            <tr>
                                <td colspan="3">No hay datos</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <p></p>                     
            </div>
        </main>
        <footer id="pie">
         <hr/>   
         &copy; Grupo 05. Análisis y diseño de sistemas de información
         <a href="AcercaDe.jsp">Acerca de </a><img class="pequeña" src="img/FB.png"/><img class="pequeña" src="img/TW.png"/><img class="pequeña" src="img/insta.png"/>
        </footer>
    </body>
</html>
