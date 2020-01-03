/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package packDietVito;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.BD;

/**
 * @author June
 */
public class Servlet_Login extends HttpServlet {

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

        String email = request.getParameter("correo");
        String contra = request.getParameter("pass");
        System.out.println(email);
        System.out.println(contra);

        if (comprobarEmail(email) && comprobarContraseña(contra)) {
            if (email.equals("diet@diet.eus") && contra.equals("diet2019")) {
                //TODO OK, es el dietista
                //guarda los datos
                HttpSession s = request.getSession();
                s.setAttribute("email", request.getParameter("correo"));

                //cambia la pagina
                response.sendRedirect("Dietista.jsp");
            } else if (validar(email, contra)) {
                //TODO OK, es el cliente
                //guarda los datos
                HttpSession s = request.getSession();
                s.setAttribute("email", email);
                
                String nombre = calcNombre(email);
                s.setAttribute("nombre", nombre);
                
                String foto = calcFoto(email);
                s.setAttribute("foto", foto);
                
                //cambia la pagina
                //response.sendRedirect("Cliente.jsp");
                request.getRequestDispatcher("Cliente.jsp").forward(request, response);
            } else {
                response.sendRedirect("IniciarSesion.jsp");
            }
        }
        else {
            response.sendRedirect("IniciarSesion.jsp");
        }
            
    }

    //comprueba que el email sigue el patron
    public boolean comprobarEmail(String pEmail) {
        String pattern = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        return pEmail.matches(pattern);
    }

    //Comprueba que la contraseña sigue el patron
    public boolean comprobarContraseña(String pContraseña) {
        String pattern = "[a-z0-9]{4,10}";
        return pContraseña.matches(pattern);
    }

    //buscar el email en la bd
    public boolean validar(String email, String contraseña) {
        boolean encontrado = false;
        try {
            String e, c;
            con = BD.getConexion();
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM usuario");
            while (rs.next() || !encontrado) {
                e = rs.getString("Email");
                c = rs.getString("Contraseña");
                if (e.equals(email) && c.equals(contraseña)) {
                    encontrado = true;
                }
            }
            rs.close();
            set.close();
        } catch (SQLException ex1) {
            System.out.println("No lee de la tabla Usuario. " + ex1);
        }
        return encontrado;
    }

    public String calcNombre(String email) {
        String nombre = "";
        try {
            con = BD.getConexion();
            set = con.createStatement();
            rs = set.executeQuery("SELECT Nombre FROM usuario WHERE Email = '" + email + "';");
            rs.next();
            nombre = rs.getString("Nombre");
            rs.close();
            set.close();
        } catch (SQLException ex2) {
            System.out.println("No lee de la tabla Usuario. " + ex2);
        }             
        return nombre;
    }
    
    public String calcFoto(String email) {
        String foto = "";
        try {
            con = BD.getConexion();
            set = con.createStatement();
            rs = set.executeQuery("SELECT Foto FROM usuario WHERE Email = '" + email + "';");
            rs.next();
            foto = rs.getString("Foto");
            rs.close();
            set.close();
        } catch (SQLException ex2) {
            System.out.println("No lee de la tabla Usuario. " + ex2);
        }             
        return foto;
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
        //response.sendRedirect("Dietista.jsp");
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
