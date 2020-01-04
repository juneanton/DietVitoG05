<%-- 
    Document   : ConsultarActividadesRealizadas
    Created on : 27 dic. 2019, 15:30:44
    Author     : June
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utils.BD"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DietVito-Consultar Actividad</title>
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="icon" type="image/png" href="img/favicondietvito.png">
    </head>
    <body action ="Login"> 
        <header id="cabecera">
            <div>
                <img src="img/dietvito.png">
                <div style="float: right">
                    <a id ="holaU"><strong>Hola, <%=request.getSession().getAttribute("nombre")%> </strong></a>
                    <p id ="imagenU"><img class="normal" src="img/<%=request.getSession().getAttribute("foto")%>"></p> 
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
                           
                <!--CERRAR SESION!!!1-->
                <li action ="CerrarSesion" id = "CS" style="float:right" ><a href="IniciarSesion.jsp"><img class ="pequeña" src = "img/usuario.png">  Cerrar sesión</a></li>
            </ul>
        </nav>
        
        <main id ="consultarActi">
            <div align="center">
                <a> Consultar las actividades: </a>
                <section id="FormularioCA">
                    <form name="informacion" method="get" action="ActRealizadasYo"> 
                        <p><label>Correo: <input type="email" name="correo" id="correo" required placeholder="ejemplo@ejemplo.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></label></p>
                        <p>Desde: <input type="date" name="fechaI" id="fechaI" required> Hasta: <input type="date" name="fechaF" id="fechaF" required></p>
                        <p><button type="submit" id="enviar">Aceptar</button></p>
                    </form>
                </section>
                
                <article id="elements">
                    <table width="50%">
                        <caption>Actividades realizadas durante las fechas seleccionadas:</caption>
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Actividad</th>
                                <th>Calorias</th>
                            </tr>
                        </thead>
                        <tbody id="elementsList">
                            <tr>
                                <td colspan="3">
                                    <%!
                                        private Connection con;
                                        private Statement stat;
                                        private ResultSet result;

                                        //conectamos a la bd
                                        public void jspInit() {
                                            con = BD.getConexion();
                                        }
                                    %>
                                    <%
                                        Hashtable<Date, Hashtable<String, Integer>> paraMostrar = null;
                                        paraMostrar = (Hashtable<Date, Hashtable<String, Integer>>) session.getAttribute("paraMostrar");
                                        if (paraMostrar != null) {
                                            Enumeration fechas = paraMostrar.keys();
                                            while (fechas.hasMoreElements()) {
                                                Date fecha = (Date) fechas.nextElement();
                                                //Float peso = paraMostrar.get(fecha);
                                                Enumeration alimentos = paraMostrar.get(fechas).keys();
                                                while (alimentos.hasMoreElements()) {
                                                    String acti = (String) alimentos.nextElement();
                                                    Integer cal = (Integer) paraMostrar.get(fecha).get(acti);
                                    %>  
                            <tr><td><%=fecha%></td>
                                <td><%=acti%></td>
                                <td><%=cal%></td></tr>
                                <%
                                                    //cerramos
                                                    }
                                                }
                                        }
                                       
                                %>
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
