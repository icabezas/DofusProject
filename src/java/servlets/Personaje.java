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
        String errorMessage = "Personaje creado correctamente";
        if ("CREAR PERSONAJE".equals(request.getParameter("CREAR PERSONAJE"))) {
            try {
                String nombre = request.getParameter("nombrePersonaje");
                Raza raza = rasgosDAO.getRazaByName(request.getParameter("razaPersonaje"));
                Tipo tipo = rasgosDAO.getTipoByName(request.getParameter("tipoPersonaje"));
                modelo.User user = usuarioDAO.getUserByUsername(request.getParameter("usuario"));
                modelo.Personaje personaje = new modelo.Personaje();
                personaje.setUser(user);
                personaje.setNombre(nombre);
                personaje.setNivel(1);
                personaje.setRaza(raza);
                personaje.setTipo(tipo);
                personajeDAO.crearPersonaje(personaje);
            } catch (Exception ex) {
                errorMessage = "Error al crear el personaje";
            }
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/crearPersonaje.jsp");
        }
        if ("MODIFICAR PERSONAJE".equals(request.getParameter("MODIFICAR PERSONAJE"))) {

            String nombre = request.getParameter("nombrePersonaje");
            modelo.Personaje personaje = null;
            try {
                personaje = personajeDAO.getPersonajeByNombre(nombre);
            } catch (Exception ex) {
                errorMessage = "No se han podido recuperar los datos del personaje";
            }
            request.getSession(true).setAttribute("personaje", personaje);
            
            response.sendRedirect(request.getContextPath() + "/modificarPersonaje.jsp");
        }
        if ("MODIFICAR".equals(request.getParameter("MODIFICAR"))) {

            String nombre = request.getParameter("nombrePersonaje");
            modelo.Personaje personaje = null;
            try {
                personaje = personajeDAO.getPersonajeByNombre(nombre);
                Raza raza = rasgosDAO.getRazaByName(request.getParameter("raza"));
                personaje.setRaza(raza);
                Tipo tipo = rasgosDAO.getTipoByName(request.getParameter("tipo"));
                personajeDAO.modificarPersonaje(personaje);
            } catch (Exception ex) {
                errorMessage = "Error al modificar los datos del personaje";
            }
            request.getSession(true).setAttribute("status", personaje);
            
            response.sendRedirect(request.getContextPath() + "/mostrarPersonajes.jsp");
        }
        if ("ELIMINAR PERSONAJE".equals(request.getParameter("ELIMINAR PERSONAJE"))) {
            try {
                String nombre = request.getParameter("nombrePersonaje");
                modelo.Personaje personaje = personajeDAO.getPersonajeByNombre(nombre);
                personajeDAO.eliminarPersonaje(personaje);
            } catch (Exception ex) {
                errorMessage = "Error al eliminar el personaje";
            }
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/mainScreen.jsp");
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
