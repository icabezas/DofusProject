/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.UsuarioDAO;
import exceptions.DofusException;
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
        response.setContentType("text/html;charset=UTF-8");
        String errorMessage = "";
        //controlador de funciones de usuario
        UsuarioDAO usuariosDAO = new UsuarioDAO();

        String username = request.getParameter("inputUsername");
        String password1 = request.getParameter("inputPassword");
        String password2 = request.getParameter("inputRepitPassword");
        modelo.User user = new modelo.User();
        try {
            user = usuariosDAO.getUserByUsername(username);
        } catch (Exception ex) {

        }

        boolean exist = false;
        try {
            exist = usuariosDAO.existsUser(username);
        } catch (Exception ex) {

        }

        if ("Login".equals(request.getParameter("Login"))) {
            if (!exist) {
                errorMessage = "El nombre de usuario no existe en la DB";
                request.getSession(true).setAttribute("status", errorMessage);
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else {
                if (user.getPassword().equals(password1)) {
                    errorMessage = "";
                    request.getSession(true).setAttribute("usuario", user);
                    response.sendRedirect(request.getContextPath() + "/mainScreen.jsp");
                } else {
                    request.getSession(true).setAttribute("errorMessage", errorMessage);
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
            }
        }

        if ("Registrarse".equals(request.getParameter("Registrarse"))) {
            username = request.getParameter("inputUsername");

            if (!exist) {
                if (usuariosDAO.checkPasswords(password1, password2)) {
                    modelo.User usuario = new modelo.User();
                    usuario.setNombre(username);
                    usuario.setPassword(password1);
                    usuario.setIsadmin(false);
                    usuario.setLevel(1);
                    try {
                        usuariosDAO.newUser(usuario);
                        request.setAttribute("status", "Usuario registrado correctamente");
                    } catch (Exception ex) {
                        request.setAttribute("status", ex.getMessage());
                    }
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                } else {
                    request.setAttribute("status", "Las contraseñas no coinciden");
                    request.getRequestDispatcher("/nuevoUsuario.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("status", "Ya existe un usuario con ese username");
                request.getRequestDispatcher("/nuevoUsuario.jsp").forward(request, response);
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
