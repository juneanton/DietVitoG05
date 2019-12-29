/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package packDietVito;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        String contraseña = request.getParameter("contraseña");

        if (comprobarEmail(email) && comprobarContraseña(contraseña)) {
            if(email.equals("diet@diet.eus") && contraseña.equals("diet2019")){
                //TODO OK, es el dietista
                //guarda los datos
                request.getSession().setAttribute("email", request.getParameter("correo"));
                request.getSession().setAttribute("contraseña", request.getParameter("contraseña"));
                //cambia la pagina
                //request.getRequestDispatcher("Dietista.jsp").forward(request,response); 
                //System.out.println("muestra dietista");
                response.sendRedirect("Dietista.jsp");
            }
            else if (buscarEmail(email) && buscarContraseña(contraseña)) {
                //TODO OK, es el cliente
                //guarda los datos
                request.getSession().setAttribute("email", request.getParameter("correo"));
                request.getSession().setAttribute("contraseña", request.getParameter("contraseña"));
                //cambia la pagina
                request.getRequestDispatcher("Cliente.jsp").forward(request,response);  
            }
        }
    }

    //comprueba que el email sigue el patron
    public boolean comprobarEmail(String pEmail) {
        String pattern = "/^([a-zA-Z]+[a-zA-Z0-9._-]*)@{1}([a-zA-Z0-9\\.]{2,})\\.([a-zA-Z]{2,3})$/";
        return pEmail.matches(pattern);
    }

    //Comprueba que la contraseña sigue el patron
    public boolean comprobarContraseña(String pContraseña) {
        //String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";  
        String pattern = "/^[a-zA-Z0-9]{4,16}$/";
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
        processRequest(request, response);
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
