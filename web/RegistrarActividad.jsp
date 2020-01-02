<%-- 
    Document   : RegistrarActividad
    Created on : 27 dic. 2019, 15:47:17
    Author     : June
--%>

<%@page import="utils.BD"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="packDietVito.Servlet_Actividades" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DietVito-Registrar Actividad</title>
        <link rel="stylesheet" href="css/estilos.css">
        <!--<script src="js/IDB.js"></script>-->
        <link rel="icon" type="image/png" href="img/favicondietvito.png">
    </head>
    <body> 
        <header id="cabecera">
            <div>
               
                <img src="img/dietvito.png">
                <div style="float: right">
                    <a id ="holaU"><strong>Hola,  </strong></a> <!--nombre-->
                    <!--<a onload="saludarUsuario();"></a>--> 
                    
                    <!--<p id ="imagenU">imagen</p>--> 
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

                
                <li onclick="cerrarSesion()" id = "CS" style="float:right" ><a href="IniciarSesion.jsp"><img class ="pequeña" src = "img/usuario.png">  Cerrar sesión</a></li>
            </ul>
        </nav>

        <main id ="registrarActi">
            <div align="center">
                <div>
                    <p></p>
                </div>
                <p id = "imagenUsuario" ><img src = "img/deportes.png"/></p> 
                <p></p>
                <a> Registra las actividades que has realizado hoy: </a>
                <section id="FormularioRA">
                    <form name="informacion" method="post" action="SRActividades">
                        <p><label>Correo: <input type="email" name="correo" id="correo" required placeholder="ejemplo@ejemplo.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></label></p>
                        <p><label for="listado">Actividades: </label>
                            <select id="opt" name="opt" required>
                                
                                <option selected value="0" disabled> Seleccione una: </option>
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
                                        String nombre;
                                       
                                        stat = con.createStatement();
                                        String sql = "SELECT Nombre FROM actividad";
                                        result = stat.executeQuery(sql);
                                        //coger el siguiente
                                        while (result.next()) {
                                            nombre = result.getString("Nombre");
                                            if(nombre != ""){ //para que no coja blancos
                                                //NO FUNCIONA SIGUE SALIENDO PALABRAS SIN NADA
                                            
                                %>                         
                            <option><%=nombre%><option>
                              
                                    <%
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
<!--                            <option value="Correr">Correr</option>
                                <option value="Nadar">Nadar</option>
                                <option value="Andar">Andar</option>
                                <option value="Basket">Basket</option>
                                <option value="Futbol">Fútbol</option>-->
                            </select>
                        </p>
                        <p>Fecha y hora de la actividad: <input type="date" name="fecha" id ="fecha" required></p>

                        <p onclick="addActividad();"><button type="submit" id="enviarActi">Aceptar</button></p>
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
