/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author THOR
 */
public class Login extends HttpServlet {

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
        //controlador de funciones de usuario
        UsuarioDAO usuariosDAO = new UsuarioDAO();

        String username = request.getParameter("inputUsername");
        String password = request.getParameter("inputPassword");
        String errorMessage = "Password incorrecta";
        User usuario = usuariosDAO.getEmpleadoByUsername(username);
        if ("Login".equals(request.getParameter("Login"))) {
            if (usuario == null) {
                errorMessage = "El nombre de usuario no existe en la DB";
                request.getSession(true).setAttribute("errorMessage", errorMessage);
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            } else {
                if (usuario.getPassword().equals(password)) {
                    errorMessage = "";
                    request.getSession(true).setAttribute("usuario", usuario);
                    request.getSession(true).setAttribute("posicionEmpleado", -1);
                    response.sendRedirect(request.getContextPath() + "/userValidado.jsp");
                } else {
                    request.getSession(true).setAttribute("errorMessage", errorMessage);
                    response.sendRedirect(request.getContextPath() + "/login.jsp");
                }
            }
        }
        if ("New".equals(request.getParameter("Registrarse"))) {
            username = request.getParameter("inputUsername");
            if (ejb.getEmpleadoByUsername(username) == null) {
                String password = request.getParameter("password");
                String fullName = request.getParameter("nombrecompleto");
                String ciudad = request.getParameter("ciudad");
                String telefono = request.getParameter("telefono");

                entities.Empleado empleado = new entities.Empleado(username, password, fullName, telefono, ciudad);
                try {
                    ejb.insertEmpleado(empleado);
                    request.setAttribute("status", "todo ok");
                } catch (IncidenciasException ex) {
                    request.setAttribute("status", ex.getMessage());
                }
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                request.setAttribute("status", "Ya existe un usuario con ese username");
                request.getRequestDispatcher("/nuevoEmpleado.jsp").forward(request, response);
            }
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
