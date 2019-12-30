<%-- 
    Document   : IniciarSesion
    Created on : 27 dic. 2019, 15:45:41
    Author     : June
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DietVito-Iniciar sesión</title>
        <link rel="stylesheet" href="css/estilos.css">
        <!--<script src="js/IDB.js"></script>-->
        <!--<script src ="js/indexedBD.js"></script>-->
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
                <li><a id = "casa" title = "casa" href="Inicio.jsp"><img class="pequeña" src="img/casa.png"/></a></li>
                
                <li><a href="Alimentos.jsp">Consultar alimentos</a></li>
                
                <li><a href="Actividades.jsp">Consultar actividades</a></li>
                
                <li style="float:right" ><a href="IniciarSesion.jsp"><img class ="pequeña" src = "img/usuario.png">  Iniciar sesión</a></li>
            </ul>
        </nav>
        
        <main >
            <div align="center">
                <p> </p>
                <p id = "imagenUsuario" ><img src = "img/usuario.png"/></p> 
                <p> </p>
                <a> Inicia sesión en DietVito con tu correo y contraseña: </a>
                <p>
                <section id="FormularioIS">
                    <form name="informacion" method="post" action="Login">
                        <p><label>Correo: <input type="email" name="correo" id="correo" required placeholder="ejemplo@ejemplo.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></label></p>
                        <p><label>Contraseña <img class = "pequeña" src="img/candado.png">: <input type="password" name="pass" id="pass" required placeholder ="Contraseña"></label></p>
                        <p><button type="submit" id="btnIS">Aceptar</button></p>
                    </form>
                </section>
            </div>
        </main>
        <footer id="pie">
            <hr/>
         &copy; Grupo 05. Análisis y diseño de sistemas de información
         <a href="AcercaDe.jsp">Acerca de </a><img class="pequeña" src="img/FB.png"/><img class="pequeña" src="img/TW.png"/><img class="pequeña" src="img/insta.png"/>
        </footer>
    </body>
</html>
