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
import java.util.ArrayList;
import java.util.Hashtable;
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
public class Servlet_Pesos extends HttpServlet {

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

        String u;
        Float peso;
        Date fecha;

        // ArrayList<ArrayList<Float>> paraMostrar = new ArrayList<ArrayList<Float>>();
        Hashtable<Date, Float> paraMostrar = new Hashtable<Date, Float>();

        try {
            con = BD.getConexion();
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM peso");
            while (rs.next()) {
                rs.getString("Peso");
            }
            rs.close();
            set.close();
        } catch (SQLException ex1) {
            System.out.println("No lee de la tabla Pesos. " + ex1);
        }
        try {
            //Si es cliente registrado
            if (validar(cliente)) {
                try {
                    set = con.createStatement();
                    rs = set.executeQuery("SELECT * FROM peso");
                    while (rs.next()) {
                        peso = rs.getFloat("Peso");
                        u = rs.getString("usuarioEmail");
                        fecha = rs.getDate("Fecha");
                        //Si es el usuario que buscamos
                        if (u.equals(cliente)) {
                            //Si es entre las fechas que buscamos
                            if (fecha.after(fechaI) && fecha.before(fechaF)) {
                                //Meter en el array la fecha y el peso
                                paraMostrar.put(fecha, peso);
                            }
                        }
                    }
                    HttpSession s = request.getSession();
                s.setAttribute("paraMostrar", paraMostrar);
                //request.getRequestDispatcher("ConsultarPesos.jsp").forward(request, response);
                request.getRequestDispatcher("ConsultarPesosUsuario.jsp").forward(request, response);
                    rs.close();
                    set.close();
                } catch (SQLException ex) {
                    Logger.getLogger(S_RPesos.class.getName()).log(Level.SEVERE, null, ex);
                    response.sendRedirect("ConsultarPesosUsuario.jsp");
                }
                
            }
        } catch (IOException ex) {
            Logger.getLogger(S_RUsuario.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("RegistrarUsuario.jsp");
        }

    }
    //buscar que el email es de un usuario registrado

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
