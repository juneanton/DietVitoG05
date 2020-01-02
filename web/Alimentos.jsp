<%-- 
    Document   : Alimentos
    Created on : 27 dic. 2019, 15:26:17
    Author     : June
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utils.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DietVito-Alimentos</title>
        <link rel="stylesheet" href="css/estilos.css">
        <!--<script src="js/IDB.js"></script>-->
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
                <li style="float:right" ><a href="IniciarSesion.jsp" ><img class ="pequeña" src = "img/usuario.png">  Iniciar sesión</a></li>
            </ul>
        </nav>

        <main>
            <div align="center">
                <p></p>
                <!--<p id ="imagenAlim"><img class="grande" src = "img/comida1.jpg"/></p>--> 
                <p></p>

                <p></p>
                <div id="elements">
                    <table width="50%" action="Alimentos">
                        <caption>Alimentos</caption>
                        <thead>
                            <tr>
                                <th>Alimento</th>
                                <th>Calorias</th>
                                <th>Descripción</th>
                                <th> </th>
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
                                            String nombre, descripcion;
                                            int calorias;
                                            stat = con.createStatement();
                                            String sql = "SELECT NombreAli, CaloriasAli, DescripcionAli FROM alimento";
                                            result = stat.executeQuery(sql);
                                            //coger el siguiente
                                            while (result.next()) {
                                                nombre = result.getString("NombreAli");
                                                descripcion = result.getString("DescripcionAli");
                                                calorias = result.getInt("CaloriasAli");
                                    %>                         
                            <tr><td><%=nombre%></td>
                                <td><%=calorias%></td>
                                <td><%=descripcion%></td></tr>
                                <%
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