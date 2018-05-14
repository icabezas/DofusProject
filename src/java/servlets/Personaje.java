/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.PersonajeDAO;
import daos.RasgosDAO;
import daos.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Raza;
import modelo.Tipo;

/**
 *
 * @author THOR
 */
public class Personaje extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PersonajeDAO personajeDAO = new PersonajeDAO();
        RasgosDAO rasgosDAO = new RasgosDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        String errorMessage = "";
        if ("CREAR PERSONAJE".equals(request.getParameter("CREAR PERSONAJE"))) {
            try {
                String nombre = request.getParameter("nombrePersonaje");
                Raza raza  = rasgosDAO.getRazaByName(request.getParameter("razaPersonaje"));
                Tipo tipo  = rasgosDAO.getTipoByName(request.getParameter("tipoPersonaje"));
                User user =  (User)request.getSession(true).getAttribute("usuario");
                modelo.Personaje personaje = new modelo.Personaje();
                personaje.setNombre(nombre);
                personaje.setNivel(1);
                personaje.setRaza(raza);
                personaje.setTipo(tipo);
                personajeDAO.crearPersonaje(personaje);
            } catch (Exception ex) {
                errorMessage = "Error al crear el personaje";
            }
            request.getSession(true).setAttribute("errorMessage", errorMessage);
            response.sendRedirect(request.getContextPath() + "/crearPersonaje.jsp");
        }
        if ("MOSTRAR PERSONAJES".equals(request.getParameter("MOSTRAR PERSONAJES"))) {
            
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
