/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package packDietVito;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
public class S_RUsuario extends HttpServlet {

    private Connection con;
    private Statement set;
    private ResultSet rs;
    
    String c;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        //System.out.println("aqui");
        String email = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        String nombre = request.getParameter("nombre");
        String pesoI = request.getParameter("peso");
        String altura = request.getParameter("altura");
        String foto = request.getParameter("foto");        
        
        boolean existe = false;
        try {
            con = BD.getConexion();
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM usuario");
            while (rs.next()) {
                c = rs.getString("Email");
                c = c.trim();
                if (c.compareTo(email.trim()) == 0){
                    existe = true;
                }
            }
            rs.close();
            set.close();
        }
        catch (SQLException ex1) {
            System.out.println("No lee de la tabla usuario" + ex1);
        }
        try {
            set = con.createStatement();
            if (existe) {
                System.out.println("Usuario ya registrado");
            }
            else {
                set.executeUpdate("INSERT INTO usuario " 
                        + "(Email, Nombre, Contraseña, PesoInicial, Altura, Foto) VALUES ('" + email +"','"+ nombre + "', '"+ contrasena + "', '"+ pesoI +"', '"+ altura +"', '"+ foto +"')");
            }
            response.sendRedirect("RegistrarUsuario.jsp");
        }
        catch (SQLException ex2) {
            System.out.println("No inserta en la tabla usuarios" + ex2);
        } catch (IOException ex) {
            Logger.getLogger(S_RUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>

}
