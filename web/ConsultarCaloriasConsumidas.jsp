<%-- 
    Document   : ConsultarCaloriasConsumidas
    Created on : 27 dic. 2019, 15:34:43
    Author     : June
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="utils.BD"%>
<%@page import="java.sql.Date"%>
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
                           
                
                <li action ="CerrarSesion" id = "CS" style="float:right" ><a href="IniciarSesion.html"><img class ="pequeña" src = "img/usuario.png">  Cerrar sesión</a></li>
            </ul>
        </nav>
        
         <main id ="consultarCalo">
            <div align="center">
                <a> Consultar los alimentos consumidos: </a>
                <section id="FormularioCC">
                    <form name="informacion" method="post" action="SAlimConsumidos"> 
                        <p><label>Correo: <input type="email" name="correo" id="correo" required placeholder="ejemplo@ejemplo.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></label></p>
                        <p>Desde: <input type="date" name="fechaI" id="fechaI" required> Hasta: <input type="date" name="fechaF" id="fechaF" required></p>
                        <p><button type="submit" id="enviar">Aceptar</button></p>
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
                                        try {
                                            String ali, idUsu, miUsu;
                                            miUsu = (String) request.getAttribute("miUsu");
                                            int cal;
                                            Date fecha, fechaI, fechaF;
                                            fechaI = (Date) request.getAttribute("fechaI");
                                            fechaF = (Date) request.getAttribute("fechaF");
                                            stat = con.createStatement();
//                                            LAS CALORIAAAAAS
                                            String sql = "SELECT AlimentoIDAlimento, Calorias, IDFecha, UsuarioIDUsuario FROM consumoalimento";
                                            result = stat.executeQuery(sql);
                                            //coger el siguiente
                                            while (result.next()) {
                                                ali = result.getString("AlimentoIDAlimento");
                                                cal = result.getInt("Calorias");
                                                idUsu = result.getString("UsuarioIDUsuario");
                                                fecha = result.getDate("IDFecha");
                                                if (idUsu.equals(miUsu)) {
                                                    //QUE PASA SI ES LA PROPIA FECHA??????
                                                    if (fecha.after(fechaI) && fecha.before(fechaF)) {
                                    %>  
                            <tr><td><%=fecha%></td>
                                <td><%=ali%></td>
                                <td><%=cal%></td></tr>
                                <%
                                                    //cerramos ambos if
                                                    }
                                                }
                                            //cerramos el while
                                        }
                                        result.close();
                                        stat.close();
                                    } catch (Exception ex) {
                                        System.out.println("No se puede acceder a la BD " + ex);
                                        ex.printStackTrace();
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
