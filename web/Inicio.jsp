<%-- 
    Document   : Inicio
    Created on : 27 dic. 2019, 15:07:50
    Author     : June
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DietVito</title>
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
                <li style="float:right" ><a href="IniciarSesion.jsp"><img class ="pequeña" src = "img/usuario.png">  Iniciar sesión</a></li>
            </ul>
        </nav>
        
        <main>
            <section>
                <p></p>
                <article id="info">
                    <div align="center">
                        <pre id="textoInicial"> 
                        DietVito es una web donde podrá registra las calorías consumidas y quemadas.
                        Gracias a DietVito podrá llevar una dieta equilibrada y controlar su salud.
                        Además cuenta con un dietista que registra su peso y hace un seguimiento de los registros 
                        (tanto de alimentos consumidos como de ejercicios realizados).
                        ¡No lo piense más y resgístrese!
                        </pre>
                    </div>
                </article>
                <article id ="fotos" >
                    <div align="center">
                        <img class = "grande" src = "img/dietista.jpg">
                        <img class = "grande" src = "img/letrascomida.jpg">
                        <img class = "grande" src = "img/paginaprincipal.jpg">
                        <img class = "grande" src = "img/vidasaludable.jpg">
                        <img class = "grande" src = "img/vidasaludable2.jpg">
                    </div>
                </article>
            </section>
        </main>
        <footer id="pie">
            <hr/>
         &copy; Grupo 05. Análisis y diseño de sistemas de información
         <a href="AcercaDe.jsp">Acerca de </a><img class="pequeña" src="img/FB.png"/><img class="pequeña" src="img/TW.png"/><img class="pequeña" src="img/insta.png"/>
        </footer>
    </body>
</html>
