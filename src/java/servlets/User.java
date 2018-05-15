/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author THOR
 */
public class User extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        String errorMessage = "";
        if ("ELIMINAR USUARIO".equals(request.getParameter("ELIMINAR USUARIO"))) {
            String userName = request.getParameter("usuarioBorrar");
            try {
                usuarioDAO.eliminarUsuario(userName);
            } catch (Exception ex) {
                errorMessage = "Error al eliminar el usuario";
            }
            errorMessage = "Usuario " + userName + " eliminado con éxito";
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/eliminarUsuario.jsp");
        }
        if ("MODIFICAR CONTRASENYA".equals(request.getParameter("MODIFICAR CONTRASENYA"))) {
            modelo.User user = new modelo.User();
            try {
                user = usuarioDAO.getUserByUsername(request.getParameter("usuario"));
            } catch (Exception ex) {
                errorMessage = ex.getMessage();
            }
            String oldPassword = request.getParameter("oldPassword");
            String newPassword1 = request.getParameter("newPassword1");
            String newPassword2 = request.getParameter("newPassword2");

            if (!usuarioDAO.checkPasswords(newPassword1, newPassword2)) {
                errorMessage = "Las contraseñas no coinciden";
            }
            if (usuarioDAO.checkPasswords(oldPassword, newPassword1)) {
                errorMessage = "La nueva ontraseña no puede ser igual a la anterior";
            }
            if(usuarioDAO.checkPasswords(user.getPassword(), oldPassword)){
                errorMessage = "Contraseña incorrecta";
            }
            try {
                usuarioDAO.cambiarContraseña(user);
            } catch (Exception ex) {
                errorMessage = ex.getMessage();
            }
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/eliminarUsuario.jsp");
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
