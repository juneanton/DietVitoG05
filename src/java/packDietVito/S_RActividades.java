/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package packDietVito;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.BD;

/**
 *
 * @author June
 */
public class S_RActividades extends HttpServlet {

    private Connection con;
    private Statement set;
    private ResultSet rs;

    public static Date convertir(String fecha) {
        String yyyy = fecha.substring(6);
        String mm = fecha.substring(3, 5);
        String dd = fecha.substring(0, 2);
        fecha = yyyy + "-" + mm + "-" + dd;

        Date date = Date.valueOf(fecha);
        return date;
    }

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
        String pfecha = request.getParameter("fecha");

        Date fecha = convertir(pfecha);

        String c;

        try {
            con = BD.getConexion();
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM actividad");
            while (rs.next()) {
                c = rs.getString("Nombre");
                c = c.trim();
            }
            rs.close();
            set.close();
        } catch (SQLException ex1) {
            System.out.println("No lee de la tabla Actividad. " + ex1);
        }

        try {
            set = con.createStatement();
            set.executeUpdate("INSERT INTO actividadrealizada "
                    + "(ActividadIDActividad, UsuarioIDUsuario, Fecha) VALUES ('" + idAct + "','" + idUsu + "', '" + fecha + "')");
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Actividades.class.getName()).log(Level.SEVERE, null, ex);
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