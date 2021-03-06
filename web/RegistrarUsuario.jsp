<%-- 
    Document   : RegistrarUsuario
    Created on : 27 dic. 2019, 15:53:22
    Author     : June
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DietVito-Registrar Usuario</title>
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="icon" type="image/png" href="img/favicondietvito.png">
    </head>
    <body>
        <header id="cabecera">
            <div>
                <img src="img/dietvito.png">
                <div style="float: right">
                    <p><strong>Hola Dietista</strong></p>
                    <p id ="imagenD"><img class="normal" src="img/dietista_1.jpg"></p>
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
                
                <li action ="CerrarSesion" id = "CS" style="float:right" ><a href="IniciarSesion.jsp"><img class ="pequeña" src = "img/usuario.png">  Cerrar sesión</a></li>
            </ul>
        </nav>

        <main >
            <div align="center">
                <a> Registra al nuevo usuario de DietVito con sus datos: </a>
                <section id="FormularioRU">
                    <form name="informacion" method="post" action="RegistroUsuario">
                        <p><label>Correo: <input type="email" name="correo" id="correo" required placeholder="ejemplo@ejemplo.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></label></p>
                        <p><label>Contraseña: <input type="password" name="contrasena" id="contrasena" autocomplete="off" required></label></p>
                        <p><label>Nombre: <input type="text" name="nombre" id="nombre" required></label></p>
                        <p><label>Peso Inicial: <input type="number" name="peso" id="peso" step="0.001" required></label>kg.</p> 
                        <p><label>Altura: <input type="number" name="altura" id="altura" step="0.001" required></label>cm.</p> 

                        <p>Añada una foto de perfil:</p><img id="foto" required>
                        <input type="file" name="foto" id="foto" accept=".pdf,.jpg,.png">
                        <p><button type="submit" id="enviar">Aceptar</button></p>
                        <!--<div id="caja" ></div>-->

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
