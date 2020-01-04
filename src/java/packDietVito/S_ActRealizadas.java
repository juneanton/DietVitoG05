/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package packDietVito;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.BD;

/**
 *
 * @author miren
 */
public class S_ActRealizadas extends HttpServlet {

    private Connection con;
    private Statement set;
    private ResultSet rs;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String cliente = request.getParameter("correo");
        String pfechaI = request.getParameter("fechaI");
        String pfechaF = request.getParameter("fechaF");
        
        Date fechaI = Date.valueOf(pfechaI);
        Date fechaF = Date.valueOf(pfechaF);

        Date fecha;
        String acti, u;
        int cal;
        
        Hashtable<Date, Hashtable<String, Integer>> paraMostrar = new Hashtable<Date, Hashtable<String, Integer>>();
        Hashtable<String, Integer> dentro = new Hashtable<String, Integer>();
        
        try {
           if (validar(cliente)) {
                set = con.createStatement();
                rs = set.executeQuery("SELECT * FROM actividadrealizada");
                while (rs.next()) {
                    fecha = rs.getDate("Fecha");
                    acti = rs.getString("ActividadIDActividad");
                    cal = rs.getInt("calorias");
                    u = rs.getString("UsuarioIDUsuario");
                    //Si es el usuario que buscamos
                    if(u.equals(cliente)) {
                        //Si es entre las fechas que buscamos
                         if (fecha.after(fechaI) && fecha.before(fechaF)) {
                                //Meter en el array la fecha y el peso
                                dentro.put(acti, cal);
                                paraMostrar.put(fecha, dentro);
                         }
                    } 
                }
                HttpSession s = request.getSession();
                s.setAttribute("paraMostrar", paraMostrar);
                System.out.println(paraMostrar);
                request.getRequestDispatcher("ConsultarActividadesRealizadasUsuario.jsp").forward(request, response);
                rs.close();
                set.close();
            }
           else {
               response.sendRedirect("RegistrarUsuario.jsp");
           }
        } catch (SQLException ex1) {
            System.out.println("No lee de la tabla Actividades Realizadas. " + ex1);
        }
        
         if (paraMostrar == null) {
            response.sendRedirect("ConsultarActividadesRealizadasUsuario.jsp");
        }
    }
    
    public boolean validar(String email) {
        boolean encontrado = false;
        try {
            String e;
            con = BD.getConexion();
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM usuario");
            while (rs.next() || !encontrado) {
                e = rs.getString("Email");
                if (e.equals(email)) {
                    encontrado = true;
                }
            }
        } catch (SQLException ex1) {
            System.out.println("No lee de la tabla Usuario. " + ex1);
        }
        return encontrado;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
