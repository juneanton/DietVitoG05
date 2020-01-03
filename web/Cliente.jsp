<%-- 
    Document   : Cliente
    Created on : 27 dic. 2019, 15:26:26
    Author     : June
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="packDietVito.Servlet_Login" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente-DietVito</title>
        <link rel="stylesheet" href="css/estilos.css">
        <!--<script src="js/IDB.js"></script>-->
        <link rel="icon" type="image/png" href="img/favicondietvito.png">
    </head>
    <body action ="Login">
        <header id="cabecera">
            <div>
                <img src="img/dietvito.png">
                <div style="float: right">
                    
                    <a id ="holaU"><strong>Hola, <%=request.getSession().getAttribute("nombre")%> </strong></a>
                    <p id ="imagenU">imagen</p> 
                </div> 
            </div>
        </header>

        <nav id = "menuprincipal">
            <div>
                <ul id="menu">
                    <li><a style ="float:left" href="javascript:history.back()"><img class="pequeña" src="img/flecha.png" /></a></li>
                    <li><a id = "casa" title = "casa" href="Cliente.jsp"><img class="pequeña" src="img/casa.png" /></a></li>

                    <li id = "item"><a href="#">Registrar</a>
                        <ul id = "desple"><li><a href="RegistrarActividad.jsp">Actividades</a></li>
                            <li><a href="RegistrarAlimento.jsp">Alimentos </a></li></ul> 

                    <li id = "item"><a href="#">Consultar</a>
                        <ul id = "desple"><li><a href="ConsultarActividadesRealizadas.jsp">Actividades realizadas</a></li>
                            <li><a href="ConsultarCaloriasConsumidas.jsp">Alimentos consumidos</a></li>  
                            <li><a href="ConsultarPesos.jsp">Pesos  </a></li></ul>
                    </li>

                    <!--CERRAR SESION!!!1-->
                    <li onclick="cerrarSesion()" id = "CS" style="float:right" ><a href="IniciarSesion.jsp"><img class ="pequeña" src = "img/usuario.png">  Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>

        <label style="float: left" id = "usuario"> </label>

        <main>
            <div align ="center">
                <pre>

<font color="green" size ="17" face="Comic Sans MS,arial">
<a><i>Aquí empieza tu cambio, ¡ÁNIMO! </i></a>
</font>   
<img class="grande" src="img/fondo cliente.jpg"> <img class="grande" src="img/yoga.jpg">
            
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
