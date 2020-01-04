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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.BD;

/**
 *
 * @author June
 */
public class S_RActividades extends HttpServlet {

    private Connection con;
    private Statement set, st;
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
        String idAct = request.getParameter("opt");
        String idUsu = request.getParameter("correo");
        String fechaa = request.getParameter("fecha");
        String calorias ="";

        Date fecha = Date.valueOf(fechaa);

        try {
            con = BD.getConexion();
            set = con.createStatement();
            
            st = con.createStatement();
            rs = st.executeQuery("Select calorias from actividad WHERE Nombre = '"+idAct+"';");
            while (rs.next()) {
                calorias = rs.getString("calorias");
            }
            
            set.executeUpdate("INSERT INTO actividadrealizada "
                    + "(ActividadIDActividad, UsuarioIDUsuario, Fecha, calorias) VALUES ('" + idAct + "','" + idUsu + "', '" + fecha + "', '" + calorias + "')");
            response.sendRedirect("RegistrarActividad.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Actividades.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("RegistrarActividad.jsp");
        }
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
