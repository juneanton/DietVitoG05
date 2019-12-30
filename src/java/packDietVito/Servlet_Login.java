/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package packDietVito;

import java.awt.BorderLayout;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author June
 */
public class Servlet_Login extends HttpServlet {

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
        // response.sendRedirect("Dietista.jsp");

        if (comprobarEmail(email) && comprobarContraseña(contra)) {
            if (email.equals("diet@diet.eus") && contra.equals("diet2019")) {
                //TODO OK, es el dietista
                //guarda los datos
                HttpSession s = request.getSession();
                s.setAttribute("email", request.getParameter("correo"));

                //cambia la pagina
                //request.getRequestDispatcher("Dietista.jsp").forward(request,response); 
                response.sendRedirect("Dietista.jsp");
            } else if (buscarEmail(email) && buscarContraseña(contra)) {
                //TODO OK, es el cliente
                //guarda los datos
                HttpSession s = request.getSession();
                s.setAttribute("email", request.getParameter("correo"));
                //cambia la pagina
                //request.getRequestDispatcher("Cliente.jsp").forward(request,response); 
                response.sendRedirect("Cliente.jsp");
            }
        }
    }

    //comprueba que el email sigue el patron
    public boolean comprobarEmail(String pEmail) {
        //String pattern = "/^([a-zA-Z]+[a-zA-Z0-9._-]*)@{1}([a-zA-Z0-9\\.]{2,})\\.([a-zA-Z]{2,3})$/";
        String pattern = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        return pEmail.matches(pattern);
    }

    //Comprueba que la contraseña sigue el patron
    public boolean comprobarContraseña(String pContraseña) {
        //String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";  
        //String pattern = "/^[a-zA-Z0-9]{4,16}$/";
        String pattern = "[a-z0-9]{4,10}";
        return pContraseña.matches(pattern);
    }

    //buscar el email en la bd
    public boolean buscarEmail(String email) {
        //SIN HACER
        return true;
    }

    //Buscar contraseña en la bd
    public boolean buscarContraseña(String contraseña) {
        //SIN HACER
        return true;
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
