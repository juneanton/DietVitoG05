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
                    nombre
                    
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
        
         <main id ="consultarCalo">
            <div align="center">
                <a> Consultar los alimentos consumidos: </a>
                <section id="FormularioCC">
                    <form name="informacion" method="post" action="procesar.php"> 
                        <p><label>Correo: <input type="email" name="correo" id="correo" required placeholder="ejemplo@ejemplo.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></label></p>
                        <p>Desde: <input type="datetime" name="fechaI" id="fechaI" required> Hasta: <input type="datetime" name="fechaF" id="fechaF" required></p>
                        <p onclick="existeUsu();"><button type="submit" id="enviar">Aceptar</button></p>
                    </form>
                </section>
                
                <article id="elements">
                    <table width="50%">
                        <caption>Alimentos consumidos durante las fechas seleccionadas:</caption>
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Alimento</th>
                                <th>Calorías</th>
                            </tr>
                        </thead>
                        <tbody id="elementsList">
                            <tr>
                                <td colspan="3">No hay datos</td>
                            </tr>
                        </tbody>
                    </table>
                </article>
            </div>
        </main>
        <footer id="pie">
            <hr/>
         &copy; Grupo 05. Análisis y diseño de sistemas de información
         <a href="AcercaDe.jsp">Acerca de </a><img class="pequeña" src="img/FB.png"/><img class="pequeña" src="img/TW.png"/><img class="pequeña" src="img/insta.png"/>
        </footer>
    </body>
</html>
